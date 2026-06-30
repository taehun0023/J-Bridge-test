-- encoding: UTF-8
-- N2 語彙シード batch 12 (130語)
-- テーマ: 災害・防災・安全・事件・事故・犯罪・軍事
-- 作成日: 2026-06-25
-- 除外済み(既存語): 地震・洪水・干ばつ・台風・火山(batch6), 救急・予防(batch6),
--   刑事・民事・弁護士・賠償・告訴・証拠・罰則・罰金・訴訟(batch4),
--   違反・違法・罰金(batch4), 危うい(batch1), 備える・逃れる・慌てる(batch1),
--   深刻(batch2), 緊急(batch3)
-- 読み確認: 標準辞書準拠

-- ============================================================
-- 災害・自然災害 (Disasters & Natural Calamities) — 名詞 22語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '災害', 'さいがい', '재해, 재난', 'N2', '명사', '自然災害による被害が拡大した。', '자연재해로 인한 피해가 확대되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='災害' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '被害', 'ひがい', '피해', 'N2', '명사', '台風の被害は甚大だった。', '태풍의 피해는 막대했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='被害' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '被災', 'ひさい', '피재, 재해를 입음', 'N2', '명사', '被災地の復興を支援する。', '피재지 복흥을 지원하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='被災' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '震災', 'しんさい', '진재, 지진 재해', 'N2', '명사', '震災の教訓を次世代に伝える。', '진재의 교훈을 다음 세대에 전하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='震災' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '津波', 'つなみ', '쓰나미, 지진해일', 'N2', '명사', '津波警報が沿岸部に発令された。', '쓰나미 경보가 해안 지역에 발령되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='津波' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '噴火', 'ふんか', '분화, 화산 폭발', 'N2', '명사', '火山の噴火で周辺が灰に覆われた。', '화산 분화로 주변이 재로 뒤덮였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='噴火' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '土砂崩れ', 'どしゃくずれ', '산사태', 'N2', '명사', '大雨で土砂崩れが発生した。', '폭우로 산사태가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='土砂崩れ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '崩壊', 'ほうかい', '붕괴', 'N2', '명사', '建物の崩壊により多くの人が負傷した。', '건물 붕괴로 많은 사람이 부상을 입었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='崩壊' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '豪雨', 'ごうう', '폭우, 호우', 'N2', '명사', '豪雨により河川が氾濫した。', '폭우로 인해 하천이 범람했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='豪雨' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '氾濫', 'はんらん', '범람', 'N2', '명사', '川の氾濫で住宅地が水に浸かった。', '강의 범람으로 주택가가 물에 잠겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='氾濫' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暴風', 'ぼうふう', '폭풍', 'N2', '명사', '暴風雨で木が根こそぎ倒れた。', '폭풍우로 나무가 뿌리째 쓰러졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暴風' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '雪崩', 'なだれ', '눈사태', 'N2', '명사', '山岳地帯で雪崩が起きた。', '산악 지대에서 눈사태가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雪崩' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '震度', 'しんど', '진도 (지진 강도)', 'N2', '명사', '震度6の地震が発生した。', '진도 6의 지진이 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='震度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '余震', 'よしん', '여진', 'N2', '명사', '本震の後も余震が続いた。', '본진 후에도 여진이 계속되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='余震' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '倒壊', 'とうかい', '도괴, 무너져 내림', 'N2', '명사', '古い建物が地震で倒壊した。', '오래된 건물이 지진으로 도괴되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='倒壊' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '停電', 'ていでん', '정전', 'N2', '명사', '台風の影響で広範囲の停電が発生した。', '태풍의 영향으로 광범위한 정전이 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='停電' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '断水', 'だんすい', '단수, 물 공급 중단', 'N2', '명사', '地震後に断水が続いた。', '지진 후에 단수가 계속되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='断水' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '火災', 'かさい', '화재', 'N2', '명사', '夜中に火災が発生し消防車が駆けつけた。', '한밤중에 화재가 발생해 소방차가 달려왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='火災' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '延焼', 'えんしょう', '연소, 불이 번짐', 'N2', '명사', '強風で隣の建物に延焼した。', '강풍으로 옆 건물로 불이 번졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='延焼' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '爆発', 'ばくはつ', '폭발', 'N2', '명사', '工場で爆発が起き、負傷者が出た。', '공장에서 폭발이 일어나 부상자가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='爆発' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '放射線', 'ほうしゃせん', '방사선', 'N2', '명사', '放射線の被曝量を測定した。', '방사선 피폭량을 측정했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='放射線' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '汚染物質', 'おせんぶっしつ', '오염 물질', 'N2', '명사', '工場から汚染物質が流出した。', '공장에서 오염 물질이 유출되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汚染物質' AND jlpt_level='N2');

