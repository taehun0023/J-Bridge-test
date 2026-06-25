-- encoding: UTF-8
-- JLPT N1 模試(本番) 言語知識 Set3
-- quiz_id: ad000001-0000-0000-0000-000000000131
-- 45問: KANJI_READING×6, CONTEXT_WORD×7, PARAPHRASE×6, WORD_USAGE×6, GRAMMAR_CHOICE×10, SENTENCE_ORDER×5, TEXT_GRAMMAR×5
-- UUID: aee30001-0000-0000-0000-000000000003 ~ aee30045-0000-0000-0000-000000000003
-- 正答 sort_order 分散:
--   Q1→1, Q2→2, Q3→3, Q4→4, Q5→1, Q6→2
--   Q7→3, Q8→4, Q9→1, Q10→2, Q11→3, Q12→4, Q13→1
--   Q14→2, Q15→3, Q16→4, Q17→1, Q18→2, Q19→3
--   Q20→4, Q21→1, Q22→2, Q23→3, Q24→4, Q25→1
--   Q26→2, Q27→3, Q28→4, Q29→1, Q30→2, Q31→3, Q32→4, Q33→1, Q34→2, Q35→3
--   Q36→4, Q37→1, Q38→2, Q39→3, Q40→4
--   Q41→1, Q42→2, Q43→3, Q44→4, Q45→1

-- ============================================================
-- quiz_questions (45問)
-- ============================================================

-- ========== 問題1: KANJI_READING (Q1-Q6) ==========
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30001-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\nその画家は晩年、<u>隠遁</u>生活を送りながら傑作を生み出し続けた。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「隠遁」は「いんとん」と読む。「世俗を離れてひっそりと暮らすこと」を意味するN1重要語彙。「かくとん」「いんとう」「おんとん」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30002-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の<u>卓抜</u>した語学力は、留学生の中でも際立っていた。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「卓抜」は「たくばつ」と読む。「他より飛び抜けて優れていること」を意味する。「たくはつ」「だくばつ」「たくぬけ」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30003-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n政府は経済の<u>逼迫</u>した状況を打開するため、新たな政策を打ち出した。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「逼迫」は「ひっぱく」と読む。「余裕がなく、さし迫った状態であること」を意味する。「ひんぱく」「ひっぱつ」「ひっぱく」が正解で、「ひっぱつ」「きっぱく」「ひんぱく」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30004-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の<u>韜晦</u>した物言いに、周囲はその真意を測りかねた。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「韜晦」は「とうかい」と読む。「自分の才能や本心などをわざと隠すこと」を意味する。「とうかい」が正解で、「たいかい」「とかい」「とうがい」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30005-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n長い交渉の末、両社は<u>妥結</u>に至った。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「妥結」は「だけつ」と読む。「交渉・話し合いがまとまること」を意味する。「たけつ」「だっけつ」「たけち」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30006-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n市場の<u>飽和</u>状態が続き、新規参入者にとって厳しい環境が続いている。',
 'vocabulary', 'KANJI_READING', true, 1, 6,
 '「飽和」は「ほうわ」と読む。「それ以上は吸収・受容できない状態」を意味する。「ほうわ」が正解で、「ほわ」「はおわ」「ほうか」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題2: CONTEXT_WORD (Q7-Q13) ==========
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30007-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は予算を（　　）しながらも、プロジェクトを高品質に仕上げた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 7,
 '「予算を節減しながら高品質に仕上げた」という文脈から「圧縮（あっしゅく）」が最も適切。予算を圧縮する＝コストを削減するという用法。「拡張」「増額」「浪費」は文脈と逆または不適切。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30008-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n被疑者は弁護士の助言に（　　）し、黙秘を続けた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 8,
 '「弁護士の助言に従い黙秘した」という文脈から「従（じゅう）」ではなく「従って」の意味を持つ「従（したが）」の名詞形「従（じゅうじゅう）」より「準拠（じゅんきょ）」、または「倣（なら）い」に近い「従（したが）い」=「従って」を意味する語。選択肢では「従い（したがい）」が自然。より適切な語は「従（したが）って」だが文語的には「準拠（じゅんきょ）して」が最適。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30009-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n長年の研究が（　　）を見せ始め、チームに活気が戻ってきた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 9,
 '「研究が成果を見せ始めた」という文脈から「成果（せいか）」が正解。「研究が成果を見せ始める」は「努力が実りはじめた」という慣用的表現。「停滞」「後退」「失敗」はいずれも逆の文脈。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30010-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n市民の声を（　　）して政策を立案することが、民主主義の根幹だ。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 10,
 '「市民の声を政策に取り入れる」という文脈から「反映（はんえい）」が最も適切。「市民の声を反映する」は慣用的表現。「無視」「排除」「否定」はいずれも民主主義の根幹から外れる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30011-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nその報告書は（　　）な内容を避け、具体的な数値に基づいた分析を重視した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 11,
 '「具体的な数値分析を重視した」という文脈と対比されるのは「抽象的（ちゅうしょうてき）」な内容。「数値に基づかない曖昧な記述を避けた」という意味になる。「明確な」「具体的な」「正確な」はむしろ推奨されるもので文脈に反する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30012-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は何度挫折しても（　　）を失わず、最終的に目標を達成した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 12,
 '「挫折しても失わず目標を達成した」という文脈から「情熱（じょうねつ）」が最も適切。「情熱を失わず挑戦し続けた」は自然な表現。「絶望」「諦め」「迷い」はいずれも挫折後に強まるものであり文脈に反する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30013-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女は議論の中で感情的にならず、常に（　　）な立場を保った。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 13,
 '「感情的にならず」「常に〜な立場を保った」という文脈から「中立（ちゅうりつ）」が最も適切。議論において感情に左右されず公平な立場を保つことを意味する。「偏向した」「感情的な」「党派的な」は文脈に反する。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題3: PARAPHRASE (Q14-Q19) ==========
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30014-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼女は上司の指示を<u>忠実に</u>実行した。',
 'vocabulary', 'PARAPHRASE', true, 1, 14,
 '「忠実に（ちゅうじつに）」は「言われた通りにきちんと・誠実に」という意味の副詞。「そのまま正確に」が最も意味が近い。「自由に」「創造的に」「大雑把に」はいずれも意味が異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30015-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\nその製品は<u>欠陥が露呈し</u>、大規模なリコールとなった。',
 'vocabulary', 'PARAPHRASE', true, 1, 15,
 '「欠陥が露呈し（けっかんがろていし）」は「隠れていた欠陥が明らかになって」という意味。「問題が表に出て」が最も意味が近い。「問題が解決して」「欠陥が修正されて」「品質が向上して」はいずれも逆の意味。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30016-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼は退職後、<u>悠々自適に</u>暮らしている。',
 'vocabulary', 'PARAPHRASE', true, 1, 16,
 '「悠々自適（ゆうゆうじてき）」は「のんびりと自分のペースで好きなように暮らすこと」を意味する四字熟語。「何にも縛られず気ままに」が最も意味が近い。「忙しく充実して」「厳しい規律の下で」「貧しいながらも」はいずれも意味が異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30017-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼女は仕事上のミスを<u>素直に</u>認めた。',
 'vocabulary', 'PARAPHRASE', true, 1, 17,
 '「素直に（すなおに）」は「抵抗せず、ありのままに・率直に」という意味の副詞。「正直に・率直に」が最も意味が近い。「渋々」「意地悪く」「言い訳して」はいずれも意味が異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30018-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\nその計画は実現まで<u>紆余曲折</u>があったが、最終的に成功した。',
 'vocabulary', 'PARAPHRASE', true, 1, 18,
 '「紆余曲折（うよきょくせつ）」は「物事が複雑な事情でさまざまな曲折を経ること」を意味する四字熟語。「多くの困難や変化があった」が最も意味が近い。「一直線に順調だった」「短期間で」「特に問題なく」はいずれも逆の意味。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30019-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼のアドバイスは<u>的を射た</u>ものだった。',
 'vocabulary', 'PARAPHRASE', true, 1, 19,
 '「的を射た（まとをいた）」は「本質を正確についた・核心に触れた」という意味の慣用表現。「的確で要点を捉えた」が最も意味が近い。「的外れな」「曖昧な」「見当違いの」はいずれも反対の意味。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題4: WORD_USAGE (Q20-Q25) ==========
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30020-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「忸怩」',
 'vocabulary', 'WORD_USAGE', true, 1, 20,
 '「忸怩（じくじ）」は「自分の言動を恥ずかしく思い、心の中でひそかに恥じること」を意味する。「忸怩たる思い」という形で使い、内心の恥や後悔を表す。「忸怩として誇らしかった」「忸怩して積極的に発言した」は意味が矛盾する用法。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30021-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「紛糾」',
 'vocabulary', 'WORD_USAGE', true, 1, 21,
 '「紛糾（ふんきゅう）」は「物事がもつれ込んで複雑になること・議論が混乱すること」を意味する。「議論が紛糾した」「交渉が紛糾する」が正しい用法。「スムーズに解決した」「順調に進んだ」場面では使わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30022-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「凌駕」',
 'vocabulary', 'WORD_USAGE', true, 1, 22,
 '「凌駕（りょうが）」は「他のものより一段と優れていること・上回ること」を意味する。「ライバルを凌駕する実力がある」「他社を凌駕した技術力」が正しい用法。「凌駕して劣る」「凌駕して平均的だ」は意味が矛盾する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30023-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「恣意的」',
 'vocabulary', 'WORD_USAGE', true, 1, 23,
 '「恣意的（しいてき）」は「客観的な根拠なく、自分の思い通りに物事を決めるさま」を意味する。「恣意的な判断を下す」「恣意的に解釈する」が正しい用法。「恣意的に公平な判断をした」「恣意的に客観的な分析をした」は意味が矛盾する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30024-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「躊躇」',
 'vocabulary', 'WORD_USAGE', true, 1, 24,
 '「躊躇（ちゅうちょ）」は「決断しかねてためらうこと・ぐずぐず迷うこと」を意味する。「躊躇せずに申し出た」は「ためらわずに行動した」の意味で正しい用法。「躊躇して積極的に発言した」「躊躇して勇敢に飛び込んだ」は意味が矛盾する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30025-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「顕著」',
 'vocabulary', 'WORD_USAGE', true, 1, 25,
 '「顕著（けんちょ）」は「際立って目立つこと・はっきりと認められること」を意味する形容動詞。「顕著な改善が見られた」「効果が顕著だ」が正しい用法。「顕著に見えにくくなった」「顕著に小さくなった変化」は用法として不自然。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題5: GRAMMAR_CHOICE (Q26-Q35) ==========
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30026-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n入場料が高い（　　）、毎週末この美術館を訪れる人が絶えない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 26,
 '「入場料が高いにもかかわらず毎週訪れる人が絶えない」という逆接の文脈に合うのは「にもかかわらず」。高い費用を払ってでも訪れるという対比を示す。「だから」「のみならず」「ために」はいずれもこの逆接を表せない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30027-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の功績は称えられる（　　）ものだ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 27,
 '「称えられるに値する（に値する）ものだ」＝称賛に値する・称賛してしかるべきという意味のN1文型。「〜に値する」は「〜する価値がある」を表す書き言葉的表現。「べき」も近いが「に値する」がより書き言葉的で適切。「べからず」「に過ぎない」「に足りない」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30028-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n事態の深刻さ（　　）、関係者全員が対応に追われた。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 28,
 '「事態の深刻さゆえに・深刻さから」という原因・理由を表す文脈には「を鑑みて」より「にかんがみ」または「から」が適切。選択肢では「を受けて」＝その状況・事態を受けて という意味のN1表現が最も自然。「にもかかわらず」は逆接、「はともかく」は別として、「はさておき」は話題転換で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30029-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nあれほど練習した（　　）、本番でこんな失敗をするとは情けない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 29,
 '「あれほど練習したのに本番で失敗した」という逆接・落胆を表す文脈には「というのに」が最適。「〜というのに」はN1文型で「〜であるにもかかわらず（話者の落胆・不満を含む）」。「だからこそ」は順接、「おかげで」は恩恵、「ために」は目的・原因で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30030-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n重要な決定を下す（　　）、十分なデータと専門家の意見を参考にすべきだ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 30,
 '「決定を下すにあたって・際には」という場面・機会を表す文脈には「にあたり」が最適。「〜にあたり」はN1文型で「〜する際に・〜するにあたっては」という意味を持つ改まった表現。「にともなって」は変化の並行、「に反して」は逆接、「にして」は〜の状態でという意味で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30031-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の発言には思いやりが感じられ、場の空気を（　　）ものがあった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 31,
 '「場の空気を和らげる・暖める」という意味の文脈には「和ませる（なごませる）」が最適。「場の空気を和ませるものがあった」は「その場を穏やかにする力があった」という意味の自然な表現。「緊張させる」「冷やす」「乱す」はいずれも文脈に反する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30032-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n困難な状況（　　）、彼は決して諦めずに解決策を模索し続けた。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 32,
 '「困難な状況にあっても諦めなかった」という逆接の文脈には「にあっても」または「にもかかわらず」が適切。選択肢では「のもとで」「にあっても（あっても）」など。最もN1らしい表現は「〜にあって」＝〜という状況の中にあって（書き言葉的）。「によって」は手段・原因、「として」は資格、「をきっかけに」は出来事のきっかけで文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30033-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nいくら財産があった（　　）、健康を失っては意味がない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 33,
 '「いくら〜があったとしても、健康を失っては意味がない」という逆接・仮定の文脈には「としても」が最適。「〜としても」は「〜だとしても・仮に〜であっても」というN1文型で仮定の逆接を表す。「から」「ために」「のみならず」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30034-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n環境問題は（　　）取り組むべき課題であり、個人・企業・政府すべての責任だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 34,
 '「一丸となって取り組むべき課題」という文脈には「挙（こぞ）って」または「全員が」の意味を持つ表現が適切。選択肢では「社会全体で」に近い「挙げて（あげて）」＝社会全体として・総力を挙げて という表現が最も自然。「個別に」「一部で」「限定的に」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30035-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は医師（　　）、患者に対する責任の重さを深く自覚している。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 35,
 '「医師として・医師という立場として」という職責・資格を表す文脈には「たる者として」が最適。「〜たる者」はN1文型で「〜という立場・身分にある者として」の意味の文語表現。「にして」は〜であると同時にという意味、「であれば」は条件、「のわりには」は比較で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題6: SENTENCE_ORDER (Q36-Q40) ==========
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30036-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は　＿＿　＿＿　★　＿＿　できた。\n（語群：①ことが　②ねばり強く　③交渉を　④まとめる）',
 'grammar', 'SENTENCE_ORDER', true, 1, 36,
 E'正しい語順は「ねばり強く→交渉を→まとめる→ことが→できた」。\n完成文:「彼は ねばり強く 交渉を ★まとめる ことが できた」\n→「彼はねばり強く交渉をまとめることができた」\n★は3番目の位置（「まとめる」）。「〜することができた」は能力・達成を表す基本表現。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30037-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\nその提案は　＿＿　＿＿　★　＿＿　言えない。\n（語群：①必ずしも　②とは　③合理的だ　④適切な）',
 'grammar', 'SENTENCE_ORDER', true, 1, 37,
 E'正しい語順は「必ずしも→適切な→提案だとは→言えない」または「適切な→提案→とは→言えない」。\n完成文:「その提案は ★適切な 方法とは 必ずしも 合理的だとは 言えない」\nより自然な流れ:「その提案は 適切な ★とは 必ずしも 合理的だと 言えない」\n★は1番目（「適切な」）。「必ずしも〜とは言えない」はN1の部分否定表現。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30038-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女は　＿＿　＿＿　★　＿＿　動じなかった。\n（語群：①強い　②批判にも　③精神力で　④いかなる）',
 'grammar', 'SENTENCE_ORDER', true, 1, 38,
 E'正しい語順は「いかなる→批判にも→強い→精神力で→動じなかった」。\n完成文:「彼女は いかなる 批判にも ★強い 精神力で 動じなかった」\n→「彼女はいかなる批判にも強い精神力で動じなかった」\n★は3番目の位置（「強い」）。「いかなる〜にも」は「どんな〜にも」という強調のN1表現。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30039-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n規則を　＿＿　＿＿　★　＿＿　あるまい。\n（語群：①とは　②守らなかった　③言え　④無断で）',
 'grammar', 'SENTENCE_ORDER', true, 1, 39,
 E'正しい語順は「無断で→規則を→守らなかった→とは→言え→あるまい」。\n完成文:「規則を 無断で 守らなかった ★とは 言え あるまい」\n→「規則を無断で守らなかったとは言えあるまい＝言えないだろう」\n★は3番目の位置（「とは」）。「〜とは言えまい/あるまい」はN1の強い否定推量表現。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30040-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n政策の　＿＿　＿＿　★　＿＿　ならない。\n（語群：①あり方を　②めぐって　③議論しなければ　④真剣に）',
 'grammar', 'SENTENCE_ORDER', true, 1, 40,
 E'正しい語順は「あり方を→めぐって→真剣に→議論しなければ→ならない」。\n完成文:「政策の あり方を めぐって ★真剣に 議論しなければ ならない」\n→「政策のあり方をめぐって真剣に議論しなければならない」\n★は3番目の位置（「真剣に」）。「〜をめぐって」は「〜について・〜を中心に議論する」というN1表現。')
ON CONFLICT (id) DO NOTHING;

-- ========== 問題7: TEXT_GRAMMAR (Q41-Q45) ==========
-- 5問とも同一エッセイを参照。빈칸 번호로 각 문항을 구분。
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30041-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n人が何かを「知っている」と言うとき、その知識はどこから来るのだろうか。書物から得た知識、他者から聞いた知識、そして自らの経験から生まれた知識——これらはすべて「知っている」という言葉の下に括られるが、その質はまるで異なる。\n書物から得た知識は広く、整理されており、短時間で大量に吸収できるという利点がある。（ 41 ）、その知識は文脈を離れると脆く、実際の状況に応用しようとした途端に限界を露呈することがある。\n他者から聞いた知識は、経験者の実感を伴っているという点で書物より生きている。（ 42 ）、それはあくまで他者の経験であり、聞き手にとっては間接的な情報にとどまる。\n最も深く根付く知識は、自らが失敗し、悩み、試行錯誤を繰り返した末に掴み取ったものだ。（ 43 ）こそ、容易には揺るがない。しかし、この種の知識を得るには時間と痛みが（ 44 ）。\nだからこそ、人は書物と他者の知恵を足がかりにしながら、最終的には自ら経験するほかない。知識の深さは、どれだけ多くを知っているかではなく、それをどれだけ自分のものとして使えるかによって（ 45 ）。\n\n（ 41 ）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 41,
 '「書物から得た知識の利点を述べた後、逆接で限界を指摘する」という文脈。「（ 41 ）、その知識は〜限界を露呈する」という逆接の接続には「しかしながら」が最適。「さらに」は追加、「したがって」は順接結果、「つまり」は言い換えで文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30042-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n人が何かを「知っている」と言うとき、その知識はどこから来るのだろうか。書物から得た知識、他者から聞いた知識、そして自らの経験から生まれた知識——これらはすべて「知っている」という言葉の下に括られるが、その質はまるで異なる。\n書物から得た知識は広く、整理されており、短時間で大量に吸収できるという利点がある。（ 41 ）、その知識は文脈を離れると脆く、実際の状況に応用しようとした途端に限界を露呈することがある。\n他者から聞いた知識は、経験者の実感を伴っているという点で書物より生きている。（ 42 ）、それはあくまで他者の経験であり、聞き手にとっては間接的な情報にとどまる。\n最も深く根付く知識は、自らが失敗し、悩み、試行錯誤を繰り返した末に掴み取ったものだ。（ 43 ）こそ、容易には揺るがない。しかし、この種の知識を得るには時間と痛みが（ 44 ）。\nだからこそ、人は書物と他者の知恵を足がかりにしながら、最終的には自ら経験するほかない。知識の深さは、どれだけ多くを知っているかではなく、それをどれだけ自分のものとして使えるかによって（ 45 ）。\n\n（ 42 ）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 42,
 '「他者の知識は書物より生きているという利点を述べた後、逆接でその限界を示す」という文脈。「（ 42 ）、それはあくまで他者の経験であり」という逆接には「とはいえ」が最適。「したがって」は順接、「そして」は追加、「なぜなら」は理由説明で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30043-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n人が何かを「知っている」と言うとき、その知識はどこから来るのだろうか。書物から得た知識、他者から聞いた知識、そして自らの経験から生まれた知識——これらはすべて「知っている」という言葉の下に括られるが、その質はまるで異なる。\n書物から得た知識は広く、整理されており、短時間で大量に吸収できるという利点がある。（ 41 ）、その知識は文脈を離れると脆く、実際の状況に応用しようとした途端に限界を露呈することがある。\n他者から聞いた知識は、経験者の実感を伴っているという点で書物より生きている。（ 42 ）、それはあくまで他者の経験であり、聞き手にとっては間接的な情報にとどまる。\n最も深く根付く知識は、自らが失敗し、悩み、試行錯誤を繰り返した末に掴み取ったものだ。（ 43 ）こそ、容易には揺るがない。しかし、この種の知識を得るには時間と痛みが（ 44 ）。\nだからこそ、人は書物と他者の知恵を足がかりにしながら、最終的には自ら経験するほかない。知識の深さは、どれだけ多くを知っているかではなく、それをどれだけ自分のものとして使えるかによって（ 45 ）。\n\n（ 43 ）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 43,
 '「（ 43 ）こそ、容易には揺るがない」という文脈。前文の「自らが失敗し試行錯誤を繰り返した末に掴み取ったもの」を受けて、「そのような知識（＝それ）こそ」が入る。「それ」が最も自然。「あれ」「これ」は文脈上距離感が違い、「どれ」は疑問詞で文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30044-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n人が何かを「知っている」と言うとき、その知識はどこから来るのだろうか。書物から得た知識、他者から聞いた知識、そして自らの経験から生まれた知識——これらはすべて「知っている」という言葉の下に括られるが、その質はまるで異なる。\n書物から得た知識は広く、整理されており、短時間で大量に吸収できるという利点がある。（ 41 ）、その知識は文脈を離れると脆く、実際の状況に応用しようとした途端に限界を露呈することがある。\n他者から聞いた知識は、経験者の実感を伴っているという点で書物より生きている。（ 42 ）、それはあくまで他者の経験であり、聞き手にとっては間接的な情報にとどまる。\n最も深く根付く知識は、自らが失敗し、悩み、試行錯誤を繰り返した末に掴み取ったものだ。（ 43 ）こそ、容易には揺るがない。しかし、この種の知識を得るには時間と痛みが（ 44 ）。\nだからこそ、人は書物と他者の知恵を足がかりにしながら、最終的には自ら経験するほかない。知識の深さは、どれだけ多くを知っているかではなく、それをどれだけ自分のものとして使えるかによって（ 45 ）。\n\n（ 44 ）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 44,
 '「この種の知識を得るには時間と痛みが（ 44 ）」という文脈。「必要だ・伴う」という語が入る。「伴う（ともなう）」＝必然的に付き従うという意味が最も適切。「増える」「消える」「余る」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee30045-0000-0000-0000-000000000003', 'ad000001-0000-0000-0000-000000000131', 'multiple_choice',
