-- N1/N2 어휘 교차레벨 중복 164개 정리 (2026-06-27)
-- N1 확정 65개: N2에서 삭제, N2 확정 99개: N1에서 삭제
-- user_mastered_items 체크는 유지행으로 재매핑 (고아 0 보장)

-- 삭제 대상 쌍 구성 (del_id, keep_id)
CREATE TEMP TABLE vmap AS
-- N1 확정: N2 행 삭제 → N1 행 유지
SELECT vd.id AS del_id, vk.id AS keep_id
FROM jlpt_vocabulary vd
JOIN jlpt_vocabulary vk ON vk.word=vd.word AND vk.jlpt_level='N1'
WHERE vd.jlpt_level='N2'
  AND vd.word = ANY(ARRAY[
    'それゆえ','もはや','不当','与党','乏しい','代謝','仮説','促す','保全','偏見',
    '儀式','内閣','前提','動向','協定','収益','司法','合意','告知','告訴',
    '嘆く','安堵','実態','寛大','審議','届出','廃棄物','強制','待遇','慣習',
    '投薬','排出','推進する','措置','損失','政策','断層','施行','条約','概念',
    '気質','生態系','痛ましい','移民','突き止める','立法','罰則','脆い','苦悩','融資',
    '補償','補助金','規制','解雇','訴訟','評論','議決','財政','貧困','賃金',
    '賠償','遂行する','野党','阻む','骨格'
  ])
UNION ALL
-- N2 확정: N1 행 삭제 → N2 행 유지
SELECT vd.id AS del_id, vk.id AS keep_id
FROM jlpt_vocabulary vd
JOIN jlpt_vocabulary vk ON vk.word=vd.word AND vk.jlpt_level='N2'
WHERE vd.jlpt_level='N1'
  AND vd.word = ANY(ARRAY[
    'いかに','うんざり','くっきり','ぐんぐん','ざわざわ','しょんぼり','じわじわ','むかむか',
    'ニュアンス','不況','世紀','乗り切る','乗り込む','交渉','交渉する','依頼する',
    '倒産','几帳面','切り替える','判断','割り込む','効率','勤務','反応','反論する',
    '取り除く','取材','向き合う','告げる','呼びかける','図々しい','報道','失業','奥行き',
    '好況','年代','広まる','廃止する','引き起こす','後悔','後悔する','微妙','怪しい',
    '恐怖','感染','憧れ','憧れる','成り立つ','成果','批判する','把握する','拒否する',
    '挑む','採用','改める','改革','教養','斜面','昇進','柔軟','格差','民族',
    '治療','洪水','深める','滑らか','独占','理論','申し出る','空間','立ち寄る',
    '素材','絶望','縁','背景','脚本','著しい','衰える','裏切り','観点','証明',
    '認識する','誠実','読み取る','課題','赤字','転換する','辛い','追い求める','退職',
    '達成する','遺産','雷','霜','霧','頑固','風習','高まる','黒字'
  ]);

-- 가드: 정확히 164쌍이어야 진행
DO $$ BEGIN
  IF (SELECT count(*) FROM vmap) <> 164 THEN
    RAISE EXCEPTION 'vmap 쌍 수 = %, 기대값 164', (SELECT count(*) FROM vmap);
  END IF;
END $$;

-- 1) 양쪽 다 체크한 유저: 삭제행 중복체크 제거
DELETE FROM user_mastered_items umi USING vmap m
WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=m.del_id::text
  AND EXISTS (SELECT 1 FROM user_mastered_items u2
              WHERE u2.item_type='jlpt_vocabulary' AND u2.item_id=m.keep_id::text
                AND u2.user_id=umi.user_id);

-- 2) 나머지 체크 유지행으로 재매핑
UPDATE user_mastered_items SET item_id=m.keep_id::text
FROM vmap m
WHERE item_type='jlpt_vocabulary' AND item_id=m.del_id::text;

-- 3) 삭제 대상 어휘 행 삭제
DELETE FROM jlpt_vocabulary v USING vmap m WHERE v.id=m.del_id;

-- 결과 확인
SELECT jlpt_level, count(*) FROM jlpt_vocabulary WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;

-- 잔여 교차중복 확인 (0이어야 함)
SELECT count(*) AS 잔여중복
FROM jlpt_vocabulary n1
JOIN jlpt_vocabulary n2 ON n2.word=n1.word AND n2.jlpt_level='N2'
WHERE n1.jlpt_level='N1';

-- 고아 체크 확인 (0이어야 함)
SELECT count(*) AS 고아체크
FROM user_mastered_items umi
WHERE umi.item_type='jlpt_vocabulary'
  AND NOT EXISTS (SELECT 1 FROM jlpt_vocabulary v WHERE v.id::text=umi.item_id);