-- ============================================================
-- 防災・安全 (Disaster Prevention & Safety) — 名詞 18語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '防災', 'ぼうさい', '방재, 재해 예방', 'N2', '명사', '防災訓練を毎年実施している。', '방재 훈련을 매년 실시하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='防災' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '避難', 'ひなん', '대피, 피난', 'N2', '명사', '住民は高台への避難を指示された。', '주민들은 높은 지대로 대피하라는 지시를 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='避難' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '警報', 'けいほう', '경보', 'N2', '명사', '大雨警報が発令された。', '대우 경보가 발령되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='警報' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '注意報', 'ちゅういほう', '주의보', 'N2', '명사', '強風注意報が出ているので外出を控えた。', '강풍 주의보가 내려져 외출을 자제했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='注意報' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訓練', 'くんれん', '훈련', 'N2', '명사', '消防訓練に全員が参加した。', '소방 훈련에 전원이 참가했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訓練' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '消火', 'しょうか', '소화, 불 끔', 'N2', '명사', '消火活動が迅速に行われた。', '소화 활동이 신속하게 이루어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='消火' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '消防', 'しょうぼう', '소방', 'N2', '명사', '消防署に緊急通報をした。', '소방서에 긴급 신고를 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='消防' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '救助', 'きゅうじょ', '구조', 'N2', '명사', '救助隊が現場に急行した。', '구조대가 현장으로 급행했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='救助' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '救出', 'きゅうしゅつ', '구출', 'N2', '명사', 'がれきの下から生存者が救出された。', '잔해 아래에서 생존자가 구출되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='救出' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '避難所', 'ひなんじょ', '대피소, 피난처', 'N2', '명사', '学校の体育館が避難所になった。', '학교 체육관이 대피소가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='避難所' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '支援物資', 'しえんぶっし', '지원 물자', 'N2', '명사', '被災地に支援物資が届いた。', '피재지에 지원 물자가 도착했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='支援物資' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '復興', 'ふっこう', '복흥, 재건', 'N2', '명사', '地域の復興には長い年月がかかる。', '지역 복흥에는 오랜 세월이 걸린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='復興' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '安否', 'あんぴ', '안부, 생사 여부', 'N2', '명사', '家族の安否を確認するために電話をかけた。', '가족의 안부를 확인하기 위해 전화를 걸었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安否' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '行方不明', 'ゆくえふめい', '행방불명', 'N2', '명사', '事故後に行方不明者の捜索が続いた。', '사고 후 행방불명자 수색이 계속되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='行方不明' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '死傷者', 'ししょうしゃ', '사상자', 'N2', '명사', '事故で多数の死傷者が出た。', '사고로 다수의 사상자가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='死傷者' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '負傷', 'ふしょう', '부상', 'N2', '명사', '事故で軽い負傷を負った。', '사고로 가벼운 부상을 입었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='負傷' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '応急処置', 'おうきゅうしょち', '응급처치', 'N2', '명사', '現場で応急処置が施された。', '현장에서 응급처치가 실시되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='応急処置' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '非常口', 'ひじょうぐち', '비상구', 'N2', '명사', '非常口の場所を事前に確認しておく。', '비상구 위치를 사전에 확인해 둔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='非常口' AND jlpt_level='N2');