E'次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n人が何かを「知っている」と言うとき、その知識はどこから来るのだろうか。書物から得た知識、他者から聞いた知識、そして自らの経験から生まれた知識——これらはすべて「知っている」という言葉の下に括られるが、その質はまるで異なる。\n書物から得た知識は広く、整理されており、短時間で大量に吸収できるという利点がある。（ 41 ）、その知識は文脈を離れると脆く、実際の状況に応用しようとした途端に限界を露呈することがある。\n他者から聞いた知識は、経験者の実感を伴っているという点で書物より生きている。（ 42 ）、それはあくまで他者の経験であり、聞き手にとっては間接的な情報にとどまる。\n最も深く根付く知識は、自らが失敗し、悩み、試行錯誤を繰り返した末に掴み取ったものだ。（ 43 ）こそ、容易には揺るがない。しかし、この種の知識を得るには時間と痛みが（ 44 ）。\nだからこそ、人は書物と他者の知恵を足がかりにしながら、最終的には自ら経験するほかない。知識の深さは、どれだけ多くを知っているかではなく、それをどれだけ自分のものとして使えるかによって（ 45 ）。\n\n（ 45 ）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 45,
 '「知識の深さは〜どれだけ自分のものとして使えるかによって（ 45 ）」という結論文。「決まる（きまる）」が最も自然に文を締める語。「知識の深さは使えるかどうかによって決まる」という論旨の帰結。「始まる」「広がる」「失われる」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- quiz_question_options (180選択肢)
