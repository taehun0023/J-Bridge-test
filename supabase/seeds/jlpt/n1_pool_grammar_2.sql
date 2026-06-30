-- N1 文法 モデル問題プール (Batch 2) 37問

-- Q1 〜の至り (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '代表として壇上に立ち、スピーチを行えたことは、光栄___。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('の至りです',true,1),('にほかなりません',false,2),('でなりません',false,3),('というものです',false,4)) AS t(txt,ok,so);

-- Q2 〜にかたくない (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '長年連れ添った伴侶を失った彼の悲しみは、___。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('想像を絶するものだ',false,1),('想像にかたくない',true,2),('想像もつかないほどだ',false,3),('想像すら及ばない',false,4)) AS t(txt,ok,so);

-- Q3 〜ずにはおかない (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'この映画のラストシーンは、観る者を感動させ___。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('ないではすまない',false,1),('ないわけにはいかない',false,2),('ずにはおかない',true,3),('てならない',false,4)) AS t(txt,ok,so);

-- Q4 〜まじき (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '患者の個人情報を漏洩するとは、医師として___行為だ。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('すべからざる',false,1),('してはならない',false,2),('なすべからず',false,3),('あるまじき',true,4)) AS t(txt,ok,so);

-- Q5 〜であれ (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '理由が何___、締め切りを守れないことは許されない。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('であれ',true,1),('であっても',false,2),('であるにせよ',false,3),('にしても',false,4)) AS t(txt,ok,so);

-- Q6 〜ところを (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'お忙しい___、わざわざお越しいただきありがとうございます。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('にもかかわらず',false,1),('ところを',true,2),('中を',false,3),('最中に',false,4)) AS t(txt,ok,so);

-- Q7 〜にして (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '天才___、この問題を一瞬で解いてしまうとは驚いた。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('ならば',false,1),('であっても',false,2),('にして',true,3),('だからこそ',false,4)) AS t(txt,ok,so);

-- Q8 〜とあって (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '本日は創業百周年の記念式典___、会場は多くの来賓で賑わっていた。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('であるから',false,1),('なので',false,2),('であるため',false,3),('とあって',true,4)) AS t(txt,ok,so);

-- Q9 〜ものを (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '早く相談してくれれば助けられた___、どうして黙っていたのだ。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('ものを',true,1),('のだから',false,2),('はずなのに',false,3),('というのに',false,4)) AS t(txt,ok,so);

-- Q10 〜限りだ (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '海外で初めて単独ライブを成功させた彼女の姿は、頼もしい___。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('に違いない',false,1),('限りだ',true,2),('ものがある',false,3),('ばかりだ',false,4)) AS t(txt,ok,so);

-- Q11 〜といえども (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'ベテランの職人___、失敗することはある。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('であろうとも',false,1),('であるからには',false,2),('といえども',true,3),('でさえあれば',false,4)) AS t(txt,ok,so);

-- Q12 〜を禁じえない (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '幼い子供たちが難民として暮らす映像を見て、涙___。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('が出てしまう',false,1),('を流さずにいられない',false,2),('がこぼれそうだ',false,3),('を禁じえない',true,4)) AS t(txt,ok,so);

-- Q13 〜に即して (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '判決は現行の法律___厳正に下されなければならない。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('に即して',true,1),('に基づいて',false,2),('に沿って',false,3),('に従って',false,4)) AS t(txt,ok,so);

-- Q14 〜をものともせず (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '悪天候___、登山隊は頂上を目指して前進し続けた。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('をよそに',false,1),('をものともせず',true,2),('をものかは',false,3),('をおして',false,4)) AS t(txt,ok,so);

-- Q15 〜かたわら (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '彼は会社員として働く___、地域の子供たちにサッカーを教えている。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('ついでに',false,1),('ながら',false,2),('かたわら',true,3),('がてら',false,4)) AS t(txt,ok,so);

-- Q16 〜ならでは (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'この繊細な風味は、京都の老舗料亭___の技が生み出したものだ。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('だけ',false,1),('のみ',false,2),('ばかり',false,3),('ならでは',true,4)) AS t(txt,ok,so);

-- Q17 〜いかんによらず (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '審査結果の___、応募してくれた全員に感謝状を送る予定だ。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('いかんによらず',true,1),('いかんにかかわらず',false,2),('いかんをとわず',false,3),('いかんにかかわりなく',false,4)) AS t(txt,ok,so);

-- Q18 〜をよそに (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '周囲の心配___、彼は独断でプロジェクトを進めてしまった。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('をものともせず',false,1),('をよそに',true,2),('をおして',false,3),('をものかは',false,4)) AS t(txt,ok,so);

-- Q19 〜にもまして (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '今年の夏は例年___厳しい暑さが続いている。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('以上に',false,1),('よりも',false,2),('にもまして',true,3),('に増して',false,4)) AS t(txt,ok,so);

-- Q20 〜てやまない (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '被災地の一日も早い復興を願っ___。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('てならない',false,1),('てたまらない',false,2),('てしかたない',false,3),('てやまない',true,4)) AS t(txt,ok,so);

-- Q21 〜ばこそ (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'あなたのことを信頼している___、厳しいことも言えるのです。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('ればこそ',true,1),('からこそ',false,2),('ためにこそ',false,3),('のだからこそ',false,4)) AS t(txt,ok,so);

-- Q22 〜が最後 (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '彼女に秘密を打ち明けた___、翌日には社内全員が知っていた。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('とたんに',false,1),('が最後',true,2),('やいなや',false,3),('なり',false,4)) AS t(txt,ok,so);

-- Q23 〜にひきかえ (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '姉の社交的な性格___、弟はひどく内気で人見知りだ。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('に比べて',false,1),('とは逆に',false,2),('にひきかえ',true,3),('とは対照的に',false,4)) AS t(txt,ok,so);

-- Q24 〜ときたら (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'うちの上司___、毎回会議で的外れな意見ばかり言うから困る。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('といったら',false,1),('というのは',false,2),('に関しては',false,3),('ときたら',true,4)) AS t(txt,ok,so);

-- Q25 〜をおいて (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'この難局を乗り越えられる人物は、彼___ほかにいない。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('をおいて',true,1),('を除いて',false,2),('しか',false,3),('以外に',false,4)) AS t(txt,ok,so);

-- Q26 〜とあれば (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '子供のためになる___、親はどんな犠牲も厭わないものだ。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('ならば',false,1),('とあれば',true,2),('とすれば',false,3),('のであれば',false,4)) AS t(txt,ok,so);

-- Q27 〜に足る (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '彼の長年の研究成果は、世界に誇る___ものだと評価された。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('べき',false,1),('にたえる',false,2),('に足る',true,3),('だけの',false,4)) AS t(txt,ok,so);

-- Q28 〜ずにはすまない (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '他人の作品を無断で使用した以上、謝罪せ___。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('ざるをえない',false,1),('ないわけにはいかない',false,2),('なければならない',false,3),('ずにはすまない',true,4)) AS t(txt,ok,so);

-- Q29 〜がてら (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '散歩___、近くのスーパーで買い物をしてきた。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('がてら',true,1),('ついでに',false,2),('かたわら',false,3),('ながら',false,4)) AS t(txt,ok,so);

-- Q30 〜めく (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '桜の花が咲き始め、街全体が春___季節になってきた。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('らしい',false,1),('めいた',true,2),('ような',false,3),('っぽい',false,4)) AS t(txt,ok,so);

-- Q31 〜たりとも (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '試合終了の笛が鳴るまで、一秒___気を抜くな。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('だって',false,1),('ですら',false,2),('たりとも',true,3),('といえど',false,4)) AS t(txt,ok,so);

-- Q32 〜なくして (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'チームの協力___、このプロジェクトの成功はありえなかった。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('がなければ',false,1),('なしでは',false,2),('がなくては',false,3),('なくして',true,4)) AS t(txt,ok,so);

-- Q33 〜でなくてなんだろう (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '30年間無休で弱者を支援し続けた彼の行動は、まさに献身___。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('でなくてなんだろう',true,1),('というほかない',false,2),('にほかならない',false,3),('といえばそれまでだ',false,4)) AS t(txt,ok,so);

-- Q34 〜もさることながら (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '彼女は容姿___、その知性と品格においても際立った存在だ。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('はもとより',false,1),('もさることながら',true,2),('はおろか',false,3),('もそうだが',false,4)) AS t(txt,ok,so);

-- Q35 〜をしも (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '「鬼をしも泣かしむほどの悲話だった」の「をしも」と最も近い意味の表現はどれか。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('鬼だからこそ',false,1),('鬼のように',false,2),('鬼でさえも',true,3),('鬼にとっても',false,4)) AS t(txt,ok,so);

-- Q36 〜ところへ (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '会議が白熱しているきわどい___、部長が突然倒れるという事態が起きた。', 'grammar', 1, true)
  RETURNING id)

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('最中に',false,1),('タイミングで',false,2),('状況の中',false,3),('ところへ',true,4)) AS t(txt,ok,so);


-- Q37 〜に先立ち (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', '新製品の発売___、全国の販売店向けに説明会を実施した。', 'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES ('に先立ち',true,1),('に際して',false,2),('の前に',false,3),('を前にして',false,4)) AS t(txt,ok,so);
