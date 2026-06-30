-- encoding: UTF-8
-- JLPT N1 模試(本番) 言語知識（文字・語彙・文法） Set 2
-- quiz_id  : ad000001-0000-0000-0000-000000000121  ← n1_set2_setup.sql で作成済み
-- 45問: KANJI_READING×6, CONTEXT_WORD×7, PARAPHRASE×6, WORD_USAGE×6,
--        GRAMMAR_CHOICE×10, SENTENCE_ORDER×5, TEXT_GRAMMAR×5
-- question UUID : ad200001-0000-0000-0000-{sort 3桁 zero-pad}0
--                 例) sort_order=1  → ad200001-0000-0000-0000-000000000010
-- 正答 sort_order 分散:
--   Q1→1, Q2→2, Q3→3, Q4→4, Q5→1, Q6→2,
--   Q7→3, Q8→4, Q9→1, Q10→2, Q11→3, Q12→4, Q13→1,
--   Q14→2, Q15→3, Q16→4, Q17→1, Q18→2, Q19→3,
--   Q20→4, Q21→1, Q22→2, Q23→3, Q24→4, Q25→1,
--   Q26→2, Q27→3, Q28→4, Q29→1, Q30→2, Q31→3, Q32→4, Q33→1, Q34→2, Q35→3,
--   Q36→4, Q37→1, Q38→2, Q39→3, Q40→4,
--   Q41→1, Q42→2, Q43→3, Q44→4, Q45→1

-- ============================================================
-- 旧 AI 生成データ削除 (aee20xxx-... パターン)
-- ============================================================
DELETE FROM quiz_question_options
WHERE question_id IN (
  SELECT id FROM quiz_questions
  WHERE quiz_id = 'ad000001-0000-0000-0000-000000000121'
    AND id LIKE 'aee2%'
);
DELETE FROM quiz_questions
WHERE quiz_id = 'ad000001-0000-0000-0000-000000000121'
  AND id LIKE 'aee2%';

-- ============================================================
-- quiz_questions (45問)
-- ============================================================