-- ============================================================

-- Q1: KANJI_READING 隠遁 (正答=いんとん, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30001-0000-0000-0000-000000000003', 'いんとん', true, 1),
('aee30001-0000-0000-0000-000000000003', 'かくとん', false, 2),
('aee30001-0000-0000-0000-000000000003', 'いんとう', false, 3),
('aee30001-0000-0000-0000-000000000003', 'おんとん', false, 4);

-- Q2: KANJI_READING 卓抜 (正答=たくばつ, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30002-0000-0000-0000-000000000003', 'たくはつ', false, 1),
('aee30002-0000-0000-0000-000000000003', 'たくばつ', true, 2),
('aee30002-0000-0000-0000-000000000003', 'だくばつ', false, 3),
('aee30002-0000-0000-0000-000000000003', 'たくぬけ', false, 4);

-- Q3: KANJI_READING 逼迫 (正答=ひっぱく, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30003-0000-0000-0000-000000000003', 'きっぱく', false, 1),
('aee30003-0000-0000-0000-000000000003', 'ひんぱく', false, 2),
('aee30003-0000-0000-0000-000000000003', 'ひっぱく', true, 3),
('aee30003-0000-0000-0000-000000000003', 'ひっぱつ', false, 4);

-- Q4: KANJI_READING 韜晦 (正答=とうかい, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30004-0000-0000-0000-000000000003', 'たいかい', false, 1),
('aee30004-0000-0000-0000-000000000003', 'とかい', false, 2),
('aee30004-0000-0000-0000-000000000003', 'とうがい', false, 3),
('aee30004-0000-0000-0000-000000000003', 'とうかい', true, 4);

-- Q5: KANJI_READING 妥結 (正答=だけつ, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30005-0000-0000-0000-000000000003', 'だけつ', true, 1),
('aee30005-0000-0000-0000-000000000003', 'たけつ', false, 2),
('aee30005-0000-0000-0000-000000000003', 'だっけつ', false, 3),
('aee30005-0000-0000-0000-000000000003', 'たけち', false, 4);

-- Q6: KANJI_READING 飽和 (正答=ほうわ, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30006-0000-0000-0000-000000000003', 'ほわ', false, 1),
('aee30006-0000-0000-0000-000000000003', 'ほうわ', true, 2),
('aee30006-0000-0000-0000-000000000003', 'はおわ', false, 3),
('aee30006-0000-0000-0000-000000000003', 'ほうか', false, 4);

-- Q7: CONTEXT_WORD 圧縮 (正答=圧縮, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30007-0000-0000-0000-000000000003', '拡張', false, 1),
('aee30007-0000-0000-0000-000000000003', '増額', false, 2),
('aee30007-0000-0000-0000-000000000003', '圧縮', true, 3),
('aee30007-0000-0000-0000-000000000003', '浪費', false, 4);

-- Q8: CONTEXT_WORD 準拠して (正答=準拠して, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30008-0000-0000-0000-000000000003', '反発', false, 1),
('aee30008-0000-0000-0000-000000000003', '無視', false, 2),
('aee30008-0000-0000-0000-000000000003', '抵抗', false, 3),
('aee30008-0000-0000-0000-000000000003', '準拠', true, 4);

-- Q9: CONTEXT_WORD 成果 (正答=成果, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30009-0000-0000-0000-000000000003', '成果', true, 1),
('aee30009-0000-0000-0000-000000000003', '停滞', false, 2),
('aee30009-0000-0000-0000-000000000003', '後退', false, 3),
('aee30009-0000-0000-0000-000000000003', '失敗', false, 4);

-- Q10: CONTEXT_WORD 反映 (正答=反映, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30010-0000-0000-0000-000000000003', '無視', false, 1),
('aee30010-0000-0000-0000-000000000003', '反映', true, 2),
('aee30010-0000-0000-0000-000000000003', '排除', false, 3),
('aee30010-0000-0000-0000-000000000003', '否定', false, 4);

-- Q11: CONTEXT_WORD 抽象的 (正答=抽象的, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30011-0000-0000-0000-000000000003', '明確な', false, 1),
('aee30011-0000-0000-0000-000000000003', '具体的な', false, 2),
('aee30011-0000-0000-0000-000000000003', '抽象的な', true, 3),
('aee30011-0000-0000-0000-000000000003', '正確な', false, 4);

-- Q12: CONTEXT_WORD 情熱 (正答=情熱, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30012-0000-0000-0000-000000000003', '絶望', false, 1),
('aee30012-0000-0000-0000-000000000003', '諦め', false, 2),
('aee30012-0000-0000-0000-000000000003', '迷い', false, 3),
('aee30012-0000-0000-0000-000000000003', '情熱', true, 4);

-- Q13: CONTEXT_WORD 中立 (正答=中立, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30013-0000-0000-0000-000000000003', '中立', true, 1),
('aee30013-0000-0000-0000-000000000003', '偏向した', false, 2),
('aee30013-0000-0000-0000-000000000003', '感情的な', false, 3),
('aee30013-0000-0000-0000-000000000003', '党派的な', false, 4);

-- Q14: PARAPHRASE 忠実に (正答=そのまま正確に, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30014-0000-0000-0000-000000000003', '自由に', false, 1),
('aee30014-0000-0000-0000-000000000003', 'そのまま正確に', true, 2),
('aee30014-0000-0000-0000-000000000003', '創造的に', false, 3),
('aee30014-0000-0000-0000-000000000003', '大雑把に', false, 4);

-- Q15: PARAPHRASE 欠陥が露呈し (正答=問題が表に出て, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30015-0000-0000-0000-000000000003', '問題が解決して', false, 1),
('aee30015-0000-0000-0000-000000000003', '欠陥が修正されて', false, 2),
('aee30015-0000-0000-0000-000000000003', '問題が表に出て', true, 3),
('aee30015-0000-0000-0000-000000000003', '品質が向上して', false, 4);

-- Q16: PARAPHRASE 悠々自適に (正答=何にも縛られず気ままに, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30016-0000-0000-0000-000000000003', '忙しく充実して', false, 1),
('aee30016-0000-0000-0000-000000000003', '厳しい規律の下で', false, 2),
('aee30016-0000-0000-0000-000000000003', '貧しいながらも', false, 3),
('aee30016-0000-0000-0000-000000000003', '何にも縛られず気ままに', true, 4);

-- Q17: PARAPHRASE 素直に (正答=正直に・率直に, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30017-0000-0000-0000-000000000003', '正直に・率直に', true, 1),
('aee30017-0000-0000-0000-000000000003', '渋々', false, 2),
('aee30017-0000-0000-0000-000000000003', '意地悪く', false, 3),
('aee30017-0000-0000-0000-000000000003', '言い訳して', false, 4);

-- Q18: PARAPHRASE 紆余曲折 (正答=多くの困難や変化があった, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30018-0000-0000-0000-000000000003', '一直線に順調だった', false, 1),
('aee30018-0000-0000-0000-000000000003', '多くの困難や変化があった', true, 2),
('aee30018-0000-0000-0000-000000000003', '短期間で', false, 3),
('aee30018-0000-0000-0000-000000000003', '特に問題なく', false, 4);

-- Q19: PARAPHRASE 的を射た (正答=的確で要点を捉えた, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30019-0000-0000-0000-000000000003', '的外れな', false, 1),
('aee30019-0000-0000-0000-000000000003', '曖昧な', false, 2),
('aee30019-0000-0000-0000-000000000003', '的確で要点を捉えた', true, 3),
('aee30019-0000-0000-0000-000000000003', '見当違いの', false, 4);

-- Q20: WORD_USAGE 忸怩 (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30020-0000-0000-0000-000000000003', '彼は忸怩として誇らしい気持ちで表彰式に臨んだ。', false, 1),
('aee30020-0000-0000-0000-000000000003', '失敗した彼女は忸怩して積極的に次の提案をした。', false, 2),
('aee30020-0000-0000-0000-000000000003', '部長は部下の活躍を忸怩として受け止めた。', false, 3),
('aee30020-0000-0000-0000-000000000003', '自分の軽率な発言を振り返り、彼は忸怩たる思いを抱いた。', true, 4);

-- Q21: WORD_USAGE 紛糾 (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30021-0000-0000-0000-000000000003', '予算配分をめぐる議論が紛糾し、会議は深夜まで続いた。', true, 1),
('aee30021-0000-0000-0000-000000000003', '交渉が紛糾したため、両社はすぐに合意書にサインした。', false, 2),
('aee30021-0000-0000-0000-000000000003', '彼女は紛糾して笑顔でプレゼンを終えた。', false, 3),
('aee30021-0000-0000-0000-000000000003', 'そのプロジェクトは紛糾して順調に進んだ。', false, 4);

-- Q22: WORD_USAGE 凌駕 (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30022-0000-0000-0000-000000000003', '彼の技術力は凌駕して平均的な水準にある。', false, 1),
('aee30022-0000-0000-0000-000000000003', 'この製品の品質は競合他社のものを明らかに凌駕している。', true, 2),
('aee30022-0000-0000-0000-000000000003', '彼女は凌駕して新人らしい提案をした。', false, 3),
('aee30022-0000-0000-0000-000000000003', 'コストを凌駕してプロジェクトを完成させた。', false, 4);

-- Q23: WORD_USAGE 恣意的 (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30023-0000-0000-0000-000000000003', '彼は恣意的に客観的な分析を行い、信頼を得た。', false, 1),
('aee30023-0000-0000-0000-000000000003', '彼女は恣意的に公平な審査基準を設けた。', false, 2),
('aee30023-0000-0000-0000-000000000003', '規則を恣意的に解釈することは、法の平等性を損なう。', true, 3),
('aee30023-0000-0000-0000-000000000003', '恣意的な判断で全員が納得する結論を出した。', false, 4);

-- Q24: WORD_USAGE 躊躇 (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30024-0000-0000-0000-000000000003', '彼は躊躇して積極的に新しい挑戦へ踏み出した。', false, 1),
('aee30024-0000-0000-0000-000000000003', '躊躇することなく勇敢に発言した彼だったが、後でためらいを感じた。', false, 2),
('aee30024-0000-0000-0000-000000000003', '彼女は躊躇して勢いよくドアを開けた。', false, 3),
('aee30024-0000-0000-0000-000000000003', '転職を決意するまで、彼は長い間躊躇し続けた。', true, 4);

-- Q25: WORD_USAGE 顕著 (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30025-0000-0000-0000-000000000003', '新しい治療法の導入により、患者の回復状況に顕著な改善が見られた。', true, 1),
('aee30025-0000-0000-0000-000000000003', '変化は顕著に見えにくく、ほとんど気づかれなかった。', false, 2),
('aee30025-0000-0000-0000-000000000003', '顕著に小さな差異があったため、誰も問題にしなかった。', false, 3),
('aee30025-0000-0000-0000-000000000003', '彼の顕著な欠点は、誰にも認識されていなかった。', false, 4);

-- Q26: GRAMMAR_CHOICE にもかかわらず (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30026-0000-0000-0000-000000000003', 'だから', false, 1),
('aee30026-0000-0000-0000-000000000003', 'にもかかわらず', true, 2),
('aee30026-0000-0000-0000-000000000003', 'のみならず', false, 3),
('aee30026-0000-0000-0000-000000000003', 'ために', false, 4);

-- Q27: GRAMMAR_CHOICE に値する (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30027-0000-0000-0000-000000000003', 'べからず', false, 1),
('aee30027-0000-0000-0000-000000000003', 'に過ぎない', false, 2),
('aee30027-0000-0000-0000-000000000003', 'に値する', true, 3),
('aee30027-0000-0000-0000-000000000003', 'に足りない', false, 4);

-- Q28: GRAMMAR_CHOICE を受けて (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30028-0000-0000-0000-000000000003', 'にもかかわらず', false, 1),
('aee30028-0000-0000-0000-000000000003', 'はともかく', false, 2),
('aee30028-0000-0000-0000-000000000003', 'はさておき', false, 3),
('aee30028-0000-0000-0000-000000000003', 'を受けて', true, 4);

-- Q29: GRAMMAR_CHOICE というのに (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30029-0000-0000-0000-000000000003', 'というのに', true, 1),
('aee30029-0000-0000-0000-000000000003', 'だからこそ', false, 2),
('aee30029-0000-0000-0000-000000000003', 'おかげで', false, 3),
('aee30029-0000-0000-0000-000000000003', 'ために', false, 4);

-- Q30: GRAMMAR_CHOICE にあたり (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30030-0000-0000-0000-000000000003', 'にともなって', false, 1),
('aee30030-0000-0000-0000-000000000003', 'にあたり', true, 2),
('aee30030-0000-0000-0000-000000000003', 'に反して', false, 3),
('aee30030-0000-0000-0000-000000000003', 'にして', false, 4);

-- Q31: GRAMMAR_CHOICE 和ませる (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30031-0000-0000-0000-000000000003', '緊張させる', false, 1),
('aee30031-0000-0000-0000-000000000003', '冷やす', false, 2),
('aee30031-0000-0000-0000-000000000003', '和ませる', true, 3),
('aee30031-0000-0000-0000-000000000003', '乱す', false, 4);

-- Q32: GRAMMAR_CHOICE にあって (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30032-0000-0000-0000-000000000003', 'によって', false, 1),
('aee30032-0000-0000-0000-000000000003', 'として', false, 2),
('aee30032-0000-0000-0000-000000000003', 'をきっかけに', false, 3),
('aee30032-0000-0000-0000-000000000003', 'にあって', true, 4);

-- Q33: GRAMMAR_CHOICE としても (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30033-0000-0000-0000-000000000003', 'としても', true, 1),
('aee30033-0000-0000-0000-000000000003', 'から', false, 2),
('aee30033-0000-0000-0000-000000000003', 'ために', false, 3),
('aee30033-0000-0000-0000-000000000003', 'のみならず', false, 4);

-- Q34: GRAMMAR_CHOICE 挙げて (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30034-0000-0000-0000-000000000003', '個別に', false, 1),
('aee30034-0000-0000-0000-000000000003', '挙げて', true, 2),
('aee30034-0000-0000-0000-000000000003', '一部で', false, 3),
('aee30034-0000-0000-0000-000000000003', '限定的に', false, 4);

-- Q35: GRAMMAR_CHOICE たる者として (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30035-0000-0000-0000-000000000003', 'にして', false, 1),
('aee30035-0000-0000-0000-000000000003', 'であれば', false, 2),
('aee30035-0000-0000-0000-000000000003', 'たる者として', true, 3),
('aee30035-0000-0000-0000-000000000003', 'のわりには', false, 4);

-- Q36: SENTENCE_ORDER ★=まとめる (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30036-0000-0000-0000-000000000003', 'ことが', false, 1),
('aee30036-0000-0000-0000-000000000003', 'ねばり強く', false, 2),
('aee30036-0000-0000-0000-000000000003', '交渉を', false, 3),
('aee30036-0000-0000-0000-000000000003', 'まとめる', true, 4);

-- Q37: SENTENCE_ORDER ★=適切な (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30037-0000-0000-0000-000000000003', '適切な', true, 1),
('aee30037-0000-0000-0000-000000000003', '必ずしも', false, 2),
('aee30037-0000-0000-0000-000000000003', 'とは', false, 3),
('aee30037-0000-0000-0000-000000000003', '合理的だ', false, 4);

-- Q38: SENTENCE_ORDER ★=強い (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30038-0000-0000-0000-000000000003', 'いかなる', false, 1),
('aee30038-0000-0000-0000-000000000003', '強い', true, 2),
('aee30038-0000-0000-0000-000000000003', '批判にも', false, 3),
('aee30038-0000-0000-0000-000000000003', '精神力で', false, 4);

-- Q39: SENTENCE_ORDER ★=とは (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30039-0000-0000-0000-000000000003', '守らなかった', false, 1),
('aee30039-0000-0000-0000-000000000003', '無断で', false, 2),
('aee30039-0000-0000-0000-000000000003', 'とは', true, 3),
('aee30039-0000-0000-0000-000000000003', '言え', false, 4);

-- Q40: SENTENCE_ORDER ★=真剣に (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30040-0000-0000-0000-000000000003', 'あり方を', false, 1),
('aee30040-0000-0000-0000-000000000003', 'めぐって', false, 2),
('aee30040-0000-0000-0000-000000000003', '議論しなければ', false, 3),
('aee30040-0000-0000-0000-000000000003', '真剣に', true, 4);

-- Q41: TEXT_GRAMMAR (41) しかしながら (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30041-0000-0000-0000-000000000003', 'しかしながら', true, 1),
('aee30041-0000-0000-0000-000000000003', 'さらに', false, 2),
('aee30041-0000-0000-0000-000000000003', 'したがって', false, 3),
('aee30041-0000-0000-0000-000000000003', 'つまり', false, 4);

-- Q42: TEXT_GRAMMAR (42) とはいえ (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30042-0000-0000-0000-000000000003', 'したがって', false, 1),
('aee30042-0000-0000-0000-000000000003', 'とはいえ', true, 2),
('aee30042-0000-0000-0000-000000000003', 'そして', false, 3),
('aee30042-0000-0000-0000-000000000003', 'なぜなら', false, 4);

-- Q43: TEXT_GRAMMAR (43) それ (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30043-0000-0000-0000-000000000003', 'あれ', false, 1),
('aee30043-0000-0000-0000-000000000003', 'これ', false, 2),
('aee30043-0000-0000-0000-000000000003', 'それ', true, 3),
('aee30043-0000-0000-0000-000000000003', 'どれ', false, 4);

-- Q44: TEXT_GRAMMAR (44) 伴う (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30044-0000-0000-0000-000000000003', '増える', false, 1),
('aee30044-0000-0000-0000-000000000003', '消える', false, 2),
('aee30044-0000-0000-0000-000000000003', '余る', false, 3),
('aee30044-0000-0000-0000-000000000003', '伴う', true, 4);

-- Q45: TEXT_GRAMMAR (45) 決まる (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee30045-0000-0000-0000-000000000003', '決まる', true, 1),
('aee30045-0000-0000-0000-000000000003', '始まる', false, 2),
('aee30045-0000-0000-0000-000000000003', '広がる', false, 3),
('aee30045-0000-0000-0000-000000000003', '失われる', false, 4);