-- ============================================================
-- 事件・事故 (Incidents & Accidents) — 名詞 22語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '事件', 'じけん', '사건', 'N2', '명사', '重大な事件が発生し警察が捜査を開始した。', '중대한 사건이 발생해 경찰이 수사를 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='事件' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '事故', 'じこ', '사고', 'N2', '명사', '交通事故で道路が渋滞した。', '교통사고로 도로가 정체되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='事故' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '衝突', 'しょうとつ', '충돌', 'N2', '명사', '車同士の衝突事故が起きた。', '차량 간 충돌 사고가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='衝突' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '墜落', 'ついらく', '추락', 'N2', '명사', '小型飛行機が山中に墜落した。', '소형 비행기가 산중에 추락했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='墜落' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '転落', 'てんらく', '전락, 추락', 'N2', '명사', '作業員が足場から転落した。', '작업원이 비계에서 추락했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='転落' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '脱線', 'だっせん', '탈선', 'N2', '명사', '列車が脱線し大きな被害が出た。', '열차가 탈선해 큰 피해가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脱線' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '漏洩', 'ろうえい', '누설, 유출', 'N2', '명사', '個人情報の漏洩が発覚した。', '개인정보 유출이 발각되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漏洩' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '捜索', 'そうさく', '수색', 'N2', '명사', '行方不明者の捜索が続いている。', '행방불명자 수색이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='捜索' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '目撃', 'もくげき', '목격', 'N2', '명사', '事件の目撃者が警察に証言した。', '사건 목격자가 경찰에 증언했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目撃' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '現場', 'げんば', '현장', 'N2', '명사', '警察が事件現場を封鎖した。', '경찰이 사건 현장을 봉쇄했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='現場' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '過失', 'かしつ', '과실, 실수', 'N2', '명사', '業務上の過失が問われた。', '업무상 과실이 문제가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='過失' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '原因究明', 'げんいんきゅうめい', '원인 규명', 'N2', '명사', '事故の原因究明に時間がかかった。', '사고의 원인 규명에 시간이 걸렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='原因究明' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '再発防止', 'さいはつぼうし', '재발 방지', 'N2', '명사', '再発防止のため対策を講じた。', '재발 방지를 위해 대책을 강구했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='再発防止' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '労働災害', 'ろうどうさいがい', '산업 재해', 'N2', '명사', '労働災害の件数が増加している。', '산업 재해 건수가 증가하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='労働災害' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '安全対策', 'あんぜんたいさく', '안전 대책', 'N2', '명사', '工事現場の安全対策を強化した。', '공사 현장의 안전 대책을 강화했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安全対策' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '危機管理', 'ききかんり', '위기 관리', 'N2', '명사', '企業の危機管理能力が問われた。', '기업의 위기 관리 능력이 문제가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='危機管理' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '人命', 'じんめい', '인명', 'N2', '명사', '人命救助を最優先に行動した。', '인명 구조를 최우선으로 행동했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人命' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '遭難', 'そうなん', '조난', 'N2', '명사', '登山中に遭難した登山者が救助された。', '등산 중 조난한 등산객이 구조되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='遭難' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '漂流', 'ひょうりゅう', '표류', 'N2', '명사', '嵐で船が漂流した。', '폭풍으로 배가 표류했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漂流' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '救急車', 'きゅうきゅうしゃ', '구급차', 'N2', '명사', '急いで救急車を呼んだ。', '급히 구급차를 불렀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='救急車' AND jlpt_level='N2');

-- ============================================================
-- 犯罪 (Crime) — 名詞 22語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '犯罪', 'はんざい', '범죄', 'N2', '명사', '犯罪の抑止に向けて対策が強化された。', '범죄 억제를 위해 대책이 강화되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='犯罪' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '犯人', 'はんにん', '범인', 'N2', '명사', '警察は犯人の逮捕に成功した。', '경찰은 범인 체포에 성공했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='犯人' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '容疑者', 'ようぎしゃ', '용의자', 'N2', '명사', '警察は容疑者を任意で事情聴取した。', '경찰은 용의자를 임의로 사정 청취했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='容疑者' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '被疑者', 'ひぎしゃ', '피의자', 'N2', '명사', '被疑者の権利が保障されなければならない。', '피의자의 권리가 보장되어야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='被疑者' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '被告', 'ひこく', '피고', 'N2', '명사', '被告は無罪を主張した。', '피고는 무죄를 주장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='被告' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '被害者', 'ひがいしゃ', '피해자', 'N2', '명사', '被害者への支援が急がれた。', '피해자에 대한 지원이 시급하게 이루어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='被害者' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逮捕', 'たいほ', '체포', 'N2', '명사', '容疑者が現行犯で逮捕された。', '용의자가 현행범으로 체포되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逮捕' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '捜査', 'そうさ', '수사', 'N2', '명사', '警察が本格的に捜査を開始した。', '경찰이 본격적으로 수사를 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='捜査' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '起訴', 'きそ', '기소', 'N2', '명사', '検察は容疑者を起訴した。', '검찰은 용의자를 기소했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='起訴' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '拘留', 'こうりゅう', '구류', 'N2', '명사', '容疑者は拘留されて取調べを受けた。', '용의자는 구류되어 취조를 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拘留' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '窃盗', 'せっとう', '절도', 'N2', '명사', '窃盗を繰り返していた男が逮捕された。', '절도를 반복하던 남성이 체포되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='窃盗' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '強盗', 'ごうとう', '강도', 'N2', '명사', '銀行に強盗が押し入った。', '은행에 강도가 침입했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='強盗' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '詐欺', 'さぎ', '사기', 'N2', '명사', '電話詐欺の被害が増えている。', '전화 사기 피해가 늘고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='詐欺' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暴力', 'ぼうりょく', '폭력', 'N2', '명사', '暴力行為は絶対に許されない。', '폭력 행위는 절대 용납될 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暴力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '脅迫', 'きょうはく', '협박', 'N2', '명사', '脅迫状が届いたと警察に届け出た。', '협박장이 왔다고 경찰에 신고했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脅迫' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '誘拐', 'ゆうかい', '유괴', 'N2', '명사', '子どもの誘拐事件に社会が震撼した。', '아동 유괴 사건에 사회가 충격을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誘拐' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '密輸', 'みつゆ', '밀수', 'N2', '명사', '麻薬の密輸を摘発した。', '마약 밀수를 적발했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='密輸' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不法', 'ふほう', '불법', 'N2', '명사', '不法行為に対して厳正に対処する。', '불법 행위에 대해 엄정하게 대처한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不法' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '共犯', 'きょうはん', '공범', 'N2', '명사', '事件には共犯者が複数いた。', '사건에는 공범이 여럿 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='共犯' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '自首', 'じしゅ', '자수', 'N2', '명사', '犯人は事件から数日後に自首した。', '범인은 사건 발생 수일 후 자수했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自首' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '有罪', 'ゆうざい', '유죄', 'N2', '명사', '裁判で有罪判決が下された。', '재판에서 유죄 판결이 내려졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='有罪' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '無罪', 'むざい', '무죄', 'N2', '명사', '長年の闘いの末に無罪が確定した。', '오랜 싸움 끝에 무죄가 확정되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='無罪' AND jlpt_level='N2');