-- ========== 問題1: KANJI_READING (Q1-Q6) ==========

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000010', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\nIT業界の<u>趨勢</u>を正確に読み取ることが、事業戦略の鍵となる。',
'vocabulary', 'KANJI_READING', true, 1, 1,
'「趨勢」は「すうせい」と読む。「物事の向かう大きな流れ・動向」を意味するN1重要語彙。「そうせい」「さいせい」「ちゅうせい」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000020', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の論文は主張の<u>脈絡</u>が明確で、非常に読みやすかった。',
'vocabulary', 'KANJI_READING', true, 1, 2,
'「脈絡」は「みゃくらく」と読む。「物事のつながり・筋道」を意味する。「みゃくかく」「みらく」「みゃくろく」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000030', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の幼少期の教育が、後の成功の<u>礎</u>となった。',
'vocabulary', 'KANJI_READING', true, 1, 3,
'「礎」は「いしずえ」と読む。「建物の土台・物事の基盤となるもの」を意味する。「きそ」「そなえ」「いわい」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000040', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n長年の議論はひとつの<u>帰結</u>に向かって収束しつつある。',
'vocabulary', 'KANJI_READING', true, 1, 4,
'「帰結」は「きけつ」と読む。「物事が最終的に落ち着く結末・論理的に導かれる結論」を意味する。「かいけつ」「きこう」「きそ」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000050', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n競争の激化とともに、非効率な企業は市場から<u>淘汰</u>されていく。',
'vocabulary', 'KANJI_READING', true, 1, 5,
'「淘汰」は「とうた」と読む。「競争・選別によって不適合なものが排除されること」を意味する。「どうた」「とうか」「とうし」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000060', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\nテレワークの普及により、現代の職場の<u>様相</u>は大きく変わった。',
'vocabulary', 'KANJI_READING', true, 1, 6,
'「様相」は「ようそう」と読む。「物事の状態・ありさま・局面」を意味する。「ようしょう」「さまそう」「ようか」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題2: CONTEXT_WORD (Q7-Q13) ==========

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000070', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n無断欠席は棄権と（　　）される場合がある。',
'vocabulary', 'CONTEXT_WORD', true, 1, 7,
'「〜と見なされる」は「〜であると判断されてそのように扱われる」という意味で、規約や法律上の取り扱いに多く使われる。「証明」「宣言」「断定」はいずれも「見なす」の「実態はともかく規則上そのように扱う」という特有のニュアンスを持たない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000080', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n現在の財政状況を（　　）、来年度の予算案を作成する必要がある。',
'vocabulary', 'CONTEXT_WORD', true, 1, 8,
'「踏まえる」は「物事を考慮の土台とする・根拠として十分に考慮する」という意味のN1重要語彙。「踏まえて」は「照らして（基準との比較）」「省みて（過去を振り返る）」「参照して（参考程度）」より、根拠・前提として深く考慮するというニュアンスを最も強く含み最適。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000090', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nAIを活用した新興企業の（　　）により、従来の産業構造が揺らいでいる。',
'vocabulary', 'CONTEXT_WORD', true, 1, 9,
'「台頭（たいとう）」は「新たな勢力が力をつけて表れてくること」を意味する。新興企業が力をつけて既存産業を揺るがしているという文脈に最も合う。「衰退」「消滅」「後退」はいずれも弱まる意味で文脈に反する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000100', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n少子高齢化の影響を受け、地方産業の（　　）が深刻な問題となっている。',
'vocabulary', 'CONTEXT_WORD', true, 1, 10,
'「衰退（すいたい）」は「勢いや規模が衰えて縮小すること」を意味する。少子高齢化という文脈では衰退方向の語のみが自然。「成長」「繁栄」「躍進」はすべて肯定的な変化を示し文脈に反する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000110', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n長時間労働の（　　）として、心身の疲弊や家庭崩壊が指摘されている。',
'vocabulary', 'CONTEXT_WORD', true, 1, 11,
'「弊害（へいがい）」は「害をもたらす結果・好ましくない影響」を意味する。心身の疲弊や家庭崩壊という否定的な内容が続くため「弊害」が最も適切。「効果」「恩恵」「成果」はすべて肯定的な結果を示す。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000120', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n今回の実験結果は、新薬の有効性を（　　）するものと受け取られた。',
'vocabulary', 'CONTEXT_WORD', true, 1, 12,
'「示唆（しさ）」は「直接表現せず、間接的にほのめかして知らせること」を意味する。実験結果という間接的根拠に対し、確実に証明するわけではなく可能性を示すという文脈に最も合う。「確定」「証明」「断言」は確実性が高い表現で過剰。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000130', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n契約の（　　）として、不動産を提供することが条件とされた。',
'vocabulary', 'CONTEXT_WORD', true, 1, 13,
'「担保（たんぽ）」は「債務の弁済を保証するために差し出す物・約束を保証するもの」を意味する法律・金融用語。「〜を担保として提供する」は定型的な表現。「証明」「根拠」「証拠」は担保の法的・物的な意味合いを持たない。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題3: PARAPHRASE (Q14-Q19) ==========

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000140', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n近年、即戦力を重視する<u>風潮</u>が企業の採用活動に影響している。',
'vocabulary', 'PARAPHRASE', true, 1, 14,
'「風潮（ふうちょう）」は「ある時代や社会に広まっている傾向・流れ・ムード」を意味する。「傾向」が最も意味が近い。「習慣」は繰り返される行動パターン、「制度」は組織的な仕組み、「規則」は定められた決まりで、いずれも「風潮」のニュアンスとは異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000150', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n今回の視察は、研修プログラムの<u>一環</u>として実施される。',
'vocabulary', 'PARAPHRASE', true, 1, 15,
'「一環（いっかん）」は「連続したものの一部・全体の計画の中のつながった要素」を意味する。「一部」が最も意味が近い。「方針」「目的」「手段」はそれぞれ異なる概念を指す。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000160', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n経済の回復<u>兆候</u>が見え始め、市場関係者の間に期待感が高まっている。',
'vocabulary', 'PARAPHRASE', true, 1, 16,
'「兆候（ちょうこう）」は「ある事態が起こりそうな前触れ・きざし」を意味する。「兆し（きざし）」が最も意味が近い。「証拠」は確実な根拠、「原因」は結果を生む要因、「事実」は確認された現実で、いずれも「前触れ」のニュアンスを持たない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000170', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n膠着した交渉を<u>打開</u>するため、第三者機関の介入が求められた。',
'vocabulary', 'PARAPHRASE', true, 1, 17,
'「打開（だかい）」は「行き詰まった状況を切り開いて前進すること」を意味する。「乗り越える」が最も意味が近い。「悪化させる」「先延ばしにする」は状況を改善しない表現、「見直す」は再確認することで意味が異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000180', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n労働環境の<u>是正</u>に向けて、会社は新たな施策を打ち出した。',
'vocabulary', 'PARAPHRASE', true, 1, 18,
'「是正（ぜせい）」は「誤り・不正・問題のある状態を正すこと」を意味する。「改善」が最も意味が近い。「廃止」は完全になくすこと、「促進」は推進すること、「拡大」は広げることで、いずれも「誤りを正す」というニュアンスとは異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000190', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n感染症の<u>収束</u>には、社会全体の協力が不可欠だ。',
'vocabulary', 'PARAPHRASE', true, 1, 19,
'「収束（しゅうそく）」は「混乱・問題などが落ち着いておさまること」を意味する。「終息」が最も意味が近い。「拡大」「深刻化」は逆の意味、「予防」は事前対策で文脈が異なる。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題4: WORD_USAGE (Q20-Q25) ==========

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000200', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「枠組み」',
'vocabulary', 'WORD_USAGE', true, 1, 20,
'「枠組み（わくぐみ）」は「物事の基本的な組み立て・制度や考え方の基盤となる構造・フレームワーク」を意味する抽象的な語。「法的な枠組みを整備する」が正しい用法。「写真を枠組みに入れる」「機械の枠組みが故障」は物理的なフレームを指す場合で「枠組み」の正用法ではない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000210', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「尺度」',
'vocabulary', 'WORD_USAGE', true, 1, 21,
'「尺度（しゃくど）」は「物事を測る基準・判断の基準」を意味する。「成功の尺度は人それぞれ」が正しい用法。「尺度する」という動詞用法は誤り。部屋の長さを測る道具は「物差し（ものさし）」であり「尺度」ではない。「試験の尺度に合格する」も不自然な用法。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000220', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「指標」',
'vocabulary', 'WORD_USAGE', true, 1, 22,
'「指標（しひょう）」は「何かを評価・判断するための基準となる数値や尺度」を意味する。「経済指標」「業績指標」のような形での使用が正しい。山道の案内には「道標（みちしるべ）」を使う。「試験の指標に合格」「データを指標で整理」は不自然な用法。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000230', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「財源」',
'vocabulary', 'WORD_USAGE', true, 1, 23,
'「財源（ざいげん）」は「予算や事業のための資金の出どころ・資金を生み出す源」を意味し、主に公的・政策的文脈で使われる。「福祉政策の財源を確保する」が正しい用法。建築設計には「設計」、個人の節約や資金調達には「資金」「お金」を使うのが自然。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000240', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「典型」',
'vocabulary', 'WORD_USAGE', true, 1, 24,
'「典型（てんけい）」は「あるカテゴリーを代表する最もわかりやすい例」を意味する。「完璧主義者の典型だと言える」が正しい用法。「典型を使って料理する」「試験で典型を覚える」「新システムの典型を確立する」はいずれも「典型」の意味・用法に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000250', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「真偽」',
'vocabulary', 'WORD_USAGE', true, 1, 25,
'「真偽（しんぎ）」は「本当であるかどうか・真実か虚偽かということ」を意味する。「情報の真偽を確かめる」が正しい用法。「真偽を持って」は不自然（誠意を表すなら「誠意を持って」）。「科学的な真偽」「真偽のある取引」はいずれも誤用。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題5: GRAMMAR_CHOICE (Q26-Q35) ==========

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000260', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の壮絶な体験談を聞き、涙（　　）。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 26,
'「涙を禁じえなかった」＝涙が抑えられなかったという意味。「〜を禁じえない」はN1文型で「どうしても〜せずにはいられない・〜を抑えることができない」を表す書き言葉的強調表現。「を免れなかった」は「避けられなかった」、「のみならず」は添加、「を禁じた」は逆の意味。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000270', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の無責任な発言は、聞くに（　　）ひどいものだった。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 27,
'「聞くに堪えない（たえない）」＝聞いていられないほどひどいという意味のN1文型。「〜に堪えない」は「〜に耐えられないほどひどい」という強い否定的評価を表す。「しかない」「違いない」「すぎない」はいずれも文法的・意味的に文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000280', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nこの判断が法律（　　）適切かどうかを検討する必要がある。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 28,
'「法律に照らして」＝法律を基準・規範として比較検討するという意味のN1表現。「〜に照らして」は「〜を基準として当てはめて判断する」という意味。「をよそに」は「〜を無視して」、「ともなしに」は「〜するともなく（意識せずに）」、「のいかんで」は「〜の内容次第で」で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000290', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n皆の協力（　　）、このプロジェクトの成功はありえなかった。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 29,
'「皆の協力なくして（は）」＝協力がなければ絶対に成功しなかったという強い必要条件。「〜なくして（は）」はN1文型で「〜がなければ・〜なしには」という強い強調表現。「なしに」もほぼ同義だが「なくして」がより格調高い書き言葉的表現として最も適切。「があれば」「なければ」は条件節として成立するが文体的な強調が弱い。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000300', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n重大なミスを犯した以上、上司に謝罪し（　　）だろう。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 30,
'「謝罪しないではすまない」＝謝罪しなければ済まない・謝罪せずには収まらないという社会的・道徳的な強い義務を表すN1文型。「〜ないではすまない」は「しなければ社会的に許容されない」という強い必然性を示す。「てもいられない」は「余裕がない」、「てしかるべき」は「当然すべき」、「かねない」は「かもしれない（可能性）」で文脈のニュアンスが異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000310', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n専門家（　　）意見が分かれるほど、この問題は複雑だ。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 31,
'「専門家にしてからが」＝専門家でさえも・専門家ですら、という意味のN1文型。「〜にしてからが」は予想外の対象にも当てはまることを強調する。「にとっては」は立場・視点、「においては」は場所・場面、「にかかわらず」は無関係を表し文脈が異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000320', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n新しいプロジェクトが始まって（　　）、休日も仕事のことが頭を離れない。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 32,
'「始まってからというもの」＝始まって以来ずっと、という継続的な変化を表すN1文型。「〜からというもの」は「〜して以来ずっと（継続した状態）」を表す。「だけあって」は結果の当然性、「からして」は様子から判断、「ともなれば」は「〜ともなると（場面・機会）」で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000330', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n学生の答案を改ざんするとは、教育者に（　　）行為だ。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 33,
'「教育者にあるまじき行為」＝教育者としてあってはならない・教育者にふさわしくない行為という意味のN1文語表現。「〜あるまじき」は「〜にはあるべきでない」という強い否定を表す。「よるべき」「あってこその」「値する」はいずれも「あるべきでない」という否定の意味を表せない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000340', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n長年の経験がある（　　）、彼の判断は常に的確だ。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 34,
'「長年の経験があるだけあって」＝長年の経験があるから当然・それだけの根拠があるという意味のN2文型。「〜だけあって」は「〜だけの価値・理由があって、当然の結果として」という肯定的評価の根拠を示す。「からこそ」も理由を表すが「だけあって」の方が経験が評価の根拠であるというニュアンスを強く表す。「ものの」は逆接、「ばかりか」は添加で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000350', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nその事故（　　）、会社は安全基準の見直しに着手した。',
'grammar', 'GRAMMAR_CHOICE', true, 1, 35,
'「その事故を契機に」＝その事故がきっかけとなって・その事故を転機として、という意味のN2文型。「〜を契機に」は「〜という出来事を新たな変化のきっかけとして」という意味。「にしたがい」は変化の並行、「にともなって」は同時変化、「を前に」は「〜を目前にして」で、いずれも「きっかけ」のニュアンスを持たない。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題6: SENTENCE_ORDER (Q36-Q40) ==========
-- 語群①②③④の順序 = options sort_order 1,2,3,4 と対応
-- ★は常に文中3番目の空欄位置

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000360', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の発言は物議を　＿＿　＿＿　★　＿＿　た。\n（語群：①呼ぶ　②ばかりか　③失わせ　④会社の信頼も）',
'grammar', 'SENTENCE_ORDER', true, 1, 36,
E'正しい語順は「呼ぶ→ばかりか→会社の信頼も→失わせ→た」。\n完成文：「彼の発言は物議を呼ぶばかりか、会社の信頼も失わせた」。\n★は3番目の「会社の信頼も」。「〜ばかりか〜も」は「〜だけでなく、さらに〜も」というN2文型で、否定的な事態が重なることを強調する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000370', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は窓の外を　＿＿　＿＿　★　＿＿　ふけっていた。\n（語群：①見て　②見ると　③物思いに　④もなしに）',
'grammar', 'SENTENCE_ORDER', true, 1, 37,
E'正しい語順は「見ると→もなしに→見て→物思いに→ふけっていた」。\n完成文：「彼は窓の外を見るともなしに見て、物思いにふけっていた」。\n★は3番目の「見て」。「〜るともなしに〜る」は「特に意識することなく、ぼんやりと〜する」というN1文型。「見るともなしに見て」が一つの慣用的表現として機能している。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000380', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n大事な場で名前を　＿＿　＿＿　★　＿＿　た。\n（語群：①忘れるとは　②ことこの上　③なかっ　④恥ずかしい）',
'grammar', 'SENTENCE_ORDER', true, 1, 38,
E'正しい語順は「忘れるとは→恥ずかしい→ことこの上→なかっ→た」。\n完成文：「大事な場で名前を忘れるとは恥ずかしいことこの上なかった」。\n★は3番目の「ことこの上」。「〜ことこの上（ない）」は「この上なく〜だ・これ以上ない〜だ」という最高度を表すN1文型。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000390', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n経済の　＿＿　＿＿　★　＿＿　してきた。\n（語群：①急速な発展　②に伴って　③都市集中も　④顕在化）',
'grammar', 'SENTENCE_ORDER', true, 1, 39,
E'正しい語順は「急速な発展→に伴って→都市集中も→顕在化→してきた」。\n完成文：「経済の急速な発展に伴って、都市集中も顕在化してきた」。\n★は3番目の「都市集中も」。「〜に伴って」は「〜の変化と同時に別の変化も起きる」を表すN2文型で、経済発展と都市集中という二つの変化の並行を示す。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000400', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n今後の交渉　＿＿　＿＿　★　＿＿　せざるをえない。\n（語群：①結果の　②いかんによっては　③変更　④計画を大幅に）',
'grammar', 'SENTENCE_ORDER', true, 1, 40,
E'正しい語順は「結果の→いかんによっては→計画を大幅に→変更→せざるをえない」。\n完成文：「今後の交渉結果のいかんによっては、計画を大幅に変更せざるをえない」。\n★は3番目の「計画を大幅に」。「〜のいかんによっては」は「〜の内容・状況次第では」というN1文型で、条件によって結果が変わる可能性を示す。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題7: TEXT_GRAMMAR (Q41-Q45) ==========
-- 共通地文（DX・IT社会・約400字）
-- 各問題で地文全体を繰り返し、対象空欄のみ（　　）に置き換える

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000410', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文章を読んで、後の問いに答えなさい。\n\nデジタルトランスフォーメーション（DX）という言葉が浸透して久しいが、実際に組織の変革を成し遂げている企業はごく少数に留まるという調査結果が示されている。最新のシステムやツールを導入することは確かに有益ではあるが、あくまでも変革の入り口（　　）。そのような技術的な変化が真に意義を持つのは、組織の文化や働き方に対する意識が根本から変われ（42）のことだ。すべての企業が先進国と同等のDX水準（43）、デジタル技術を活用した業務改善に組織全体で取り組むことは最低限の目標と言えるだろう。こうした取り組みには経営トップの強いコミットメントが不可欠なのは（44）、現場レベルでの実践的な取り組みを支援する仕組みづくりも欠かせない。しかし現実には、多くの経営者がDXの本質的な困難さを想像（45）まま、表面的な施策の導入で課題解決したと誤解しているケースが後を絶たない。\n\n（41）に入る最もよいものはどれか。',
'grammar', 'TEXT_GRAMMAR', true, 1, 41,
'「〜に過ぎない」は「〜にすぎない・ただ〜だけだ（限定・軽視）」というN2文型。「変革の入り口に過ぎない」＝きっかけでしかない・入り口に留まるという意味で、システム導入を変革本体と混同しないよう警告している。「に他ならない」は断定的強調、「に相違ない」は「〜に違いない」、「のみならず」は添加で、いずれも文意が異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000420', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文章を読んで、後の問いに答えなさい。\n\nデジタルトランスフォーメーション（DX）という言葉が浸透して久しいが、実際に組織の変革を成し遂げている企業はごく少数に留まるという調査結果が示されている。最新のシステムやツールを導入することは確かに有益ではあるが、あくまでも変革の入り口（41）。そのような技術的な変化が真に意義を持つのは、組織の文化や働き方に対する意識が根本から変われ（　　）のことだ。すべての企業が先進国と同等のDX水準（43）、デジタル技術を活用した業務改善に組織全体で取り組むことは最低限の目標と言えるだろう。こうした取り組みには経営トップの強いコミットメントが不可欠なのは（44）、現場レベルでの実践的な取り組みを支援する仕組みづくりも欠かせない。しかし現実には、多くの経営者がDXの本質的な困難さを想像（45）まま、表面的な施策の導入で課題解決したと誤解しているケースが後を絶たない。\n\n（42）に入る最もよいものはどれか。',
'grammar', 'TEXT_GRAMMAR', true, 1, 42,
'「変わればこそ（ればこそ）」＝変わって初めて・変わるからこそ、という意味のN1文型。「〜ればこそ」は「〜があって初めて結果が生まれる・〜が唯一の条件だ」という強い因果強調。「てしまえば」は完了仮定、「にしても」は逆接仮定、「ばかりか」は添加で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000430', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文章を読んで、後の問いに答えなさい。\n\nデジタルトランスフォーメーション（DX）という言葉が浸透して久しいが、実際に組織の変革を成し遂げている企業はごく少数に留まるという調査結果が示されている。最新のシステムやツールを導入することは確かに有益ではあるが、あくまでも変革の入り口（41）。そのような技術的な変化が真に意義を持つのは、組織の文化や働き方に対する意識が根本から変われ（42）のことだ。すべての企業が先進国と同等のDX水準（　　）、デジタル技術を活用した業務改善に組織全体で取り組むことは最低限の目標と言えるだろう。こうした取り組みには経営トップの強いコミットメントが不可欠なのは（44）、現場レベルでの実践的な取り組みを支援する仕組みづくりも欠かせない。しかし現実には、多くの経営者がDXの本質的な困難さを想像（45）まま、表面的な施策の導入で課題解決したと誤解しているケースが後を絶たない。\n\n（43）に入る最もよいものはどれか。',
'grammar', 'TEXT_GRAMMAR', true, 1, 43,
'「〜でないまでも」は「〜とは言えないまでも・〜ほどではなくても（次善の目標を提示）」というN1文型。「先進国と同等のDX水準でないまでも」＝先進国レベルには達していないとしても、という意味で次善策を提示する。「にかかわらず」は「〜に関係なく」、「をよそに」は「〜を無視して」、「はともかく」は「〜はさておき」で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000440', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文章を読んで、後の問いに答えなさい。\n\nデジタルトランスフォーメーション（DX）という言葉が浸透して久しいが、実際に組織の変革を成し遂げている企業はごく少数に留まるという調査結果が示されている。最新のシステムやツールを導入することは確かに有益ではあるが、あくまでも変革の入り口（41）。そのような技術的な変化が真に意義を持つのは、組織の文化や働き方に対する意識が根本から変われ（42）のことだ。すべての企業が先進国と同等のDX水準（43）、デジタル技術を活用した業務改善に組織全体で取り組むことは最低限の目標と言えるだろう。こうした取り組みには経営トップの強いコミットメントが不可欠なのは（　　）、現場レベルでの実践的な取り組みを支援する仕組みづくりも欠かせない。しかし現実には、多くの経営者がDXの本質的な困難さを想像（45）まま、表面的な施策の導入で課題解決したと誤解しているケースが後を絶たない。\n\n（44）に入る最もよいものはどれか。',
'grammar', 'TEXT_GRAMMAR', true, 1, 44,
'「〜はいうまでもなく」は「〜は当然のことで言及するまでもないが、さらに〜」というN1表現で、既知の事実に加えてより重要な事柄を提示する。「技術的整備が必要なのはいうまでもなく、人材育成が重要だ」＝技術面は当然として人材面こそが大切という論旨。「もちろんで」は接続が不自然、「言えば」は話題転換、「認めつつも」は逆接で文脈が異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ad200001-0000-0000-0000-000000000450', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
E'次の文章を読んで、後の問いに答えなさい。\n\nデジタルトランスフォーメーション（DX）という言葉が浸透して久しいが、実際に組織の変革を成し遂げている企業はごく少数に留まるという調査結果が示されている。最新のシステムやツールを導入することは確かに有益ではあるが、あくまでも変革の入り口（41）。そのような技術的な変化が真に意義を持つのは、組織の文化や働き方に対する意識が根本から変われ（42）のことだ。すべての企業が先進国と同等のDX水準（43）、デジタル技術を活用した業務改善に組織全体で取り組むことは最低限の目標と言えるだろう。こうした取り組みには経営トップの強いコミットメントが不可欠なのは（44）、現場レベルでの実践的な取り組みを支援する仕組みづくりも欠かせない。しかし現実には、多くの経営者がDXの本質的な困難さを想像（　　）まま、表面的な施策の導入で課題解決したと誤解しているケースが後を絶たない。\n\n（45）に入る最もよいものはどれか。',
'grammar', 'TEXT_GRAMMAR', true, 1, 45,
'「〜だにしない」は「〜すら/さえしない」という極端な否定を強調するN1古典的表現。「想像だにしない」＝想像すらしない、という意味で根本的な困難さを考えようともしない様子を強調する。「しない」「できない」は否定だが強調が弱い。「するまでも」は「するまでもない（する必要がない）」という意味で無関心とは異なる。')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- quiz_question_options (45問 × 4択 = 180選択肢)
-- ============================================================

-- Q1: KANJI_READING 趨勢 (正答=すうせい, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000010', 'すうせい', true,  1),
('ad200001-0000-0000-0000-000000000010', 'そうせい', false, 2),
('ad200001-0000-0000-0000-000000000010', 'さいせい', false, 3),
('ad200001-0000-0000-0000-000000000010', 'ちゅうせい', false, 4);

-- Q2: KANJI_READING 脈絡 (正答=みゃくらく, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000020', 'みゃくかく', false, 1),
('ad200001-0000-0000-0000-000000000020', 'みゃくらく', true,  2),
('ad200001-0000-0000-0000-000000000020', 'みらく',    false, 3),
('ad200001-0000-0000-0000-000000000020', 'みゃくろく', false, 4);

-- Q3: KANJI_READING 礎 (正答=いしずえ, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000030', 'きそ',    false, 1),
('ad200001-0000-0000-0000-000000000030', 'そなえ',  false, 2),
('ad200001-0000-0000-0000-000000000030', 'いしずえ', true,  3),
('ad200001-0000-0000-0000-000000000030', 'いわい',  false, 4);

-- Q4: KANJI_READING 帰結 (正答=きけつ, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000040', 'かいけつ', false, 1),
('ad200001-0000-0000-0000-000000000040', 'きこう',  false, 2),
('ad200001-0000-0000-0000-000000000040', 'きそ',    false, 3),
('ad200001-0000-0000-0000-000000000040', 'きけつ',  true,  4);

-- Q5: KANJI_READING 淘汰 (正答=とうた, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000050', 'とうた', true,  1),
('ad200001-0000-0000-0000-000000000050', 'どうた', false, 2),
('ad200001-0000-0000-0000-000000000050', 'とうか', false, 3),
('ad200001-0000-0000-0000-000000000050', 'とうし', false, 4);

-- Q6: KANJI_READING 様相 (正答=ようそう, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000060', 'ようしょう', false, 1),
('ad200001-0000-0000-0000-000000000060', 'ようそう',  true,  2),
('ad200001-0000-0000-0000-000000000060', 'さまそう',  false, 3),
('ad200001-0000-0000-0000-000000000060', 'ようか',    false, 4);

-- Q7: CONTEXT_WORD 見なす (正答=見なさ, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000070', '証明',  false, 1),
('ad200001-0000-0000-0000-000000000070', '宣言',  false, 2),
('ad200001-0000-0000-0000-000000000070', '見なさ', true,  3),
('ad200001-0000-0000-0000-000000000070', '断定',  false, 4);

-- Q8: CONTEXT_WORD 踏まえる (正答=踏まえて, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000080', '省みて',   false, 1),
('ad200001-0000-0000-0000-000000000080', '照らして',  false, 2),
('ad200001-0000-0000-0000-000000000080', '参照して',  false, 3),
('ad200001-0000-0000-0000-000000000080', '踏まえて',  true,  4);

-- Q9: CONTEXT_WORD 台頭 (正答=台頭, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000090', '台頭', true,  1),
('ad200001-0000-0000-0000-000000000090', '衰退', false, 2),
('ad200001-0000-0000-0000-000000000090', '消滅', false, 3),
('ad200001-0000-0000-0000-000000000090', '後退', false, 4);

-- Q10: CONTEXT_WORD 衰退 (正答=衰退, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000100', '成長', false, 1),
('ad200001-0000-0000-0000-000000000100', '衰退', true,  2),
('ad200001-0000-0000-0000-000000000100', '繁栄', false, 3),
('ad200001-0000-0000-0000-000000000100', '躍進', false, 4);

-- Q11: CONTEXT_WORD 弊害 (正答=弊害, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000110', '効果', false, 1),
('ad200001-0000-0000-0000-000000000110', '恩恵', false, 2),
('ad200001-0000-0000-0000-000000000110', '弊害', true,  3),
('ad200001-0000-0000-0000-000000000110', '成果', false, 4);

-- Q12: CONTEXT_WORD 示唆 (正答=示唆, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000120', '確定', false, 1),
('ad200001-0000-0000-0000-000000000120', '証明', false, 2),
('ad200001-0000-0000-0000-000000000120', '断言', false, 3),
('ad200001-0000-0000-0000-000000000120', '示唆', true,  4);

-- Q13: CONTEXT_WORD 担保 (正答=担保, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000130', '担保', true,  1),
('ad200001-0000-0000-0000-000000000130', '証明', false, 2),
('ad200001-0000-0000-0000-000000000130', '根拠', false, 3),
('ad200001-0000-0000-0000-000000000130', '証拠', false, 4);

-- Q14: PARAPHRASE 風潮 (正答=傾向, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000140', '習慣', false, 1),
('ad200001-0000-0000-0000-000000000140', '傾向', true,  2),
('ad200001-0000-0000-0000-000000000140', '制度', false, 3),
('ad200001-0000-0000-0000-000000000140', '規則', false, 4);

-- Q15: PARAPHRASE 一環 (正答=一部, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000150', '方針', false, 1),
('ad200001-0000-0000-0000-000000000150', '目的', false, 2),
('ad200001-0000-0000-0000-000000000150', '一部', true,  3),
('ad200001-0000-0000-0000-000000000150', '手段', false, 4);

-- Q16: PARAPHRASE 兆候 (正答=兆し, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000160', '証拠', false, 1),
('ad200001-0000-0000-0000-000000000160', '原因', false, 2),
('ad200001-0000-0000-0000-000000000160', '事実', false, 3),
('ad200001-0000-0000-0000-000000000160', '兆し', true,  4);

-- Q17: PARAPHRASE 打開 (正答=乗り越える, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000170', '乗り越える',    true,  1),
('ad200001-0000-0000-0000-000000000170', '悪化させる',    false, 2),
('ad200001-0000-0000-0000-000000000170', '先延ばしにする', false, 3),
('ad200001-0000-0000-0000-000000000170', '見直す',        false, 4);

-- Q18: PARAPHRASE 是正 (正答=改善, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000180', '廃止', false, 1),
('ad200001-0000-0000-0000-000000000180', '改善', true,  2),
('ad200001-0000-0000-0000-000000000180', '促進', false, 3),
('ad200001-0000-0000-0000-000000000180', '拡大', false, 4);

-- Q19: PARAPHRASE 収束 (正答=終息, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000190', '拡大',   false, 1),
('ad200001-0000-0000-0000-000000000190', '深刻化', false, 2),
('ad200001-0000-0000-0000-000000000190', '終息',   true,  3),
('ad200001-0000-0000-0000-000000000190', '予防',   false, 4);

-- Q20: WORD_USAGE 枠組み (正答=option4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000200', '彼は写真を枠組みに入れて、壁に飾った。',                            false, 1),
('ad200001-0000-0000-0000-000000000200', '新しい機械の枠組みが故障して、工場が止まった。',                      false, 2),
('ad200001-0000-0000-0000-000000000200', '彼女は枠組みを使って、プレゼンのスライドを作った。',                  false, 3),
('ad200001-0000-0000-0000-000000000200', '法的な枠組みを整備することで、市場の健全な競争を促進できる。',        true,  4);

-- Q21: WORD_USAGE 尺度 (正答=option1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000210', '成功の尺度は人それぞれ異なるため、一概に比較できない。',            true,  1),
('ad200001-0000-0000-0000-000000000210', '彼は尺度することなく、すぐに意見を述べた。',                        false, 2),
('ad200001-0000-0000-0000-000000000210', '試験の尺度に合格するため、毎日勉強した。',                          false, 3),
('ad200001-0000-0000-0000-000000000210', '彼女は尺度の正確さを使って、部屋の長さを測った。',                  false, 4);

-- Q22: WORD_USAGE 指標 (正答=option2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000220', '彼は山道の指標に従って歩いたが、迷子になってしまった。',            false, 1),
('ad200001-0000-0000-0000-000000000220', '経済指標の悪化が続き、景気後退への懸念が高まっている。',            true,  2),
('ad200001-0000-0000-0000-000000000220', '試験の指標に合格するため、毎日勉強した。',                          false, 3),
('ad200001-0000-0000-0000-000000000220', '指標を利用してスマートフォンのデータを整理した。',                  false, 4);

-- Q23: WORD_USAGE 財源 (正答=option3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000230', '彼は財源を節約するため、毎月の食費を減らした。',                    false, 1),
('ad200001-0000-0000-0000-000000000230', '新しいビルの財源設計が完成し、来年から建設が始まる予定だ。',        false, 2),
('ad200001-0000-0000-0000-000000000230', '財源を確保しなければ、この福祉政策を続けることはできない。',        true,  3),
('ad200001-0000-0000-0000-000000000230', '財源を借りることで、事業に必要な機材を揃えた。',                    false, 4);

-- Q24: WORD_USAGE 典型 (正答=option4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000240', 'この料理は典型を使って、もっと美しく仕上げることができる。',        false, 1),
('ad200001-0000-0000-0000-000000000240', '試験で典型を覚えることが、成績向上の鍵だ。',                        false, 2),
('ad200001-0000-0000-0000-000000000240', '新システムの典型を確立するため、試験運用が始まった。',              false, 3),
('ad200001-0000-0000-0000-000000000240', '彼の行動パターンは、完璧主義者の典型だと言えるだろう。',            true,  4);

-- Q25: WORD_USAGE 真偽 (正答=option1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000250', 'この情報の真偽を確かめるため、複数の情報源を当たった。',            true,  1),
('ad200001-0000-0000-0000-000000000250', '彼は真偽を持ってプロジェクトに臨んだ。',                            false, 2),
('ad200001-0000-0000-0000-000000000250', '科学的な真偽に基づく調査が行われた。',                              false, 3),
('ad200001-0000-0000-0000-000000000250', '真偽のある取引をするために、詳細な書類が必要だ。',                  false, 4);

-- Q26: GRAMMAR_CHOICE 〜を禁じえない (正答=を禁じえなかった, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000260', 'を免れなかった',   false, 1),
('ad200001-0000-0000-0000-000000000260', 'を禁じえなかった', true,  2),
('ad200001-0000-0000-0000-000000000260', 'のみならず',       false, 3),
('ad200001-0000-0000-0000-000000000260', 'を禁じた',         false, 4);

-- Q27: GRAMMAR_CHOICE 〜に堪えない (正答=たえない, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000270', 'しかない',  false, 1),
('ad200001-0000-0000-0000-000000000270', '違いない',  false, 2),
('ad200001-0000-0000-0000-000000000270', 'たえない',  true,  3),
('ad200001-0000-0000-0000-000000000270', 'すぎない',  false, 4);

-- Q28: GRAMMAR_CHOICE 〜に照らして (正答=に照らして, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000280', 'をよそに',    false, 1),
('ad200001-0000-0000-0000-000000000280', 'ともなしに',  false, 2),
('ad200001-0000-0000-0000-000000000280', 'のいかんで',  false, 3),
('ad200001-0000-0000-0000-000000000280', 'に照らして',  true,  4);

-- Q29: GRAMMAR_CHOICE 〜なくして (正答=なくして, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000290', 'なくして', true,  1),
('ad200001-0000-0000-0000-000000000290', 'があれば', false, 2),
('ad200001-0000-0000-0000-000000000290', 'なければ', false, 3),
('ad200001-0000-0000-0000-000000000290', 'なしに',   false, 4);

-- Q30: GRAMMAR_CHOICE 〜ないではすまない (正答=ないではすまない, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000300', 'てもいられない',    false, 1),
('ad200001-0000-0000-0000-000000000300', 'ないではすまない',  true,  2),
('ad200001-0000-0000-0000-000000000300', 'てしかるべき',      false, 3),
('ad200001-0000-0000-0000-000000000300', 'かねない',          false, 4);

-- Q31: GRAMMAR_CHOICE 〜にしてからが (正答=にしてからが, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000310', 'にとっては',    false, 1),
('ad200001-0000-0000-0000-000000000310', 'においては',    false, 2),
('ad200001-0000-0000-0000-000000000310', 'にしてからが',  true,  3),
('ad200001-0000-0000-0000-000000000310', 'にかかわらず',  false, 4);

-- Q32: GRAMMAR_CHOICE 〜からというもの (正答=からというもの, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000320', 'だけあって',     false, 1),
('ad200001-0000-0000-0000-000000000320', 'からして',       false, 2),
('ad200001-0000-0000-0000-000000000320', 'ともなれば',     false, 3),
('ad200001-0000-0000-0000-000000000320', 'からというもの', true,  4);

-- Q33: GRAMMAR_CHOICE 〜あるまじき (正答=あるまじき, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000330', 'あるまじき',   true,  1),
('ad200001-0000-0000-0000-000000000330', 'よるべき',     false, 2),
('ad200001-0000-0000-0000-000000000330', 'あってこその', false, 3),
('ad200001-0000-0000-0000-000000000330', '値する',       false, 4);

-- Q34: GRAMMAR_CHOICE 〜だけあって (正答=だけあって, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000340', 'からこそ',   false, 1),
('ad200001-0000-0000-0000-000000000340', 'だけあって', true,  2),
('ad200001-0000-0000-0000-000000000340', 'ものの',     false, 3),
('ad200001-0000-0000-0000-000000000340', 'ばかりか',   false, 4);

-- Q35: GRAMMAR_CHOICE 〜を契機に (正答=を契機に, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000350', 'にしたがい',   false, 1),
('ad200001-0000-0000-0000-000000000350', 'にともなって', false, 2),
('ad200001-0000-0000-0000-000000000350', 'を契機に',     true,  3),
('ad200001-0000-0000-0000-000000000350', 'を前に',       false, 4);

-- Q36: SENTENCE_ORDER ★=会社の信頼も (正答=sort_order 4)
-- 語順: 呼ぶ→ばかりか→会社の信頼も(★)→失わせ→た
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000360', '呼ぶ',        false, 1),
('ad200001-0000-0000-0000-000000000360', 'ばかりか',    false, 2),
('ad200001-0000-0000-0000-000000000360', '失わせ',      false, 3),
('ad200001-0000-0000-0000-000000000360', '会社の信頼も', true,  4);

-- Q37: SENTENCE_ORDER ★=見て (正答=sort_order 1)
-- 語順: 見ると→もなしに→見て(★)→物思いに→ふけっていた
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000370', '見て',    true,  1),
('ad200001-0000-0000-0000-000000000370', '見ると',  false, 2),
('ad200001-0000-0000-0000-000000000370', '物思いに', false, 3),
('ad200001-0000-0000-0000-000000000370', 'もなしに', false, 4);

-- Q38: SENTENCE_ORDER ★=ことこの上 (正答=sort_order 2)
-- 語順: 忘れるとは→恥ずかしい→ことこの上(★)→なかっ→た
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000380', '忘れるとは', false, 1),
('ad200001-0000-0000-0000-000000000380', 'ことこの上', true,  2),
('ad200001-0000-0000-0000-000000000380', 'なかっ',    false, 3),
('ad200001-0000-0000-0000-000000000380', '恥ずかしい', false, 4);

-- Q39: SENTENCE_ORDER ★=都市集中も (正答=sort_order 3)
-- 語順: 急速な発展→に伴って→都市集中も(★)→顕在化→してきた
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000390', '急速な発展', false, 1),
('ad200001-0000-0000-0000-000000000390', 'に伴って',  false, 2),
('ad200001-0000-0000-0000-000000000390', '都市集中も', true,  3),
('ad200001-0000-0000-0000-000000000390', '顕在化',    false, 4);

-- Q40: SENTENCE_ORDER ★=計画を大幅に (正答=sort_order 4)
-- 語順: 結果の→いかんによっては→計画を大幅に(★)→変更→せざるをえない
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000400', '結果の',        false, 1),
('ad200001-0000-0000-0000-000000000400', 'いかんによっては', false, 2),
('ad200001-0000-0000-0000-000000000400', '変更',          false, 3),
('ad200001-0000-0000-0000-000000000400', '計画を大幅に',   true,  4);

-- Q41: TEXT_GRAMMAR blank 41 に過ぎない (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000410', 'に過ぎない',  true,  1),
('ad200001-0000-0000-0000-000000000410', 'に他ならない', false, 2),
('ad200001-0000-0000-0000-000000000410', 'に相違ない',  false, 3),
('ad200001-0000-0000-0000-000000000410', 'のみならず',  false, 4);

-- Q42: TEXT_GRAMMAR blank 42 ればこそ (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000420', 'てしまえば', false, 1),
('ad200001-0000-0000-0000-000000000420', 'ればこそ',   true,  2),
('ad200001-0000-0000-0000-000000000420', 'にしても',   false, 3),
('ad200001-0000-0000-0000-000000000420', 'ばかりか',   false, 4);

-- Q43: TEXT_GRAMMAR blank 43 でないまでも (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000430', 'にかかわらず',  false, 1),
('ad200001-0000-0000-0000-000000000430', 'をよそに',      false, 2),
('ad200001-0000-0000-0000-000000000430', 'でないまでも',  true,  3),
('ad200001-0000-0000-0000-000000000430', 'はともかく',    false, 4);

-- Q44: TEXT_GRAMMAR blank 44 いうまでもなく (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000440', 'もちろんで',     false, 1),
('ad200001-0000-0000-0000-000000000440', '言えば',         false, 2),
('ad200001-0000-0000-0000-000000000440', '認めつつも',     false, 3),
('ad200001-0000-0000-0000-000000000440', 'いうまでもなく', true,  4);

-- Q45: TEXT_GRAMMAR blank 45 だにしない (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ad200001-0000-0000-0000-000000000450', 'だにしない',  true,  1),
('ad200001-0000-0000-0000-000000000450', 'しない',      false, 2),
('ad200001-0000-0000-0000-000000000450', 'できない',    false, 3),
('ad200001-0000-0000-0000-000000000450', 'するまでも',  false, 4);

-- ============================================================
-- 検証コメント
-- ============================================================
-- 総問題数 : 45問
--   KANJI_READING  : 6問  (sort_order  1〜 6)
--   CONTEXT_WORD   : 7問  (sort_order  7〜13)
--   PARAPHRASE     : 6問  (sort_order 14〜19)
--   WORD_USAGE     : 6問  (sort_order 20〜25)
--   GRAMMAR_CHOICE :10問  (sort_order 26〜35)
--   SENTENCE_ORDER : 5問  (sort_order 36〜40)
--   TEXT_GRAMMAR   : 5問  (sort_order 41〜45)
-- 総選択肢 : 45 × 4 = 180
-- 正答 sort_order 分散: 1=11回, 2=11回, 3=12回, 4=11回
-- question_category: vocabulary(問題1〜4), grammar(問題5〜7)
-- TEXT_GRAMMAR 共通地文: DX/IT社会テーマ (~400字)
--   [41]〜に過ぎない  [42]〜ればこそ  [43]〜でないまでも
--   [44]〜はいうまでもなく  [45]〜だにしない
