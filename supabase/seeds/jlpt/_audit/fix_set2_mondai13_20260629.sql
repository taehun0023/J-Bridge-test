-- Set 2 問題13: 콘텐츠 교체 (フレイレ 교육론 → ITスキルアップ研修センター 案内)
-- Set 3 問題13: 問1：/ 問2： 접두사 추가
DO $$
DECLARE
  q69_id UUID;
  q70_id UUID;
  s3_q69_id UUID;
  s3_q70_id UUID;
  sep TEXT := chr(10)||chr(10);
  notice TEXT;
BEGIN
  -- Set 2 問題13 question IDs
  SELECT qq.id INTO q69_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='dokkai'
    AND msq.daimon=13 AND msq.sort_order=24;

  SELECT qq.id INTO q70_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='dokkai'
    AND msq.daimon=13 AND msq.sort_order=25;

  -- Set 3 問題13 question IDs
  SELECT qq.id INTO s3_q69_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='dokkai'
    AND msq.daimon=13 AND msq.sort_order=24;

  SELECT qq.id INTO s3_q70_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='dokkai'
    AND msq.daimon=13 AND msq.sort_order=25;

  -- 案内文 본문 (공통)
  notice := '【ITスキルアップ研修センター　受講案内】' || sep ||
'本センターは、IT関連業務に従事中または転職を目指す方を対象としたスキルアップ研修を提供しています。' || sep ||
'■コース一覧' || chr(10) ||
'・エントリーコース　：火・木　18:30〜20:30　全10回　受講料：無料　※在職中の方のみ対象' || chr(10) ||
'・スタンダードコース：月・水　19:00〜21:00　全15回　受講料：25,000円' || chr(10) ||
'・プロフェッショナルコース：土　10:00〜17:00　全8回　受講料：40,000円　※スタンダードコース修了者のみ対象' || chr(10) ||
'・集中コース：平日連続5日間　9:00〜18:00　全5回　受講料：55,000円　※JLPT N2以上取得者のみ対象' || sep ||
'■受講資格' || chr(10) ||
'・18歳以上のIT関連職に在職中または転職希望の方' || chr(10) ||
'・同一期間中、複数コースへの同時申し込みは不可' || sep ||
'■申し込み方法' || chr(10) ||
'専用フォームより各コース開講日の21日前までにお申し込みください。' || chr(10) ||
'定員（各コース20名）を超えた場合は書類選考とします。' || chr(10) ||
'選考結果は開講日の10日前までにメールでご連絡します。' || sep ||
'■受講料のお支払い' || chr(10) ||
'受講確定通知の受領後7日以内にお振り込みください。' || chr(10) ||
'エントリーコースは受講料無料のため、申し込み完了をもって受講確定とします。' || sep ||
'■キャンセルについて' || chr(10) ||
'開講日7日前以降のキャンセルは受講料の返金ができません。' || chr(10) ||
'それ以前のキャンセルは受講料を全額返金いたします。' || sep ||
'■修了認定' || chr(10) ||
'全回数の3分の2以上出席した受講者に修了証を発行します。';

  -- Set 2 Q69 question_text 교체
  UPDATE quiz_questions SET question_text =
    notice || sep ||
    'パクさんはIT企業に在職中で、先月スタンダードコースを修了した。JLPT N2を取得しており、今期はプロフェッショナルコースと集中コースの両方に申し込みたいと考えている。パクさんが受講できるのはどれか。'
  WHERE id = q69_id;

  -- Set 2 Q69 options 교체
  DELETE FROM quiz_question_options WHERE question_id = q69_id;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (q69_id, 'スタンダードコースを修了してから半年が経過していないため、プロフェッショナルコースには申し込めない', false, 1),
    (q69_id, 'JLPT N2を取得しているが、在職中でないと集中コースには申し込めない', false, 2),
    (q69_id, 'どちらのコースも条件を満たしているが、同時申し込みはできないため、一方を選んで申し込むことができる', true, 3),
    (q69_id, '転職希望者ではないため、スタンダードコースとプロフェッショナルコースには申し込めない', false, 4);

  -- Set 2 Q70 question_text 교체
  UPDATE quiz_questions SET question_text =
    notice || sep ||
    'この案内の内容と合っているものはどれか。'
  WHERE id = q70_id;

  -- Set 2 Q70 options 교체
  DELETE FROM quiz_question_options WHERE question_id = q70_id;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
    (q70_id, 'エントリーコースは転職希望者であれば無料で受講できる', false, 1),
    (q70_id, '定員を超えた場合、全コースで抽選により受講者を決定する', false, 2),
    (q70_id, '修了証を受け取るには全回数出席しなければならない', false, 3),
    (q70_id, '受講確定の通知を受け取った後、7日以内に受講料を支払う必要がある', true, 4);

  -- Set 3 Q69: 問1： 접두사 추가
  UPDATE quiz_questions SET question_text =
    regexp_replace(question_text, E'\\n\\n([^\\n]+)$', sep || '問1：' || '\1')
  WHERE id = s3_q69_id
    AND question_text NOT LIKE '%問1：%';

  -- Set 3 Q70: 問2： 접두사 추가
  UPDATE quiz_questions SET question_text =
    regexp_replace(question_text, E'\\n\\n([^\\n]+)$', sep || '問2：' || '\1')
  WHERE id = s3_q70_id
    AND question_text NOT LIKE '%問2：%';

  RAISE NOTICE 'Done. q69=%, q70=%, s3_q69=%, s3_q70=%', q69_id, q70_id, s3_q69_id, s3_q70_id;
END$$;

-- 확인
SELECT ms.set_no, msq.sort_order, RIGHT(qq.question_text, 100) AS tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
JOIN quiz_questions qq ON msq.question_id=qq.id
WHERE ms.level='N1' AND ms.set_no IN (2,3)
  AND msq.section='dokkai' AND msq.daimon=13
ORDER BY ms.set_no, msq.sort_order;