-- ============================================================
-- 軍事・安全保障 (Military & Security) — 名詞 22語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '軍事', 'ぐんじ', '군사', 'N2', '명사', '軍事力の強化が論議されている。', '군사력 강화가 논의되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='軍事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '安全保障', 'あんぜんほしょう', '안전 보장, 안보', 'N2', '명사', '国の安全保障を確保するのが国家の使命だ。', '국가 안보를 확보하는 것이 국가의 사명이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安全保障' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '防衛', 'ぼうえい', '방위', 'N2', '명사', '自衛隊は国の防衛を担っている。', '자위대는 국가 방위를 담당하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='防衛' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '自衛隊', 'じえいたい', '자위대', 'N2', '명사', '自衛隊が災害派遣で活動した。', '자위대가 재해 파견으로 활동했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自衛隊' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '戦争', 'せんそう', '전쟁', 'N2', '명사', '戦争のない世界を目指す。', '전쟁 없는 세계를 지향한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='戦争' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '紛争', 'ふんそう', '분쟁', 'N2', '명사', '地域紛争が長期化している。', '지역 분쟁이 장기화되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='紛争' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '停戦', 'ていせん', '정전, 휴전', 'N2', '명사', '両国は停戦協定を結んだ。', '양국은 정전 협정을 맺었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='停戦' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '攻撃', 'こうげき', '공격', 'N2', '명사', 'サイバー攻撃が政府機関を標的にした。', '사이버 공격이 정부 기관을 표적으로 삼았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='攻撃' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '侵攻', 'しんこう', '침공', 'N2', '명사', '他国への侵攻は国際法で禁止されている。', '타국 침공은 국제법으로 금지되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='侵攻' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '占領', 'せんりょう', '점령', 'N2', '명사', '敵軍が都市を占領した。', '적군이 도시를 점령했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='占領' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '武器', 'ぶき', '무기', 'N2', '명사', '武器の輸出には厳しい規制がある。', '무기 수출에는 엄격한 규제가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='武器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '核兵器', 'かくへいき', '핵무기', 'N2', '명사', '核兵器の廃絶を国際社会に訴えた。', '핵무기 폐기를 국제 사회에 호소했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='核兵器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '兵士', 'へいし', '병사', 'N2', '명사', '多くの兵士が前線で戦った。', '많은 병사가 전선에서 싸웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='兵士' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '同盟', 'どうめい', '동맹', 'N2', '명사', '両国は軍事同盟を締結した。', '양국은 군사 동맹을 체결했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='同盟' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '制裁', 'せいさい', '제재', 'N2', '명사', '国際社会は経済制裁を発動した。', '국제 사회는 경제 제재를 발동했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='制裁' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '領土', 'りょうど', '영토', 'N2', '명사', '領土問題が両国間の緊張を高めた。', '영토 문제가 양국 간 긴장을 고조시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='領土' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '難民', 'なんみん', '난민', 'N2', '명사', '内戦によって難民が急増した。', '내전으로 인해 난민이 급증했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='難民' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '和平', 'わへい', '화평, 평화', 'N2', '명사', '和平交渉が難航している。', '화평 협상이 난항을 겪고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='和平' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '国境', 'こっきょう', '국경', 'N2', '명사', '国境を越えた支援が行われた。', '국경을 넘은 지원이 이루어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='国境' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'テロ', 'テロ', '테러', 'N2', '명사', 'テロ対策の強化が急務となっている。', '테러 대책 강화가 시급한 과제가 되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='テロ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '人質', 'ひとじち', '인질', 'N2', '명사', '犯人は人質をとって立てこもった。', '범인은 인질을 잡고 농성했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人質' AND jlpt_level='N2');

-- ============================================================
-- 動詞 (Verbs) — 災害・事件・犯罪・軍事 関連 24語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '溺れる', 'おぼれる', '익사하다, 물에 빠지다', 'N2', '동사', '川で子どもが溺れているのを見つけた。', '강에서 아이가 익사하고 있는 것을 발견했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='溺れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '避難する', 'ひなんする', '대피하다, 피난하다', 'N2', '동사', '住民は速やかに避難した。', '주민들은 신속하게 대피했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='避難する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '救助する', 'きゅうじょする', '구조하다', 'N2', '동사', '溺れている人を救助した。', '익사하고 있는 사람을 구조했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='救助する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '崩れる', 'くずれる', '무너지다, 붕괴하다', 'N2', '동사', '地震で壁が崩れた。', '지진으로 벽이 무너졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='崩れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '浸水する', 'しんすいする', '침수되다', 'N2', '동사', '床上まで浸水し家財が台無しになった。', '바닥 위까지 침수되어 가재도구가 못쓰게 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浸水する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '燃える', 'もえる', '타다, 불타다', 'N2', '동사', '火災で建物が燃えた。', '화재로 건물이 불탔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='燃える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '爆発する', 'ばくはつする', '폭발하다', 'N2', '동사', 'ガス管が爆発した。', '가스관이 폭발했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='爆発する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '目撃する', 'もくげきする', '목격하다', 'N2', '동사', '事件の瞬間を偶然目撃した。', '사건의 순간을 우연히 목격했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='目撃する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逮捕する', 'たいほする', '체포하다', 'N2', '동사', '警察が窃盗犯を逮捕した。', '경찰이 절도범을 체포했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逮捕する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '捜査する', 'そうさする', '수사하다', 'N2', '동사', '警察は事件を捜査している。', '경찰은 사건을 수사하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='捜査する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '通報する', 'つうほうする', '신고하다, 통보하다', 'N2', '동사', '不審者を見かけたらすぐ通報する。', '수상한 사람을 발견하면 바로 신고한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通報する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '侵入する', 'しんにゅうする', '침입하다', 'N2', '동사', '窃盗犯が深夜に家に侵入した。', '절도범이 심야에 집에 침입했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='侵入する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '傷つける', 'きずつける', '상처 입히다, 해치다', 'N2', '동사', '相手を傷つける言葉を使わないようにする。', '상대를 상처 입히는 말을 사용하지 않도록 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='傷つける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '脅かす', 'おびやかす', '위협하다, 협박하다', 'N2', '동사', '暴漢が市民を脅かした。', '폭한이 시민을 위협했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='脅かす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訴追する', 'そついする', '소추하다, 기소하다', 'N2', '동사', '検察は被告を訴追した。', '검찰은 피고를 소추했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訴追する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '封鎖する', 'ふうさする', '봉쇄하다', 'N2', '동사', '警察が現場周辺を封鎖した。', '경찰이 현장 주변을 봉쇄했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='封鎖する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '陥る', 'おちいる', '빠지다, 처하다', 'N2', '동사', '危機的な状況に陥った。', '위기적인 상황에 빠졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='陥る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '被る', 'こうむる', '입다, 당하다', 'N2', '동사', '台風で大きな損害を被った。', '태풍으로 큰 손해를 입었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='被る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '崩壊する', 'ほうかいする', '붕괴하다', 'N2', '동사', '建物が地震で崩壊した。', '건물이 지진으로 붕괴되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='崩壊する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '攻撃する', 'こうげきする', '공격하다', 'N2', '동사', '敵が拠点を攻撃した。', '적이 거점을 공격했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='攻撃する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '撤退する', 'てったいする', '철수하다', 'N2', '동사', '軍は戦線から撤退した。', '군은 전선에서 철수했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='撤退する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出動する', 'しゅつどうする', '출동하다', 'N2', '동사', '消防隊が火災現場に出動した。', '소방대가 화재 현장에 출동했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出動する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '監視する', 'かんしする', '감시하다', 'N2', '동사', '不審な動きを24時間監視した。', '수상한 움직임을 24시간 감시했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='監視する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '制圧する', 'せいあつする', '제압하다', 'N2', '동사', '警察が暴徒を制圧した。', '경찰이 폭도를 제압했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='制圧する' AND jlpt_level='N2');

