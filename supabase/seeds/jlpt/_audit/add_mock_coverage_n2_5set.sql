-- =============================================================================
-- N2模擬5セット 言語知識250問 カバレッジ補完シード
-- 対象: n2_5set_gengo.txt から抽出したvocab/grammarアイテムのうち
--        DBに存在しないもののみを追加
-- 生成日: 2026-06-26
-- 照合方法:
--   vocab → jlpt_vocabulary.word で完全一致 + するを除いた名詞形も確認
--   grammar → jlpt_grammar.pattern で「〜」除去後の完全一致 + 括弧省略形も確認
-- =============================================================================
-- 照合結果サマリー:
--   抽出vocab (ユニーク): 135件  EXISTS: 125件  grammar側に存在: 10件  追加必要: 0件
--   抽出grammar (ユニーク): 63件  EXISTS (DB確認後): 47件  追加必要: 16件
-- =============================================================================

-- ===================================
-- vocab: 追加なし
-- ===================================
-- 以下のvocab MISSINGは全てjlpt_grammarテーブルに「〜X」形式で既存:
--   上で, ざるを得ない, つつある, に反して, に応じて,
--   にとって, にわたって, わけにはいかない, を問わず, をはじめ
-- → vocab追加不要（文法パターンとして管理）

-- ===================================
-- grammar: 16件追加
-- ===================================

-- 1. 〜一方（だ）: 状態が一方的に進行する
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜一方だ',
       '~하기만 하다, ~일 뿐이다',
       '状態が一方向に変化し続ける',
       'N2',
       '動詞辞書形＋一方だ',
       'change',
       '[{"ja":"少子化問題は深刻になる一方だ。","ko":"저출산 문제는 심각해지기만 한다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜一方だ');

-- 2. 〜うえに: さらにその上に（付加・強調）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜うえに',
       '~인 데다가, 게다가',
       'さらにその上に、加えて',
       'N2',
       '動詞普通形／イ形容詞／ナ形容詞な／名詞の＋うえに',
       'listing',
       '[{"ja":"この店は料理がおいしいうえに、値段も手頃だ。","ko":"이 가게는 음식이 맛있는 데다가 가격도 저렴하다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜うえに');

-- 3. 〜おそれがある: 好ましくない事態の可能性
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜おそれがある',
       '~할 우려가 있다',
       '好ましくない事態が起こる可能性がある',
       'N2',
       '動詞辞書形／動詞ない形＋おそれがある',
       'conjecture',
       '[{"ja":"台風が近づいているため、洪水になるおそれがある。","ko":"태풍이 접근하고 있어 홍수가 날 우려가 있다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜おそれがある');

-- 4. 〜ことで: 手段・原因を示す
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜ことで',
       '~함으로써, ~하는 것으로',
       '～という手段・行為によって',
       'N2',
       '動詞辞書形／た形＋ことで',
       'reason',
       '[{"ja":"チームで情報を共有することで、ミスを大幅に減らすことができた。","ko":"팀에서 정보를 공유함으로써 실수를 크게 줄일 수 있었다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ことで');

-- 5. 〜ことになった: 決定・経緯の結果（自然な流れ）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜ことになった',
       '~하게 되었다',
       '経緯の結果そうなった（話者の意志外）',
       'N2',
       '動詞辞書形／ない形＋ことになった',
       'change',
       '[{"ja":"会議の結果、プロジェクトを来月から開始することになった。","ko":"회의 결과 프로젝트를 다음 달부터 시작하게 되었다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ことになった');

-- 6. 〜ずに: 〜しないで（否定の付帯状況）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜ずに',
       '~하지 않고',
       '～しないで（否定の付帯状況）',
       'N2',
       '動詞ない形（ずに）／動詞語幹＋ずに（する→せずに）',
       'manner',
       '[{"ja":"彼女は傘を持たずに雨の中を帰った。","ko":"그녀는 우산을 들지 않고 빗속을 돌아갔다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ずに');

-- 7. 〜てたまらない: 感情・感覚が非常に強い
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜てたまらない',
       '~해서 견딜 수가 없다, 너무 ~하다',
       '感情・感覚が非常に強くて我慢できない',
       'N2',
       '動詞て形／イ形容詞くて＋たまらない',
       'degree',
       '[{"ja":"暑い日に外で運動して、のどが渇いてたまらない。","ko":"더운 날 밖에서 운동하니 목이 말라서 견딜 수가 없다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜てたまらない');

-- 8. 〜に先立ち: 〜に先行して、〜の前に
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜に先立ち',
       '~에 앞서, ~보다 먼저',
       '～に先行して、～の前に（改まった表現）',
       'N2',
       '名詞／動詞辞書形こと＋に先立ち（に先立って）',
       'time',
       '[{"ja":"システムのリリースに先立ち、最終テストを実施する。","ko":"시스템 릴리즈에 앞서 최종 테스트를 실시한다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に先立ち');

-- 9. 〜に沿って: 基準・方向に従って
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜に沿って',
       '~에 따라서, ~에 맞추어',
       '基準・計画・方針に従って行動する',
       'N2',
       '名詞＋に沿って',
       'manner',
       '[{"ja":"計画に沿って作業を進めれば、期日までに完成できるはずだ。","ko":"계획에 따라 작업을 진행하면 기한 내에 완성할 수 있을 것이다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に沿って');

-- 10. 〜に至る: ある結果・段階に達する
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜に至る',
       '~에 이르다, ~에 달하다',
       'ある事態・結果・段階にたどり着く',
       'N2',
       '名詞＋に至る / 動詞辞書形こと＋に至る',
       'change',
       '[{"ja":"長い交渉の末、ついに合意に至ることができた。","ko":"긴 협상 끝에 마침내 합의에 이를 수 있었다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に至る');

-- 11. 〜にとどまらず: 〜だけでなく、それを超えて
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜にとどまらず',
       '~에 그치지 않고, ~뿐만 아니라',
       '～だけでなく、それを超えてさらに広がる',
       'N2',
       '名詞＋にとどまらず',
       'listing',
       '[{"ja":"その問題は国内にとどまらず、国際社会全体に影響を与えている。","ko":"그 문제는 국내에 그치지 않고 국제 사회 전체에 영향을 미치고 있다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜にとどまらず');

-- 12. 〜によると: 情報源を示す（伝聞）
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜によると',
       '~에 의하면, ~에 따르면',
       '情報源を示す（〜によれば も同義）',
       'N2',
       '名詞＋によると／によれば',
       'manner',
       '[{"ja":"天気予報によると、明日は全国的に晴れるらしい。","ko":"일기 예보에 의하면 내일은 전국적으로 맑을 것 같다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜によると');

-- 13. 〜ぬきで: 〜を除いて、〜なしで
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜ぬきで',
       '~없이, ~을 빼고',
       '～を除外して、～なしで（ぬきにして も同義）',
       'N2',
       '名詞＋ぬきで（ぬきに・ぬきにして）',
       'manner',
       '[{"ja":"冗談はぬきで、今日の会議で何が一番重要でしたか？","ko":"농담은 빼고, 오늘 회의에서 무엇이 가장 중요했습니까?"}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ぬきで');

-- 14. 〜まま: ある状態が変わらずに続く
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜まま',
       '~한 채로, ~인 상태 그대로',
       'ある状態が変わらずに続く（状態の持続）',
       'N2',
       '動詞た形／ない形／イ形容詞い／名詞の＋まま',
       'manner',
       '[{"ja":"靴を履いたまま、部屋に上がらないでください。","ko":"신발을 신은 채로 방에 올라오지 마세요."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜まま');

-- 15. 〜ものなら: 実現困難な仮定・挑戦
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜ものなら',
       '~할 수 있다면, ~하려면 해봐라',
       '実現困難なことへの挑戦・条件（やってみろという気持ちを含む）',
       'N2',
       '動詞可能形＋ものなら',
       'condition',
       '[{"ja":"できるものならやってみろ。","ko":"할 수 있다면 해봐라."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ものなら');

-- 16. 〜ようとしない: 〜しようという意志がない
INSERT INTO jlpt_grammar (id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, example_sentences)
SELECT gen_random_uuid(),
       '〜ようとしない',
       '~하려 하지 않다',
       '～しようという意志・意欲がまったくない',
       'N2',
       '動詞意向形（〜よう）＋としない',
       'desire',
       '[{"ja":"彼は失敗しても、その原因を振り返ろうとしない。","ko":"그는 실패해도 그 원인을 되돌아보려 하지 않는다."}]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜ようとしない');
