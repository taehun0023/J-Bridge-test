-- JLPT N1 模擬試験 聴解 問題3 概要理解 追加 (Sets 2/3/4 各2問)
-- Set 2: 気候変動適応策 / AI医療診断の倫理
-- Set 3: 地方創生と関係人口 / 持続可能な農業
-- Set 4: 少子化対策の課題 / サーキュラーエコノミー
-- 作成日: 2026-06-30
-- section: choukai / daimon: 3 / subtype: 概要理解
-- sort_order: 17(1問目), 18(2問目)

-- =====================================================================
-- Set 2  quiz_id: bb000001-0000-0000-0000-000000000003
-- =====================================================================
DO $$
DECLARE
  set_id_var UUID;
  qid UUID;
BEGIN
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level = 'N1' AND set_no = 2;

  -- sort_order 17: 気候変動適応策
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES (
      'bb000001-0000-0000-0000-000000000003'::uuid,
      E'次のラジオ番組を聴いて、質問に答えてください。\n\n専門家：気候変動への対応策として、温室効果ガスの排出削減ばかりに目が向きがちですが、それだけでは不十分です。すでに起きてしまった気温上昇に対して、私たちの社会や経済の仕組みそのものを変えていく「適応策」が急務となっています。堤防の強化や農作物の品種改良、熱中症対策の拡充など、具体的な取り組みが求められます。先進国は排出削減と並行して、適応策への投資を大幅に増やすべき段階にきています。気候変動は遠い未来の問題ではなく、今まさに対処が必要な現実の課題なのです。\n\n質問：この専門家が最も伝えたいことは何か。',
      'multiple_choice'
    )
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (qid, E'温室効果ガスの排出量を早急にゼロにすることが最優先課題だ', false, 1),
    (qid, E'すでに進行する気候変動への適応策への投資拡充が急務だ', true, 2),
    (qid, E'農業分野の技術革新が気候変動問題の解決につながる', false, 3),
    (qid, E'気候変動は将来世代のために早期対策を始めるべき問題だ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id_var, qid, 'choukai', 17, 3, '概要理解');

  -- sort_order 18: AI医療診断の倫理
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES (
      'bb000001-0000-0000-0000-000000000003'::uuid,
      E'次の講演を聴いて、質問に答えてください。\n\n講演者：近年、AI技術を活用した画像診断システムが医療現場に導入され始め、専門医に匹敵するとも言われる精度を発揮しています。しかし、診断精度の高さだけを評価軸にするのは危険です。AIが誤った判断を下した場合、責任の所在はどこにあるのか。また、学習データに偏りがあれば特定の集団で精度が低下するリスクもあります。AIは医師の代替ではなく、あくまでも補助ツールとして位置づけ、最終的な診断責任は人間の医師が担うという枠組みを明確にしないまま普及させることは避けるべきです。技術の進歩と倫理的な制度整備を両輪で進めることが不可欠です。\n\n質問：この講演者が最も伝えたいことは何か。',
      'multiple_choice'
    )
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (qid, E'AI診断の精度は現時点では医師に劣るため、普及を急ぐべきではない', false, 1),
    (qid, E'AI技術の精度向上に向けた学習データの拡充が医療界の急務だ', false, 2),
    (qid, E'AI診断の普及には技術の進歩と倫理・制度整備を並行して進める必要がある', true, 3),
    (qid, E'AI医療診断の責任は開発した企業が全面的に負うべきだ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id_var, qid, 'choukai', 18, 3, '概要理解');
END$$;

-- =====================================================================
-- Set 3  quiz_id: bb000001-0000-0000-0000-000000000003
-- =====================================================================
DO $$
DECLARE
  set_id_var UUID;
  qid UUID;
BEGIN
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level = 'N1' AND set_no = 3;

  -- sort_order 17: 地方創生と関係人口
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES (
      'bb000001-0000-0000-0000-000000000003'::uuid,
      E'次のラジオ番組を聴いて、質問に答えてください。\n\n研究者：地方創生の文脈でこれまで重視されてきたのは、都市住民を地方に移住させる「定住人口」の増加でした。しかし、人口減少が加速する日本において、移住だけを出口にするのは現実的ではありません。近年注目されているのが「関係人口」という概念です。観光客でも移住者でもなく、地域と継続的・多様な形で関わる人々のことです。たとえば、週末だけ農作業を手伝うIT企業勤務者や、副業で地域の課題解決に取り組む都市住民などがそれに当たります。地域への愛着を持つ関係人口を育てることが、長期的な地方の活性化には欠かせません。\n\n質問：この研究者が最も伝えたいことは何か。',
      'multiple_choice'
    )
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (qid, E'地方への移住を促進するために住宅補助などの経済的支援を強化すべきだ', false, 1),
    (qid, E'観光業の振興が地域経済の立て直しに最も効果的だ', false, 2),
    (qid, E'地方創生には移住だけでなく関係人口という多様な関わり方の育成が重要だ', true, 3),
    (qid, E'テレワークの普及が地方移住を促進し、地域活性化につながる', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id_var, qid, 'choukai', 17, 3, '概要理解');

  -- sort_order 18: 持続可能な農業
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES (
      'bb000001-0000-0000-0000-000000000003'::uuid,
      E'次のシンポジウムの講演を聴いて、質問に答えてください。\n\n農業研究者：現代の農業は、化学肥料や農薬に依存して収量を最大化することを追求してきました。しかしそのツケとして、土壌の劣化や水質汚染、生物多様性の喪失が深刻化しています。農業の持続可能性を高めるためには、短期的な収量を追うことよりも、土壌の健全さを守り、生態系と共存する農法へと転換することが求められます。有機農業や不耕起栽培は収量で劣ると思われがちですが、長期的には土地の生産力を維持できることが研究で示されています。食料安全保障の観点からも、私たちは農業のあり方を根本から見直す時期に来ています。\n\n質問：この農業研究者が最も伝えたいことは何か。',
      'multiple_choice'
    )
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (qid, E'化学肥料の使用を法律で禁止し、有機農業への移行を義務化すべきだ', false, 1),
    (qid, E'収量最大化から土壌・生態系との共存を重視する農業への転換が必要だ', true, 2),
    (qid, E'農業の担い手不足を解消するためにAI・ロボット技術の導入を急ぐべきだ', false, 3),
    (qid, E'食料安全保障のために輸入依存を減らし国内自給率を高めるべきだ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id_var, qid, 'choukai', 18, 3, '概要理解');
END$$;

-- =====================================================================
-- Set 4  quiz_id: ad000001-0000-0000-0000-000000000143
-- =====================================================================
DO $$
DECLARE
  set_id_var UUID;
  qid UUID;
BEGIN
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level = 'N1' AND set_no = 4;

  -- sort_order 17: 少子化対策の課題
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES (
      'ad000001-0000-0000-0000-000000000143'::uuid,
      E'次の講演を聴いて、質問に答えてください。\n\nジェンダー研究者：政府の少子化対策では、育児休業制度の拡充や保育所の整備など、子育てに関わる制度面の改善が中心となっています。しかし、根本的な問題は依然として解決されていません。それは、育児・家事の負担が女性に偏って集中しているという現実です。男性の育休取得率は低いままであり、職場での昇進においても子育て中の女性は不利な立場に置かれ続けています。制度を整えるだけでなく、職場文化や男性の意識そのものを変えなければ、女性は子どもを産み育てながらキャリアを諦めるという選択を迫られ続けます。少子化の解決には、ジェンダー平等の実現こそが本質的な鍵です。\n\n質問：このジェンダー研究者が最も伝えたいことは何か。',
      'multiple_choice'
    )
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (qid, E'保育所の整備不足が少子化の主な原因であり、早急な拡充が必要だ', false, 1),
    (qid, E'少子化の根本解決には育児負担の偏りを是正するジェンダー平等の推進が不可欠だ', true, 2),
    (qid, E'男性が育休を取得しやすくなるよう、育休中の給付金を大幅に増額すべきだ', false, 3),
    (qid, E'少子化対策の財源確保のために社会保険料の引き上げが避けられない', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id_var, qid, 'choukai', 17, 3, '概要理解');

  -- sort_order 18: サーキュラーエコノミー
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES (
      'ad000001-0000-0000-0000-000000000143'::uuid,
      E'次のビジネスセミナーの講演を聴いて、質問に答えてください。\n\nコンサルタント：これまでの経済モデルは、資源を採取して製品を作り、使い終わったら廃棄するという一方向の「直線型」でした。これに対して、廃棄物を資源として再利用し、製品の寿命を延ばすことで廃棄物そのものを出さないようにする「循環型経済」への転換が世界的に注目されています。一部の企業はこれをコスト増大と捉えていますが、それは誤りです。リサイクル素材の活用やサービス化によるビジネスモデルの変革は、新たな収益機会を生み出します。循環型経済への移行は、環境への責任を果たしながら同時に競争優位性を獲得できる戦略的な選択肢なのです。\n\n質問：このコンサルタントが最も伝えたいことは何か。',
      'multiple_choice'
    )
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (qid, E'廃棄物ゼロを達成するためには製品の製造量を大幅に削減すべきだ', false, 1),
    (qid, E'循環型経済への移行は環境対応と同時に企業の成長機会にもなり得る', true, 2),
    (qid, E'資源の無駄遣いを防ぐために消費者の購買行動を抑制する規制が必要だ', false, 3),
    (qid, E'リサイクル技術への政府の補助金投入が循環型経済移行の鍵となる', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id_var, qid, 'choukai', 18, 3, '概要理解');
END$$;