-- ============================================================
-- な형용사・い형용사 (Adjectives) — 8語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '危機的', 'ききてき', '위기적', 'N2', 'な형용사', '危機的な状況を乗り越えた。', '위기적인 상황을 극복했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='危機的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '安全', 'あんぜん', '안전함', 'N2', 'な형용사', '安全な経路を確認してから出発した。', '안전한 경로를 확인한 후 출발했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安全' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '重大', 'じゅうだい', '중대함', 'N2', 'な형용사', '重大な過失が発覚した。', '중대한 과실이 발각되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='重大' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '緊迫', 'きんぱく', '긴박함', 'N2', 'な형용사', '現地は緊迫した状況が続いている。', '현지는 긴박한 상황이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緊迫' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '甚大', 'じんだい', '심대함, 막대함', 'N2', 'な형용사', '洪水の被害は甚大だった。', '홍수 피해는 막대했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='甚大' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '深刻化', 'しんこくか', '심각화, 심각해짐', 'N2', '명사', '問題が深刻化する前に対策を講じた。', '문제가 심각해지기 전에 대책을 강구했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='深刻化' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '惨い', 'むごい', '처참하다, 잔인하다', 'N2', 'い형용사', '惨い事件に社会が衝撃を受けた。', '처참한 사건에 사회가 충격을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='惨い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凄惨', 'せいさん', '처참함, 참혹함', 'N2', 'な형용사', '事故現場の凄惨な光景に言葉を失った。', '사고 현장의 처참한 광경에 말을 잃었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='凄惨' AND jlpt_level='N2');

-- ============================================================
-- 副詞 (Adverbs) — 4語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '緊急に', 'きんきゅうに', '긴급하게', 'N2', '부사', '緊急に対策を講じる必要がある。', '긴급하게 대책을 마련할 필요가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緊急に' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '突然', 'とつぜん', '갑자기, 돌연', 'N2', '부사', '突然の災害に誰もが驚いた。', '갑작스러운 재해에 모두가 놀랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='突然' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '直ちに', 'ただちに', '즉시, 당장', 'N2', '부사', '火災が発生したら直ちに避難する。', '화재가 발생하면 즉시 대피한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='直ちに' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '万一', 'まんいち', '만일, 만약', 'N2', '부사', '万一の事態に備えて備蓄品を用意した。', '만일의 사태에 대비해 비축품을 준비했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='万一' AND jlpt_level='N2');
