-- encoding: UTF-8
-- N2 文法 モデル問題プール バッチ2 (37問 オリジナル)
-- quiz_id: bb000002-0000-0000-0000-000000000001

-- 1. を中心に (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '今回のプロジェクトは東京（　）、全国に展開する予定だ。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('に関して', false, 1),
  ('に対して', false, 2),
  ('を中心に', true, 3),
  ('をもとに', false, 4)
) AS t(txt, ok, so);

-- 2. に基づいて (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'このシステムは利用者のフィードバック（　）改善された。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('によると', false, 1),
  ('に基づいて', true, 2),
  ('にとって', false, 3),
  ('にしたがって', false, 4)
) AS t(txt, ok, so);

-- 3. わけがない (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '彼はずっと練習してきたのだから、あんな簡単な問題が解けない（　）。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('はずはない', false, 1),
  ('かもしれない', false, 2),
  ('に違いない', false, 3),
  ('わけがない', true, 4)
) AS t(txt, ok, so);

-- 4. 一方で (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'この薬は痛みを和らげる（　）、長期使用には注意が必要だ。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('一方で', true, 1),
  ('ところで', false, 2),
  ('うえで', false, 3),
  ('につれて', false, 4)
) AS t(txt, ok, so);

-- 5. としても (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'たとえ難しい（　）、最後まであきらめないつもりだ。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('にしても', false, 1),
  ('とすれば', false, 2),
  ('としても', true, 3),
  ('にしては', false, 4)
) AS t(txt, ok, so);

-- 6. 上で (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '契約内容をよく確認した（　）、サインしてください。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('あとで', false, 1),
  ('上で', true, 2),
  ('うえに', false, 3),
  ('以上は', false, 4)
) AS t(txt, ok, so);

-- 7. おそれがある (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '台風が近づいているため、洪水になる（　）と気象庁が発表した。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('おそれがある', true, 1),
  ('はずがある', false, 2),
  ('わけがある', false, 3),
  ('ことがある', false, 4)
) AS t(txt, ok, so);

-- 8. 次第 (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '詳細が決まり（　）、すぐにご連絡いたします。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('次第に', false, 1),
  ('たびに', false, 2),
  ('にともなって', false, 3),
  ('次第', true, 4)
) AS t(txt, ok, so);

-- 9. にかかわらず (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '経験の有無（　）、やる気のある人を採用します。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('にとって', false, 1),
  ('にかかわらず', true, 2),
  ('にもとづいて', false, 3),
  ('によって', false, 4)
) AS t(txt, ok, so);

-- 10. ものの (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '新しい仕事を始めた（　）、なかなか慣れない。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ものだから', false, 1),
  ('ものなら', false, 2),
  ('ものの', true, 3),
  ('ものとして', false, 4)
) AS t(txt, ok, so);

-- 11. ずに (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '彼女は傘を持た（　）雨の中を帰った。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ずに', true, 1),
  ('なくて', false, 2),
  ('ないで', false, 3),
  ('なければ', false, 4)
) AS t(txt, ok, so);

-- 12. にしたがって (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '春が近づく（　）、桜の開花が話題になってきた。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('とともに', false, 1),
  ('につれて', false, 2),
  ('にかけて', false, 3),
  ('にしたがって', true, 4)
) AS t(txt, ok, so);

-- 13. において (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '今回の国際会議は東京（　）開催される予定です。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('に対して', false, 1),
  ('において', true, 2),
  ('について', false, 3),
  ('に関して', false, 4)
) AS t(txt, ok, so);

-- 14. にあたって (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '海外赴任（　）、語学の準備をしっかりしておきたい。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('にあたって', true, 1),
  ('にともなって', false, 2),
  ('にかけて', false, 3),
  ('について', false, 4)
) AS t(txt, ok, so);

-- 15. だけでなく (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '彼は日本語（　）中国語も話せる。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('に加えて', false, 1),
  ('はもとより', false, 2),
  ('だけでなく', true, 3),
  ('のみならず', false, 4)
) AS t(txt, ok, so);

-- 16. に違いない (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '彼女はずっと笑っている。よいことがあった（　）。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('はずがない', false, 1),
  ('かもしれない', false, 2),
  ('わけがない', false, 3),
  ('に違いない', true, 4)
) AS t(txt, ok, so);

-- 17. とはいえ (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '春になった（　）、朝はまだ寒い日が続いている。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('というのに', false, 1),
  ('とはいえ', true, 2),
  ('ものの', false, 3),
  ('にしても', false, 4)
) AS t(txt, ok, so);

-- 18. さえ〜ば (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'あなた（　）来てくれれば、みんな安心すると思う。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('さえ', true, 1),
  ('こそ', false, 2),
  ('だけ', false, 3),
  ('でも', false, 4)
) AS t(txt, ok, so);

