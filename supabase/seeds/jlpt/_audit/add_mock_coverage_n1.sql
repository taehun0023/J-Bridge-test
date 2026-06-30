-- encoding: UTF-8
-- add_mock_coverage_n1.sql
-- N1 모의고사(言語知識) 출제 항목 중 학습 콘텐츠 누락분 추가
-- 어휘 6개 + 문법 3패턴 (〜ながらも는 N1에 기등록 확인 → 제외)
-- 중복 가드: WHERE NOT EXISTS (word / pattern 이 어느 레벨에든 존재하면 건너뜀)

-- ============================================================
-- N1 어휘 (6개)
-- ============================================================

-- 1. 友好 (ゆうこう)
--    출처: 空欄補充「長年の誤解が解け、両国は（　　）関係を取り戻した。」→ 友好
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '友好', 'ゆうこう', '우호', 'N1', '명사・형용동사',
       '長年の誤解が解け、両国は友好関係を取り戻した。',
       '오랜 오해가 풀려 양국은 우호 관계를 되찾았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '友好');

-- 2. 即座に (そくざに)
--    출처: 類義語「上司の指示を受け、彼は即座に行動を開始した。」→ 直ちに
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '即座に', 'そくざに', '즉시, 즉각', 'N1', '부사',
       '上司の指示を受け、彼は即座に行動を開始した。',
       '상사의 지시를 받아 그는 즉시 행동을 개시했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '即座に');

-- 3. 巧みに (たくみに)
--    출처: 類義語「彼女は仕事と家庭を巧みに両立させている。」→ 上手に
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '巧みに', 'たくみに', '능숙하게, 교묘하게', 'N1', '부사',
       '彼女は仕事と家庭を巧みに両立させている。',
       '그녀는 일과 가정을 능숙하게 양립시키고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '巧みに');

-- 4. 冷静沈着 (れいせいちんちゃく)
--    출처: 類義語「彼は困難な状況でも冷静沈着に対処した。」→ 落ち着いて
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '冷静沈着', 'れいせいちんちゃく', '냉정침착', 'N1', '형용동사・사자성어',
       '彼は困難な状況でも冷静沈着に対処した。',
       '그는 어려운 상황에서도 냉정침착하게 대처했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '冷静沈着');

-- 5. 糧 (かて)
--    출처: 空欄補充「失敗を（　　）として成長してきた」→ 糧
--          類義語「失敗を糧にして、さらに高みを目指した。」→ 成長のための力の源として
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '糧', 'かて', '양식, (정신적) 양분, 원동력', 'N1', '명사',
       '数多くの失敗を糧にして、彼は成長してきた。',
       '수많은 실패를 원동력 삼아 그는 성장해 왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '糧');

-- 6. 礎 (いしずえ)
--    출처: 空欄補充「あのとき言われたことが、今の私（　　）なっている。」→ の礎に
--          「〜の礎に」は語彙「礎」として登録するのが適切
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '礎', 'いしずえ', '주춧돌, 토대, 초석', 'N1', '명사',
       'あのとき言われたことが、今の私の礎になっている。',
       '그때 들었던 말이 지금의 나의 초석이 되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '礎');


-- ============================================================
-- N1 문법 (3패턴)
-- ============================================================

-- G1. 〜につれて (~에 따라, ~함에 따라)
--     출처: 空欄補充「不況が長引く（　　）、失業者の数は増え続けている。」→ につれて
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜につれて',
       '~에 따라, ~함에 따라',
       '物事が変化するのに比例して、別の変化も生じることを示す。',
       'N1',
       '動詞辞書形 / 名詞 + につれて',
       'change',
       '[{"ja": "不況が長引くにつれて、失業者の数は増え続けている。", "ko": "불황이 장기화됨에 따라 실업자 수는 계속 늘고 있다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜につれて');

-- G2. 〜でさえ (〜조차도, 〜마저도)
--     출처: 文章文法「専門家にしかできない」と思われていた業務（42）、AIが代替しつつある→ でさえ
--     N2「〜さえ（強調）」の複合助詞形。「N でさえ」の形で用いる。
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜でさえ',
       '~조차도, ~마저도 (극단적 예시)',
       '「〜さえ」の複合助詞形。体言＋で＋さえ の形をとり、極端な例を挙げて強調する。',
       'N1',
       '名詞 + でさえ',
       'emphasis',
       '[{"ja": "専門家でさえ解けないような問題が、AIには解けるようになった。", "ko": "전문가조차도 풀 수 없는 문제를 AI는 풀 수 있게 되었다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜でさえ');

-- G3. 〜今となっては (이제 와서는, 이제 와서 보면)
--     출처: 空欄補充「試験まで残り一週間しかない。（　　）、今から全力で取り組むしかない。」→ 今となっては
--     状況の変化後に残された選択肢のみを示す副詞句的表現。
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜今となっては',
       '이제 와서는, 이 상황이 된 이상',
       '状況がすでに変化してしまった後で、残る選択肢や現状を述べる表現。',
       'N1',
       '今となっては + 文（諦め・決意・事実確認）',
       'time',
       '[{"ja": "今となっては後悔してもしかたない。全力を尽くすほかない。", "ko": "이제 와서는 후회해도 소용없다. 최선을 다하는 수밖에 없다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜今となっては');

-- 【照合済み・追加不要なパターン一覧】
-- 〜ながらも: N1に登録済み (found_exact=t)
-- 〜たところで: N1・N2両方に登録済み
-- 〜ともあろう: N1に登録済み
-- 〜べく: N1・N2両方に登録済み
-- 〜に起因して: N1に登録済み (fix5_coverage.sql で追加済み)
-- 〜を通して: N2に登録済み
-- 〜とは: N1に登録済み
-- 〜をおして: N1に登録済み
-- 〜だけに: N2に登録済み
-- 〜とはいえ: N1・N2両方に登録済み
-- 〜はどうあれ: N1に登録済み
-- 〜たる: N1に登録済み
-- 〜を踏まえて: N1に登録済み
-- 〜のみならず: N1・N2両方に登録済み
-- 〜というのに: N1に登録済み
-- 〜にもかかわらず: N2に登録済み
-- 〜に値する: N1に登録済み
-- 〜を受けて: N1に登録済み (fix5_coverage.sql で追加済み)
-- 〜にあたり: N1に登録済み
-- 〜ものがある: N1・N2両方に登録済み
-- 〜にあって: N1に登録済み
-- 〜としても: N1・N2両方に登録済み
-- 〜を挙げて: N1に登録済み
