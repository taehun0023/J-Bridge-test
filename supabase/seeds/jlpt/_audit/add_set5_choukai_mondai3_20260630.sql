-- N1 Set5 聴解 問題3 概要理解 新規2問追加
-- 主題1: 日本語の変化と外来語の受容 (sort_order=17)
-- 主題2: 認知症と地域包括ケアシステム (sort_order=18)
-- 作成日: 2026-06-30

DO $$
DECLARE
  set_id_var UUID;
  qid UUID;
BEGIN
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level='N1' AND set_no=5;

  -- 問題3 (1) 日本語の変化と外来語の受容
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES (
      'ad000001-0000-0000-0000-000000000153'::uuid,
      E'次の講演を聴いて、質問に答えてください。\n\n講演者：言語というのは、時代とともに変化するものです。特に日本語は、明治以降、外来語を積極的に取り込んできた歴史があります。「テレビ」「パソコン」といった言葉は今や日本語の一部として定着していますが、近年のカタカナ語の急増を問題視する声もあります。しかし、外来語の受容は日本語の柔軟性の証であり、新しい概念を表す手段として機能してきたと言えます。もちろん、過度な外来語の使用が日本語本来の表現を圧迫する懸念もあるでしょう。ただ、重要なのは言語の純粋性を守ることよりも、コミュニケーションの道具として言語を豊かに活用することではないでしょうか。外来語との共存を通じて、日本語はさらに豊かになっていくと私は考えています。\n\n質問：この講演者が最も伝えたいことは何か。',
      'multiple_choice'
    )
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (qid, E'外来語の急増は日本語本来の表現力を損なうため、使用を規制する必要がある。', false, 1),
    (qid, E'外来語の受容は日本語の柔軟性であり、言語はコミュニケーションの道具として豊かに活用されるべきだ。', true,  2),
    (qid, E'明治以降に取り込まれた外来語はすでに日本語の一部として完全に定着しており、問題はない。', false, 3),
    (qid, E'外来語の普及を防ぐために、日本語本来の表現を積極的に守り使い続けるべきだ。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id_var, qid, 'choukai', 17, 3, '概要理解');

  -- 問題3 (2) 認知症と地域包括ケアシステム
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES (
      'ad000001-0000-0000-0000-000000000153'::uuid,
      E'次の話を聴いて、質問に答えてください。\n\n話者：高齢化が進む日本において、認知症は今や国民的な課題となっています。現在、認知症の患者数は600万人を超えており、2025年にはさらに増加すると予測されています。こうした状況に対応するため、国は「地域包括ケアシステム」の構築を推進しています。このシステムは、医療・介護・予防・住まい・生活支援を一体的に提供する仕組みであり、認知症の方が住み慣れた地域で安心して暮らし続けられるよう支援するものです。施設入所だけに頼るのではなく、地域コミュニティ全体で認知症を支えるという発想が重要です。認知症の方も、その家族も孤立させないためには、地域の絆を活かした包括的なサポートが不可欠です。認知症を「社会全体で支える」という視点こそが、これからの介護の在り方の核心だと思います。\n\n質問：この話者が最も伝えたいことは何か。',
      'multiple_choice'
    )
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (qid, E'認知症患者が急増しているため、介護施設の整備を早急に進める必要がある。', false, 1),
    (qid, E'地域包括ケアシステムを通じて、認知症の方が地域で孤立せず安心して暮らせる社会を実現することが重要だ。', true,  2),
    (qid, E'認知症は医療の問題であり、専門機関による治療と管理が最優先課題となる。', false, 3),
    (qid, E'家族が認知症患者を在宅で介護できるよう、経済的支援を充実させるべきだ。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id_var, qid, 'choukai', 18, 3, '概要理解');

END$$;