-- 19. を通じて (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'インターネット（　）、世界中の情報を入手できるようになった。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('にとって', false, 1),
  ('によると', false, 2),
  ('を通じて', true, 3),
  ('に関して', false, 4)
) AS t(txt, ok, so);

-- 20. に反して (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '予想（　）、売り上げが伸びなかった。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('によって', false, 1),
  ('にもとづいて', false, 2),
  ('のもとで', false, 3),
  ('に反して', true, 4)
) AS t(txt, ok, so);

-- 21. はずだ (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '地図で確認したので、この道で合っている（　）。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('わけだ', false, 1),
  ('はずだ', true, 2),
  ('ものだ', false, 3),
  ('ことだ', false, 4)
) AS t(txt, ok, so);

-- 22. ないわけにはいかない (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '上司に頼まれたのだから、断ら（　）。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ないわけにはいかない', true, 1),
  ('ないわけがない', false, 2),
  ('なければならない', false, 3),
  ('ないことはない', false, 4)
) AS t(txt, ok, so);

-- 23. に即して (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '会社の規定（　）、適切に業務を進めてください。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('に関して', false, 1),
  ('に対して', false, 2),
  ('に即して', true, 3),
  ('に沿って', false, 4)
) AS t(txt, ok, so);

-- 24. ぬきで (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '冗談は（　）、今日の会議で何が一番重要でしたか？',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('はなしで', false, 1),
  ('べつに', false, 2),
  ('なしで', false, 3),
  ('ぬきで', true, 4)
) AS t(txt, ok, so);

-- 25. からして (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '彼の話し方（　）、かなりのベテランだと分かる。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('からには', false, 1),
  ('からして', true, 2),
  ('からこそ', false, 3),
  ('からといって', false, 4)
) AS t(txt, ok, so);

-- 26. をきっかけに (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '大学での出会い（　）、彼女は起業する夢を持つようになった。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('をきっかけに', true, 1),
  ('をもとに', false, 2),
  ('にそって', false, 3),
  ('にともなって', false, 4)
) AS t(txt, ok, so);

-- 27. ようとしない (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '彼は失敗しても、その原因を振り返ろう（　）。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('としない', false, 1),
  ('ようとする', false, 2),
  ('ようとしない', true, 3),
  ('ないようにする', false, 4)
) AS t(txt, ok, so);

-- 28. にほかならない (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '彼が成功したのは、日々の努力（　）と思う。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('によるものだ', false, 1),
  ('であるからだ', false, 2),
  ('のおかげだ', false, 3),
  ('にほかならない', true, 4)
) AS t(txt, ok, so);

-- 29. うえに (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'この店は料理がおいしい（　）、値段も手頃でいつも混んでいる。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ものの', false, 1),
  ('うえに', true, 2),
  ('ことに', false, 3),
  ('ばかりか', false, 4)
) AS t(txt, ok, so);

-- 30. にしては (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '初心者（　）、かなり上手に弾けていますね。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('にしては', true, 1),
  ('としても', false, 2),
  ('としては', false, 3),
  ('にとっては', false, 4)
) AS t(txt, ok, so);

-- 31. かねない (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'この作業を怠ると、大きな事故につながり（　）。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('かねる', false, 1),
  ('おそれがある', false, 2),
  ('かねない', true, 3),
  ('かもしれない', false, 4)
) AS t(txt, ok, so);

-- 32. にすぎない (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'これはあくまで私個人の意見（　）。みなさんの判断を尊重します。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('にほかならない', false, 1),
  ('というものだ', false, 2),
  ('にあたらない', false, 3),
  ('にすぎない', true, 4)
) AS t(txt, ok, so);

-- 33. というより (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    'あの映画は面白い（　）、怖いという感じだった。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('というのは', false, 1),
  ('というより', true, 2),
  ('ということは', false, 3),
  ('というものは', false, 4)
) AS t(txt, ok, so);

-- 34. からには (correct: 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '引き受けた（　）、しっかりやり遂げなければならない。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('からには', true, 1),
  ('からこそ', false, 2),
  ('からして', false, 3),
  ('からといって', false, 4)
) AS t(txt, ok, so);

-- 35. てはじめて (correct: 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '海外で生活し（　）、日本の良さが分かった。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('てから', false, 1),
  ('てこそ', false, 2),
  ('てはじめて', true, 3),
  ('てみて', false, 4)
) AS t(txt, ok, so);

-- 36. にもかかわらず (correct: 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '彼は体調が悪い（　）、試合に出場することを選んだ。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('にしたがって', false, 1),
  ('にとって', false, 2),
  ('にもとづいて', false, 3),
  ('にもかかわらず', true, 4)
) AS t(txt, ok, so);

-- 37. をめぐって (correct: 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000001', 'multiple_choice',
    '新しい法律の制定（　）、国会で激しい議論が続いている。',
    'grammar', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('に関して', false, 1),
  ('をめぐって', true, 2),
  ('に対して', false, 3),
  ('について', false, 4)
) AS t(txt, ok, so);
