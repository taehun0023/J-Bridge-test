BEGIN;
-- 漢字読み: Q1
UPDATE quiz_questions SET question_text=$Q$「蓄積」の読み方として正しいものはどれか。$Q$ WHERE id='0310ab82-8912-47ed-9023-da8744420b2b';
DELETE FROM quiz_question_options WHERE question_id='0310ab82-8912-47ed-9023-da8744420b2b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('0310ab82-8912-47ed-9023-da8744420b2b',$Q$じゅうせき$Q$,false,1),
('0310ab82-8912-47ed-9023-da8744420b2b',$Q$ちくせき$Q$,true,2),
('0310ab82-8912-47ed-9023-da8744420b2b',$Q$たくせき$Q$,false,3),
('0310ab82-8912-47ed-9023-da8744420b2b',$Q$ちくさく$Q$,false,4);

-- 表記: Q2
UPDATE quiz_questions SET question_text=$Q$「おびえる」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='0efaec70-e9ab-40a0-95f4-e4f2a190a23a';
DELETE FROM quiz_question_options WHERE question_id='0efaec70-e9ab-40a0-95f4-e4f2a190a23a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('0efaec70-e9ab-40a0-95f4-e4f2a190a23a',$Q$怖える$Q$,false,1),
('0efaec70-e9ab-40a0-95f4-e4f2a190a23a',$Q$脅える$Q$,false,2),
('0efaec70-e9ab-40a0-95f4-e4f2a190a23a',$Q$畏える$Q$,false,3),
('0efaec70-e9ab-40a0-95f4-e4f2a190a23a',$Q$怯える$Q$,true,4);

-- 用法: Q3
UPDATE quiz_questions SET question_text=$Q$次の文の中で、「賜る」が正しく使われているものはどれか。$Q$ WHERE id='13fa5144-fa21-4997-93b4-66fa77ecdc8b';
DELETE FROM quiz_question_options WHERE question_id='13fa5144-fa21-4997-93b4-66fa77ecdc8b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('13fa5144-fa21-4997-93b4-66fa77ecdc8b',$Q$先生より推薦のお言葉を賜り、誠にありがとうございます。$Q$,true,1),
('13fa5144-fa21-4997-93b4-66fa77ecdc8b',$Q$彼は友人から本を賜って、うれしそうだった。$Q$,false,2),
('13fa5144-fa21-4997-93b4-66fa77ecdc8b',$Q$子どもたちはお祭りで景品を賜った。$Q$,false,3),
('13fa5144-fa21-4997-93b4-66fa77ecdc8b',$Q$彼女はスーパーで買い物をして食料を賜った。$Q$,false,4);

-- 表記: Q4
UPDATE quiz_questions SET question_text=$Q$「せんどう」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='64782ac3-a52c-456a-9928-573db989d838';
DELETE FROM quiz_question_options WHERE question_id='64782ac3-a52c-456a-9928-573db989d838';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('64782ac3-a52c-456a-9928-573db989d838',$Q$旋動$Q$,false,1),
('64782ac3-a52c-456a-9928-573db989d838',$Q$繊動$Q$,false,2),
('64782ac3-a52c-456a-9928-573db989d838',$Q$扇動$Q$,true,3),
('64782ac3-a52c-456a-9928-573db989d838',$Q$線動$Q$,false,4);

-- 文脈規定: Q5
UPDATE quiz_questions SET question_text=$Q$スマートフォンの過剰使用による（　）として、睡眠障害や集中力の低下が挙げられる。$Q$ WHERE id='ac464b6c-e457-4c10-a133-71ed40a5a17c';
DELETE FROM quiz_question_options WHERE question_id='ac464b6c-e457-4c10-a133-71ed40a5a17c';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ac464b6c-e457-4c10-a133-71ed40a5a17c',$Q$害悪$Q$,false,1),
('ac464b6c-e457-4c10-a133-71ed40a5a17c',$Q$損害$Q$,false,2),
('ac464b6c-e457-4c10-a133-71ed40a5a17c',$Q$危害$Q$,false,3),
('ac464b6c-e457-4c10-a133-71ed40a5a17c',$Q$弊害$Q$,true,4);

-- 漢字読み: Q6
UPDATE quiz_questions SET question_text=$Q$「覆す」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000170001';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000170001';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000170001',$Q$ひるがえす$Q$,false,1),
('b0000001-0000-4000-a000-000000170001',$Q$くつがえす$Q$,true,2),
('b0000001-0000-4000-a000-000000170001',$Q$めくりかえす$Q$,false,3),
('b0000001-0000-4000-a000-000000170001',$Q$うつぶす$Q$,false,4);

-- 言い換え類義: Q7
UPDATE quiz_questions SET question_text=$Q$「彼は長年この分野の研究に携わってきた。」
「携わる」の意味に最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000170003';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000170003';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000170003',$Q$あこがれる$Q$,false,1),
('b0000001-0000-4000-a000-000000170003',$Q$集中する$Q$,false,2),
('b0000001-0000-4000-a000-000000170003',$Q$挑戦する$Q$,false,3),
('b0000001-0000-4000-a000-000000170003',$Q$従事する$Q$,true,4);

-- 用法: Q8
UPDATE quiz_questions SET question_text=$Q$次の文の中で、「妨げる」が正しく使われているものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000170004';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000170004';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000170004',$Q$友人が私の進路を妨げてくれたおかげで、就職に成功した。$Q$,false,1),
('b0000001-0000-4000-a000-000000170004',$Q$このカーテンは日光を妨げて、部屋を明るくする効果がある。$Q$,false,2),
('b0000001-0000-4000-a000-000000170004',$Q$他の学生の勉強を妨げないよう、図書館では静かにした。$Q$,true,3),
('b0000001-0000-4000-a000-000000170004',$Q$良い指導者は部下の成長を妨げるものだ。$Q$,false,4);

-- 言い換え類義: Q9
UPDATE quiz_questions SET question_text=$Q$「彼は大きな事故に巻き込まれたが、奇跡的に重傷を免れた。」
「免れる」の意味に最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000170006';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000170006';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000170006',$Q$逃れる$Q$,true,1),
('b0000001-0000-4000-a000-000000170006',$Q$乗り越える$Q$,false,2),
('b0000001-0000-4000-a000-000000170006',$Q$受け止める$Q$,false,3),
('b0000001-0000-4000-a000-000000170006',$Q$向き合う$Q$,false,4);

-- 用法: Q10
UPDATE quiz_questions SET question_text=$Q$次の文の中で、「促す」が正しく使われているものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000170007';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000170007';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000170007',$Q$友人は私の気持ちを促して、すっかり元気になった。$Q$,false,1),
('b0000001-0000-4000-a000-000000170007',$Q$医師は患者に早めの受診を促した。$Q$,true,2),
('b0000001-0000-4000-a000-000000170007',$Q$彼女は旅行の疲れを促して、ぐっすり眠れた。$Q$,false,3),
('b0000001-0000-4000-a000-000000170007',$Q$先生は生徒の成績の悪さを促した。$Q$,false,4);

-- 文脈規定: Q11
UPDATE quiz_questions SET question_text=$Q$これまでの研究成果を（　）、新たな仮説を立てることが重要だ。$Q$ WHERE id='b0000001-0000-4000-a000-000000170010';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000170010';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000170010',$Q$見据えて$Q$,false,1),
('b0000001-0000-4000-a000-000000170010',$Q$見越して$Q$,false,2),
('b0000001-0000-4000-a000-000000170010',$Q$踏まえて$Q$,true,3),
('b0000001-0000-4000-a000-000000170010',$Q$見込んで$Q$,false,4);

-- 言い換え類義: Q12
UPDATE quiz_questions SET question_text=$Q$「この10年間で、医療技術は目覚ましい進歩を遂げた。」
「目覚ましい」の意味に最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000180002';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000180002';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000180002',$Q$著しい$Q$,true,1),
('b0000001-0000-4000-a000-000000180002',$Q$わずかな$Q$,false,2),
('b0000001-0000-4000-a000-000000180002',$Q$穏やかな$Q$,false,3),
('b0000001-0000-4000-a000-000000180002',$Q$急激な$Q$,false,4);

-- 文脈規定: Q13
UPDATE quiz_questions SET question_text=$Q$この地域では近年、人口の減少傾向が（　）に現れている。$Q$ WHERE id='b0000001-0000-4000-a000-000000180004';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000180004';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000180004',$Q$露骨$Q$,false,1),
('b0000001-0000-4000-a000-000000180004',$Q$顕著$Q$,true,2),
('b0000001-0000-4000-a000-000000180004',$Q$明確$Q$,false,3),
('b0000001-0000-4000-a000-000000180004',$Q$鮮明$Q$,false,4);

-- 漢字読み: Q14
UPDATE quiz_questions SET question_text=$Q$「莫大」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000180005';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000180005';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000180005',$Q$はくだい$Q$,false,1),
('b0000001-0000-4000-a000-000000180005',$Q$もくだい$Q$,false,2),
('b0000001-0000-4000-a000-000000180005',$Q$まくだい$Q$,false,3),
('b0000001-0000-4000-a000-000000180005',$Q$ばくだい$Q$,true,4);

-- 表記: Q15
UPDATE quiz_questions SET question_text=$Q$「ちみつ」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000180006';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000180006';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000180006',$Q$知密$Q$,false,1),
('b0000001-0000-4000-a000-000000180006',$Q$致密$Q$,false,2),
('b0000001-0000-4000-a000-000000180006',$Q$緻密$Q$,true,3),
('b0000001-0000-4000-a000-000000180006',$Q$遅密$Q$,false,4);

-- Q1: 繊細 (漢字読み)
UPDATE quiz_questions SET question_text=$Q$「繊細」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000180007';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000180007';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000180007',$Q$けんさい$Q$,false,1),
('b0000001-0000-4000-a000-000000180007',$Q$ぜんさい$Q$,false,2),
('b0000001-0000-4000-a000-000000180007',$Q$せんさい$Q$,true,3),
('b0000001-0000-4000-a000-000000180007',$Q$せんせい$Q$,false,4);

-- Q2: 過酷 (表記)
UPDATE quiz_questions SET question_text=$Q$「あの地域の気候はかこくで、夏でも雪が降ることがある。」の「かこく」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000180008';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000180008';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000180008',$Q$禍酷$Q$,false,1),
('b0000001-0000-4000-a000-000000180008',$Q$過酷$Q$,true,2),
('b0000001-0000-4000-a000-000000180008',$Q$渦酷$Q$,false,3),
('b0000001-0000-4000-a000-000000180008',$Q$加酷$Q$,false,4);

-- Q3: 厳密 (文脈規定)
UPDATE quiz_questions SET question_text=$Q$この規定を（　）に解釈すれば、彼の行為は明らかに違反に当たる。$Q$ WHERE id='b0000001-0000-4000-a000-000000180009';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000180009';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000180009',$Q$鮮明$Q$,false,1),
('b0000001-0000-4000-a000-000000180009',$Q$厳密$Q$,true,2),
('b0000001-0000-4000-a000-000000180009',$Q$壮大$Q$,false,3),
('b0000001-0000-4000-a000-000000180009',$Q$優雅$Q$,false,4);

-- Q4: 覆る (漢字読み)
UPDATE quiz_questions SET question_text=$Q$「覆る」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003d3';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003d3';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003d3',$Q$くつがえる$Q$,true,1),
('b0000001-0000-4000-a000-0000002003d3',$Q$おおいかえる$Q$,false,2),
('b0000001-0000-4000-a000-0000002003d3',$Q$くりかえる$Q$,false,3),
('b0000001-0000-4000-a000-0000002003d3',$Q$ふくがえる$Q$,false,4);

-- Q5: 見なす (表記)
UPDATE quiz_questions SET question_text=$Q$「その証言は信用できないとみなされた。」の「みなす」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003d4';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003d4';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003d4',$Q$視なす$Q$,false,1),
('b0000001-0000-4000-a000-0000002003d4',$Q$看なす$Q$,false,2),
('b0000001-0000-4000-a000-0000002003d4',$Q$認なす$Q$,false,3),
('b0000001-0000-4000-a000-0000002003d4',$Q$見なす$Q$,true,4);

-- Q6: 損なう (文脈規定)
UPDATE quiz_questions SET question_text=$Q$過度のストレスが続くと、心身の健康を（　）おそれがある。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003d5';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003d5';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003d5',$Q$潤す$Q$,false,1),
('b0000001-0000-4000-a000-0000002003d5',$Q$賄う$Q$,false,2),
('b0000001-0000-4000-a000-0000002003d5',$Q$損なう$Q$,true,3),
('b0000001-0000-4000-a000-0000002003d5',$Q$費やす$Q$,false,4);

-- Q7: 潤う (漢字読み)
UPDATE quiz_questions SET question_text=$Q$「潤う」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003d6';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003d6';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003d6',$Q$うるおう$Q$,true,1),
('b0000001-0000-4000-a000-0000002003d6',$Q$じゅんおう$Q$,false,2),
('b0000001-0000-4000-a000-0000002003d6',$Q$うるう$Q$,false,3),
('b0000001-0000-4000-a000-0000002003d6',$Q$うるわう$Q$,false,4);

-- Q8: 費やす (表記)
UPDATE quiz_questions SET question_text=$Q$「彼は研究に多くの時間をついやした。」の「ついやす」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003d7';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003d7';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003d7',$Q$委やす$Q$,false,1),
('b0000001-0000-4000-a000-0000002003d7',$Q$費やす$Q$,true,2),
('b0000001-0000-4000-a000-0000002003d7',$Q$払やす$Q$,false,3),
('b0000001-0000-4000-a000-0000002003d7',$Q$浪やす$Q$,false,4);

-- Q9: 賄う (文脈規定)
UPDATE quiz_questions SET question_text=$Q$アルバイトの収入だけでは学費や生活費を（　）ことが難しくなってきた。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003d8';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003d8';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003d8',$Q$損なう$Q$,false,1),
('b0000001-0000-4000-a000-0000002003d8',$Q$費やす$Q$,false,2),
('b0000001-0000-4000-a000-0000002003d8',$Q$潤す$Q$,false,3),
('b0000001-0000-4000-a000-0000002003d8',$Q$賄う$Q$,true,4);

-- Q10: 赴く (言い換え類義)
UPDATE quiz_questions SET question_text=$Q$彼は新たな任地に赴いた。「赴いた」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003da';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003da';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003da',$Q$向かった$Q$,true,1),
('b0000001-0000-4000-a000-0000002003da',$Q$去った$Q$,false,2),
('b0000001-0000-4000-a000-0000002003da',$Q$帰った$Q$,false,3),
('b0000001-0000-4000-a000-0000002003da',$Q$留まった$Q$,false,4);

-- Q11: 企てる (言い換え類義)
UPDATE quiz_questions SET question_text=$Q$反乱軍が政府の転覆を企てた。「企てた」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003db';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003db';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003db',$Q$実行した$Q$,false,1),
('b0000001-0000-4000-a000-0000002003db',$Q$命令した$Q$,false,2),
('b0000001-0000-4000-a000-0000002003db',$Q$計画した$Q$,true,3),
('b0000001-0000-4000-a000-0000002003db',$Q$中止した$Q$,false,4);

-- Q12: 募る (言い換え類義)
UPDATE quiz_questions SET question_text=$Q$組織では現在、新しいメンバーを募っている。「募っている」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003de';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003de';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003de',$Q$教育している$Q$,false,1),
('b0000001-0000-4000-a000-0000002003de',$Q$評価している$Q$,false,2),
('b0000001-0000-4000-a000-0000002003de',$Q$解雇している$Q$,false,3),
('b0000001-0000-4000-a000-0000002003de',$Q$集めている$Q$,true,4);

-- Q13: 兼ねる (用法)
UPDATE quiz_questions SET question_text=$Q$「兼ねる」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003df';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003df';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003df',$Q$病気を兼ねて、しばらく学校を休みます。$Q$,false,1),
('b0000001-0000-4000-a000-0000002003df',$Q$彼は社長と会長を兼ねており、会社全体を統括している。$Q$,true,2),
('b0000001-0000-4000-a000-0000002003df',$Q$大変な苦労を兼ねて、彼女はようやく夢を実現した。$Q$,false,3),
('b0000001-0000-4000-a000-0000002003df',$Q$試合に兼ねるため、毎日練習に励んでいる。$Q$,false,4);

-- Q14: 挑む (用法)
UPDATE quiz_questions SET question_text=$Q$「挑む」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003e0';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003e0';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003e0',$Q$毎朝、彼は朝食に挑んでから出勤する。$Q$,false,1),
('b0000001-0000-4000-a000-0000002003e0',$Q$彼女は疲れを感じたので、早めに就寝に挑んだ。$Q$,false,2),
('b0000001-0000-4000-a000-0000002003e0',$Q$若い研究者が長年未解決の難問に挑んでいる。$Q$,true,3),
('b0000001-0000-4000-a000-0000002003e0',$Q$彼は友人の誘いに挑んで、ともに旅行へ出かけた。$Q$,false,4);

-- Q15: 築く (用法)
UPDATE quiz_questions SET question_text=$Q$「築く」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003e1';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003e1';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003e1',$Q$彼女は長年の努力によって、確かなキャリアを築いてきた。$Q$,true,1),
('b0000001-0000-4000-a000-0000002003e1',$Q$父は毎晩、日記を築くことを習慣にしている。$Q$,false,2),
('b0000001-0000-4000-a000-0000002003e1',$Q$強い風が吹いて、倒木によって道路が築かれた。$Q$,false,3),
('b0000001-0000-4000-a000-0000002003e1',$Q$彼は試験に合格するため、懸命に勉強を築いた。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「廃れる」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003e6';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003e6';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003e6',$Q$はたれる$Q$,false,1),
('b0000001-0000-4000-a000-0000002003e6',$Q$すたれる$Q$,true,2),
('b0000001-0000-4000-a000-0000002003e6',$Q$すだれる$Q$,false,3),
('b0000001-0000-4000-a000-0000002003e6',$Q$すはれる$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「さとる」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003e9';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003e9';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003e9',$Q$哲る$Q$,false,1),
('b0000001-0000-4000-a000-0000002003e9',$Q$覚る$Q$,false,2),
('b0000001-0000-4000-a000-0000002003e9',$Q$悟る$Q$,true,3),
('b0000001-0000-4000-a000-0000002003e9',$Q$諭る$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「まぎれる」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003ec';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003ec';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003ec',$Q$粉れる$Q$,false,1),
('b0000001-0000-4000-a000-0000002003ec',$Q$紛れる$Q$,true,2),
('b0000001-0000-4000-a000-0000002003ec',$Q$絞れる$Q$,false,3),
('b0000001-0000-4000-a000-0000002003ec',$Q$糾れる$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「漂う」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003ef';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003ef';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003ef',$Q$たよわう$Q$,false,1),
('b0000001-0000-4000-a000-0000002003ef',$Q$たゆよう$Q$,false,2),
('b0000001-0000-4000-a000-0000002003ef',$Q$ただよう$Q$,true,3),
('b0000001-0000-4000-a000-0000002003ef',$Q$たどよう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$子どものころから父親を深く（　）いた彼は、同じ職業に就くことを夢見ていた。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003f1';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003f1';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003f1',$Q$操って$Q$,false,1),
('b0000001-0000-4000-a000-0000002003f1',$Q$慕って$Q$,true,2),
('b0000001-0000-4000-a000-0000002003f1',$Q$遡って$Q$,false,3),
('b0000001-0000-4000-a000-0000002003f1',$Q$覗いて$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$彼は巧みな話術で審査員を（　）、賞を不正に獲得した。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003f2';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003f2';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003f2',$Q$仰いで$Q$,false,1),
('b0000001-0000-4000-a000-0000002003f2',$Q$戒めて$Q$,false,2),
('b0000001-0000-4000-a000-0000002003f2',$Q$委ねて$Q$,false,3),
('b0000001-0000-4000-a000-0000002003f2',$Q$欺いて$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$先生は授業中に騒いだ生徒を厳しく戒めた。「戒めた」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003f4';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003f4';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003f4',$Q$励ました$Q$,false,1),
('b0000001-0000-4000-a000-0000002003f4',$Q$称えた$Q$,false,2),
('b0000001-0000-4000-a000-0000002003f4',$Q$諭した$Q$,true,3),
('b0000001-0000-4000-a000-0000002003f4',$Q$慰めた$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「委ねる」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003f5';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003f5';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003f5',$Q$彼女は荷物を棚に委ねて、身軽になった。$Q$,false,1),
('b0000001-0000-4000-a000-0000002003f5',$Q$彼は重い荷物を友人に委ねて、先に店へ入った。$Q$,false,2),
('b0000001-0000-4000-a000-0000002003f5',$Q$最終的な決定はチームリーダーの判断に委ねることにした。$Q$,true,3),
('b0000001-0000-4000-a000-0000002003f5',$Q$彼は仕事を委ねて、映画を見に行った。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「仰ぐ」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003f6';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003f6';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003f6',$Q$川の流れを仰いで、橋を渡った。$Q$,false,1),
('b0000001-0000-4000-a000-0000002003f6',$Q$困ったときは上司の指示を仰ぐのが適切だ。$Q$,true,2),
('b0000001-0000-4000-a000-0000002003f6',$Q$重い荷物を仰いで、坂を上った。$Q$,false,3),
('b0000001-0000-4000-a000-0000002003f6',$Q$彼は大声で彼女の名前を仰いだ。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$彼はどんな条件を出されても、その申し出を拒んだ。「拒んだ」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003f8';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003f8';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003f8',$Q$受け入れた$Q$,false,1),
('b0000001-0000-4000-a000-0000002003f8',$Q$断った$Q$,true,2),
('b0000001-0000-4000-a000-0000002003f8',$Q$放置した$Q$,false,3),
('b0000001-0000-4000-a000-0000002003f8',$Q$委ねた$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「操る」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003f9';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003f9';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003f9',$Q$彼女は辞書を操って、難しい単語を調べた。$Q$,false,1),
('b0000001-0000-4000-a000-0000002003f9',$Q$彼は本を操って、試験勉強をした。$Q$,false,2),
('b0000001-0000-4000-a000-0000002003f9',$Q$重い荷物を操って、倉庫まで運んだ。$Q$,false,3),
('b0000001-0000-4000-a000-0000002003f9',$Q$彼は三か国語を自在に操り、国際会議で通訳を務めた。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$彼は窓ガラス越しに室内を（　）、誰もいないことを確認した。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003fa';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003fa';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003fa',$Q$漂って$Q$,false,1),
('b0000001-0000-4000-a000-0000002003fa',$Q$阻んで$Q$,false,2),
('b0000001-0000-4000-a000-0000002003fa',$Q$覗いて$Q$,true,3),
('b0000001-0000-4000-a000-0000002003fa',$Q$廃れて$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「遡る」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003fb';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003fb';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003fb',$Q$さかもどる$Q$,false,1),
('b0000001-0000-4000-a000-0000002003fb',$Q$さかのぼる$Q$,true,2),
('b0000001-0000-4000-a000-0000002003fb',$Q$さかのへる$Q$,false,3),
('b0000001-0000-4000-a000-0000002003fb',$Q$さかのとる$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「はばむ」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003fd';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003fd';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003fd',$Q$妨む$Q$,false,1),
('b0000001-0000-4000-a000-0000002003fd',$Q$遮む$Q$,false,2),
('b0000001-0000-4000-a000-0000002003fd',$Q$塞む$Q$,false,3),
('b0000001-0000-4000-a000-0000002003fd',$Q$阻む$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「著しい」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003fe';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003fe';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003fe',$Q$いちじかしい$Q$,false,1),
('b0000001-0000-4000-a000-0000002003fe',$Q$いちしるしい$Q$,false,2),
('b0000001-0000-4000-a000-0000002003fe',$Q$いちじよしい$Q$,false,3),
('b0000001-0000-4000-a000-0000002003fe',$Q$いちじるしい$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$夜遅く怪しい人物が建物の周りをうろついているのを目撃した。「怪しい」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003ff';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003ff';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003ff',$Q$珍しい$Q$,false,1),
('b0000001-0000-4000-a000-0000002003ff',$Q$激しい$Q$,false,2),
('b0000001-0000-4000-a000-0000002003ff',$Q$厳しい$Q$,false,3),
('b0000001-0000-4000-a000-0000002003ff',$Q$不審な$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「とぼしい」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200400';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200400';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200400',$Q$少しい$Q$,false,1),
('b0000001-0000-4000-a000-000000200400',$Q$乏しい$Q$,true,2),
('b0000001-0000-4000-a000-000000200400',$Q$貧しい$Q$,false,3),
('b0000001-0000-4000-a000-000000200400',$Q$欠しい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$どれだけ頑張っても認めてもらえず、空しい気持ちになった。「空しい」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200402';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200402';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200402',$Q$悔しい$Q$,false,1),
('b0000001-0000-4000-a000-000000200402',$Q$寂しい$Q$,false,2),
('b0000001-0000-4000-a000-000000200402',$Q$虚ろな$Q$,true,3),
('b0000001-0000-4000-a000-000000200402',$Q$辛い$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「慌ただしい」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200403';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200403';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200403',$Q$慌ただしい空気が漂い、皆が落ち着いた気分になった。$Q$,false,1),
('b0000001-0000-4000-a000-000000200403',$Q$彼女の慌ただしい話し方が、聞く人を安心させた。$Q$,false,2),
('b0000001-0000-4000-a000-000000200403',$Q$引っ越しや手続きが重なり、慌ただしい一週間を過ごした。$Q$,true,3),
('b0000001-0000-4000-a000-000000200403',$Q$慌ただしい風景を眺めながら、ゆっくりとお茶を飲んだ。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$朝の涼しい風が（　）、散歩をするのが楽しみになった。$Q$ WHERE id='b0000001-0000-4000-a000-000000200404';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200404';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200404',$Q$怪しく$Q$,false,1),
('b0000001-0000-4000-a000-000000200404',$Q$快く$Q$,true,2),
('b0000001-0000-4000-a000-000000200404',$Q$著しく$Q$,false,3),
('b0000001-0000-4000-a000-000000200404',$Q$乏しく$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「いさぎよい」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200405';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200405';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200405',$Q$清い$Q$,false,1),
('b0000001-0000-4000-a000-000000200405',$Q$浄い$Q$,false,2),
('b0000001-0000-4000-a000-000000200405',$Q$潔い$Q$,true,3),
('b0000001-0000-4000-a000-000000200405',$Q$聖い$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$こんなに立派な贈り物をいただくなんて、勿体ない限りです。「勿体ない」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200407';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200407';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200407',$Q$申し訳ない$Q$,false,1),
('b0000001-0000-4000-a000-000000200407',$Q$過分な$Q$,true,2),
('b0000001-0000-4000-a000-000000200407',$Q$恥ずかしい$Q$,false,3),
('b0000001-0000-4000-a000-000000200407',$Q$惜しい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$あの忌まわしい記憶は、今でも悪夢に出てくることがある。「忌まわしい」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200409';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200409';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200409',$Q$懐かしい$Q$,false,1),
('b0000001-0000-4000-a000-000000200409',$Q$羨ましい$Q$,false,2),
('b0000001-0000-4000-a000-000000200409',$Q$悲しい$Q$,false,3),
('b0000001-0000-4000-a000-000000200409',$Q$縁起の悪い$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「目まぐるしい」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020040a';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020040a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020040a',$Q$目まぐるしい朝日が窓から差し込み、目が覚めた。$Q$,false,1),
('b0000001-0000-4000-a000-00000020040a',$Q$最新技術の進歩は目まぐるしく、ついていくのが大変だ。$Q$,true,2),
('b0000001-0000-4000-a000-00000020040a',$Q$彼女の目まぐるしい歌声が会場を感動させた。$Q$,false,3),
('b0000001-0000-4000-a000-00000020040a',$Q$目まぐるしい天気が続き、洗濯物がよく乾いた。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「はかない」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020040c';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020040c';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020040c',$Q$幻い$Q$,false,1),
('b0000001-0000-4000-a000-00000020040c',$Q$幽い$Q$,false,2),
('b0000001-0000-4000-a000-00000020040c',$Q$夢い$Q$,false,3),
('b0000001-0000-4000-a000-00000020040c',$Q$儚い$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「壮大」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020040f';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020040f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020040f',$Q$しょうだい$Q$,false,1),
('b0000001-0000-4000-a000-00000020040f',$Q$そうたい$Q$,false,2),
('b0000001-0000-4000-a000-00000020040f',$Q$そうだい$Q$,true,3),
('b0000001-0000-4000-a000-00000020040f',$Q$ざいだい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「崇高」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200410';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200410';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200410',$Q$そうこう$Q$,false,1),
('b0000001-0000-4000-a000-000000200410',$Q$しゅうこう$Q$,false,2),
('b0000001-0000-4000-a000-000000200410',$Q$しゅうかい$Q$,false,3),
('b0000001-0000-4000-a000-000000200410',$Q$すうこう$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「卑怯」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200411';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200411';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200411',$Q$彼の卑怯な行動が、チームの士気を高めた。$Q$,false,1),
('b0000001-0000-4000-a000-000000200411',$Q$卑怯な工夫を凝らして、難問を解いた。$Q$,false,2),
('b0000001-0000-4000-a000-000000200411',$Q$彼女は卑怯な優しさで、皆から慕われた。$Q$,false,3),
('b0000001-0000-4000-a000-000000200411',$Q$正面から戦わず、陰で悪口を言うとは卑怯な行為だ。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$困難な問題に対して（　）な解決策に頼ると、同じ失敗を繰り返すことになる。$Q$ WHERE id='b0000001-0000-4000-a000-000000200414';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200414';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200414',$Q$崇高$Q$,false,1),
('b0000001-0000-4000-a000-000000200414',$Q$壮大$Q$,false,2),
('b0000001-0000-4000-a000-000000200414',$Q$安易$Q$,true,3),
('b0000001-0000-4000-a000-000000200414',$Q$卑怯$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$彼は周囲の反対を無視して（　）に話を進めたため、後でトラブルになった。$Q$ WHERE id='b0000001-0000-4000-a000-000000200416';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200416';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200416',$Q$崇高$Q$,false,1),
('b0000001-0000-4000-a000-000000200416',$Q$安易$Q$,false,2),
('b0000001-0000-4000-a000-000000200416',$Q$壮大$Q$,false,3),
('b0000001-0000-4000-a000-000000200416',$Q$強引$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「理念」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200418';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200418';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200418',$Q$りそう$Q$,false,1),
('b0000001-0000-4000-a000-000000200418',$Q$りねん$Q$,true,2),
('b0000001-0000-4000-a000-000000200418',$Q$りくつ$Q$,false,3),
('b0000001-0000-4000-a000-000000200418',$Q$りかい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「しんねん」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200419';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200419';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200419',$Q$真念$Q$,false,1),
('b0000001-0000-4000-a000-000000200419',$Q$新念$Q$,false,2),
('b0000001-0000-4000-a000-000000200419',$Q$信念$Q$,true,3),
('b0000001-0000-4000-a000-000000200419',$Q$深念$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$新しい（　）のもとで、組織全体の改革が進められている。$Q$ WHERE id='b0000001-0000-4000-a000-00000020041a';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020041a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020041a',$Q$手腕$Q$,false,1),
('b0000001-0000-4000-a000-00000020041a',$Q$趣旨$Q$,false,2),
('b0000001-0000-4000-a000-00000020041a',$Q$論点$Q$,false,3),
('b0000001-0000-4000-a000-00000020041a',$Q$体制$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「推移」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020041d';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020041d';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020041d',$Q$すいじゅん$Q$,false,1),
('b0000001-0000-4000-a000-00000020041d',$Q$すいい$Q$,true,2),
('b0000001-0000-4000-a000-00000020041d',$Q$すいこう$Q$,false,3),
('b0000001-0000-4000-a000-00000020041d',$Q$すいてい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$委員会は長期間にわたる調査の末、その企業の実態を明らかにした。「実態」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020041f';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020041f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020041f',$Q$姿勢$Q$,false,1),
('b0000001-0000-4000-a000-00000020041f',$Q$成果$Q$,false,2),
('b0000001-0000-4000-a000-00000020041f',$Q$実情$Q$,true,3),
('b0000001-0000-4000-a000-00000020041f',$Q$動向$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「しゅし」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200421';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200421';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200421',$Q$趣志$Q$,false,1),
('b0000001-0000-4000-a000-000000200421',$Q$趣意$Q$,false,2),
('b0000001-0000-4000-a000-000000200421',$Q$取旨$Q$,false,3),
('b0000001-0000-4000-a000-000000200421',$Q$趣旨$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$議論の（　）を明確にしないまま話し合いが進んだため、結論に至らなかった。$Q$ WHERE id='b0000001-0000-4000-a000-000000200424';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200424';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200424',$Q$水準$Q$,false,1),
('b0000001-0000-4000-a000-000000200424',$Q$論点$Q$,true,2),
('b0000001-0000-4000-a000-000000200424',$Q$手腕$Q$,false,3),
('b0000001-0000-4000-a000-000000200424',$Q$根拠$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「根拠」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200425';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200425';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200425',$Q$こんかく$Q$,false,1),
('b0000001-0000-4000-a000-000000200425',$Q$こんとく$Q$,false,2),
('b0000001-0000-4000-a000-000000200425',$Q$こんきょ$Q$,true,3),
('b0000001-0000-4000-a000-000000200425',$Q$こんご$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「前提」が正しく使われている文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200426';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200426';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200426',$Q$彼女の前提は誰よりも速く、周囲を驚かせた。$Q$,false,1),
('b0000001-0000-4000-a000-000000200426',$Q$長年の前提が実を結び、ついに賞を受賞した。$Q$,false,2),
('b0000001-0000-4000-a000-000000200426',$Q$監督は選手たちの前提を高く評価した。$Q$,false,3),
('b0000001-0000-4000-a000-000000200426',$Q$費用が増加することを前提に、予算案を見直した。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$彼女は音楽家としての素質に恵まれている。「素質」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200429';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200429';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200429',$Q$業績$Q$,false,1),
('b0000001-0000-4000-a000-000000200429',$Q$資質$Q$,true,2),
('b0000001-0000-4000-a000-000000200429',$Q$実績$Q$,false,3),
('b0000001-0000-4000-a000-000000200429',$Q$習慣$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「こうせき」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020042b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020042b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020042b',$Q$好績$Q$,false,1),
('b0000001-0000-4000-a000-00000020042b',$Q$功跡$Q$,false,2),
('b0000001-0000-4000-a000-00000020042b',$Q$功績$Q$,true,3),
('b0000001-0000-4000-a000-00000020042b',$Q$交績$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$若い頃に抱いた（　）を忘れず、彼は長年にわたって研究を続けた。$Q$ WHERE id='b0000001-0000-4000-a000-00000020042d';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020042d';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020042d',$Q$根拠$Q$,false,1),
('b0000001-0000-4000-a000-00000020042d',$Q$手腕$Q$,false,2),
('b0000001-0000-4000-a000-00000020042d',$Q$境遇$Q$,false,3),
('b0000001-0000-4000-a000-00000020042d',$Q$志$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「手腕」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020042f';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020042f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020042f',$Q$てわん$Q$,false,1),
('b0000001-0000-4000-a000-00000020042f',$Q$しゅわん$Q$,true,2),
('b0000001-0000-4000-a000-00000020042f',$Q$しゅかん$Q$,false,3),
('b0000001-0000-4000-a000-00000020042f',$Q$てかん$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「境遇」が正しく使われている文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200430';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200430';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200430',$Q$彼女の境遇は会議の中で最も説得力があった。$Q$,false,1),
('b0000001-0000-4000-a000-000000200430',$Q$その計画の境遇を詳しく説明してください。$Q$,false,2),
('b0000001-0000-4000-a000-000000200430',$Q$幼い頃から苦しい境遇の中で育った彼は、人の痛みがわかる人間になった。$Q$,true,3),
('b0000001-0000-4000-a000-000000200430',$Q$境遇を整理してから次の段階に進もう。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$この国の教育の水準は世界的に高い評価を受けている。「水準」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200433';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200433';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200433',$Q$目標$Q$,false,1),
('b0000001-0000-4000-a000-000000200433',$Q$傾向$Q$,false,2),
('b0000001-0000-4000-a000-000000200433',$Q$実態$Q$,false,3),
('b0000001-0000-4000-a000-000000200433',$Q$レベル$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「大幅」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200435';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200435';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200435',$Q$だいはば$Q$,false,1),
('b0000001-0000-4000-a000-000000200435',$Q$おおはば$Q$,true,2),
('b0000001-0000-4000-a000-000000200435',$Q$おおふく$Q$,false,3),
('b0000001-0000-4000-a000-000000200435',$Q$だいふく$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$地域活性化計画の（　）として、新しい文化施設が建設された。$Q$ WHERE id='b0000001-0000-4000-a000-000000200436';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200436';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200436',$Q$指標$Q$,false,1),
('b0000001-0000-4000-a000-000000200436',$Q$論点$Q$,false,2),
('b0000001-0000-4000-a000-000000200436',$Q$一環$Q$,true,3),
('b0000001-0000-4000-a000-000000200436',$Q$趣旨$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「一端」が正しく使われている文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200437';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200437';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200437',$Q$新しい一端のビルが建設された。$Q$,false,1),
('b0000001-0000-4000-a000-000000200437',$Q$彼は一端に仕事を辞めて旅に出た。$Q$,false,2),
('b0000001-0000-4000-a000-000000200437',$Q$彼女の一端な態度が周囲を戸惑わせた。$Q$,false,3),
('b0000001-0000-4000-a000-000000200437',$Q$彼の発言はこの問題の複雑さの一端を示していた。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「過程」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200439';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200439';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200439',$Q$かじょう$Q$,false,1),
('b0000001-0000-4000-a000-000000200439',$Q$かてい$Q$,true,2),
('b0000001-0000-4000-a000-000000200439',$Q$かこう$Q$,false,3),
('b0000001-0000-4000-a000-000000200439',$Q$かきょう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$この問題には経済的な側面もある。「側面」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020043b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020043b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020043b',$Q$立場$Q$,false,1),
('b0000001-0000-4000-a000-00000020043b',$Q$視野$Q$,false,2),
('b0000001-0000-4000-a000-00000020043b',$Q$面$Q$,true,3),
('b0000001-0000-4000-a000-00000020043b',$Q$境遇$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「観点」が正しく使われている文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020043c';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020043c';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020043c',$Q$彼の観点はいつも穏やかで、周囲の人を和ませる。$Q$,false,1),
('b0000001-0000-4000-a000-00000020043c',$Q$美しい観点からの景色が目の前に広がっていた。$Q$,false,2),
('b0000001-0000-4000-a000-00000020043c',$Q$その政策の観点は多くの市民から支持された。$Q$,false,3),
('b0000001-0000-4000-a000-00000020043c',$Q$環境保護の観点から、この計画を再検討すべきだ。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「しひょう」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020043e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020043e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020043e',$Q$示票$Q$,false,1),
('b0000001-0000-4000-a000-00000020043e',$Q$指標$Q$,true,2),
('b0000001-0000-4000-a000-00000020043e',$Q$指票$Q$,false,3),
('b0000001-0000-4000-a000-00000020043e',$Q$示標$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$彼女は独自の（　）で問題に取り組み、画期的な解決策を見つけた。$Q$ WHERE id='b0000001-0000-4000-a000-000000200440';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200440';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200440',$Q$一環$Q$,false,1),
('b0000001-0000-4000-a000-000000200440',$Q$素質$Q$,false,2),
('b0000001-0000-4000-a000-000000200440',$Q$手法$Q$,true,3),
('b0000001-0000-4000-a000-000000200440',$Q$論点$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$この事業を継続するための財源を確保することが急務となっている。「財源」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200443';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200443';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200443',$Q$利益$Q$,false,1),
('b0000001-0000-4000-a000-000000200443',$Q$予算$Q$,false,2),
('b0000001-0000-4000-a000-000000200443',$Q$収入$Q$,false,3),
('b0000001-0000-4000-a000-000000200443',$Q$資金源$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「しげん」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200444';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200444';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200444',$Q$資原$Q$,false,1),
('b0000001-0000-4000-a000-000000200444',$Q$資源$Q$,true,2),
('b0000001-0000-4000-a000-000000200444',$Q$資元$Q$,false,3),
('b0000001-0000-4000-a000-000000200444',$Q$資玄$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「余剰」が正しく使われている文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020044b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020044b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020044b',$Q$彼女の余剰な表現が詩に深みを与えた。$Q$,false,1),
('b0000001-0000-4000-a000-00000020044b',$Q$予定より時間が余剰したため、早めに終わることができた。$Q$,false,2),
('b0000001-0000-4000-a000-00000020044b',$Q$生産量が需要を上回り、余剰在庫が積み上がった。$Q$,true,3),
('b0000001-0000-4000-a000-00000020044b',$Q$チームに余剰の勇気を与えるよう、監督が選手を励ました。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$近年、新たな政治勢力が台頭してきた。「台頭」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020044c';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020044c';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020044c',$Q$衰退$Q$,false,1),
('b0000001-0000-4000-a000-00000020044c',$Q$退潮$Q$,false,2),
('b0000001-0000-4000-a000-00000020044c',$Q$撤退$Q$,false,3),
('b0000001-0000-4000-a000-00000020044c',$Q$勃興$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$競争の激しい市場では、弱い企業が（　）されるのは避けられない。$Q$ WHERE id='b0000001-0000-4000-a000-00000020044e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020044e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020044e',$Q$推移$Q$,false,1),
('b0000001-0000-4000-a000-00000020044e',$Q$淘汰$Q$,true,2),
('b0000001-0000-4000-a000-00000020044e',$Q$台頭$Q$,false,3),
('b0000001-0000-4000-a000-00000020044e',$Q$摩擦$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$両国間の貿易摩擦が深刻化している。「摩擦」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020044f';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020044f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020044f',$Q$競争$Q$,false,1),
('b0000001-0000-4000-a000-00000020044f',$Q$格差$Q$,false,2),
('b0000001-0000-4000-a000-00000020044f',$Q$対立$Q$,true,3),
('b0000001-0000-4000-a000-00000020044f',$Q$交渉$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「葛藤」が正しく使われている文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200450';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200450';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200450',$Q$彼は葛藤を積み重ね、やがて一流の職人へと成長した。$Q$,false,1),
('b0000001-0000-4000-a000-000000200450',$Q$その映画は観客に葛藤をもたらし、大きな感動を与えた。$Q$,false,2),
('b0000001-0000-4000-a000-000000200450',$Q$新商品の葛藤を詳しく説明してください。$Q$,false,3),
('b0000001-0000-4000-a000-000000200450',$Q$仕事を辞めるべきかどうか、彼女は長い間葛藤した。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「典型」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200454';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200454';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200454',$Q$でんけい$Q$,false,1),
('b0000001-0000-4000-a000-000000200454',$Q$てんけい$Q$,true,2),
('b0000001-0000-4000-a000-000000200454',$Q$てっけい$Q$,false,3),
('b0000001-0000-4000-a000-000000200454',$Q$てんかい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「兆候」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200455';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200455';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200455',$Q$じょうこう$Q$,false,1),
('b0000001-0000-4000-a000-000000200455',$Q$ちょうきょ$Q$,false,2),
('b0000001-0000-4000-a000-000000200455',$Q$ちょうこう$Q$,true,3),
('b0000001-0000-4000-a000-000000200455',$Q$ちょうご$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$この交渉はすっかり行き詰まっており、早急に局面を（　）する必要がある。$Q$ WHERE id='b0000001-0000-4000-a000-000000200456';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200456';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200456',$Q$打開$Q$,true,1),
('b0000001-0000-4000-a000-000000200456',$Q$改善$Q$,false,2),
('b0000001-0000-4000-a000-000000200456',$Q$解消$Q$,false,3),
('b0000001-0000-4000-a000-000000200456',$Q$転換$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「遂行」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200458';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200458';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200458',$Q$ついこう$Q$,false,1),
('b0000001-0000-4000-a000-000000200458',$Q$すいぎょう$Q$,false,2),
('b0000001-0000-4000-a000-000000200458',$Q$ずいこう$Q$,false,3),
('b0000001-0000-4000-a000-000000200458',$Q$すいこう$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$スマートフォンが広く（　）した結果、情報の入手方法は大きく様変わりした。$Q$ WHERE id='b0000001-0000-4000-a000-000000200459';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200459';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200459',$Q$発展$Q$,false,1),
('b0000001-0000-4000-a000-000000200459',$Q$普及$Q$,true,2),
('b0000001-0000-4000-a000-000000200459',$Q$販売$Q$,false,3),
('b0000001-0000-4000-a000-000000200459',$Q$流行$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$感情を抑制することが、冷静な判断につながる。下線部の「抑制」と最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020045c';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020045c';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020045c',$Q$排除$Q$,false,1),
('b0000001-0000-4000-a000-00000020045c',$Q$促進$Q$,false,2),
('b0000001-0000-4000-a000-00000020045c',$Q$制御$Q$,true,3),
('b0000001-0000-4000-a000-00000020045c',$Q$発散$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文のうち、「概して」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020045e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020045e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020045e',$Q$彼は概して急いで家を飛び出した。$Q$,false,1),
('b0000001-0000-4000-a000-00000020045e',$Q$試験の結果は概して発表された。$Q$,false,2),
('b0000001-0000-4000-a000-00000020045e',$Q$彼女は概して突然泣き出した。$Q$,false,3),
('b0000001-0000-4000-a000-00000020045e',$Q$この地域の夏は概して高温多湿だ。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$彼女は芸術全般に造詣が深いが、とりわけ音楽への情熱は格別だ。下線部の「とりわけ」と最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200463';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200463';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200463',$Q$特に$Q$,true,1),
('b0000001-0000-4000-a000-000000200463',$Q$もっぱら$Q$,false,2),
('b0000001-0000-4000-a000-000000200463',$Q$概して$Q$,false,3),
('b0000001-0000-4000-a000-000000200463',$Q$ひたすら$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$彼は定年退職してから、（　）俳句の創作に励んでいる。$Q$ WHERE id='b0000001-0000-4000-a000-000000200464';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200464';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200464',$Q$とりわけ$Q$,false,1),
('b0000001-0000-4000-a000-000000200464',$Q$もっぱら$Q$,true,2),
('b0000001-0000-4000-a000-000000200464',$Q$ことごとく$Q$,false,3),
('b0000001-0000-4000-a000-000000200464',$Q$概して$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文のうち、「ことごとく」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200465';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200465';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200465',$Q$昨日の会議でことごとく意見を述べた。$Q$,false,1),
('b0000001-0000-4000-a000-000000200465',$Q$彼はことごとく急いで駅へ向かった。$Q$,false,2),
('b0000001-0000-4000-a000-000000200465',$Q$彼の提案はことごとく却下された。$Q$,true,3),
('b0000001-0000-4000-a000-000000200465',$Q$ことごとく彼女は今日元気だ。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$物事は複雑なので、一概に良い悪いとは言い切れない。下線部の「一概に」と最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200467';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200467';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200467',$Q$急速に$Q$,false,1),
('b0000001-0000-4000-a000-000000200467',$Q$一時的に$Q$,false,2),
('b0000001-0000-4000-a000-000000200467',$Q$必ずしも$Q$,false,3),
('b0000001-0000-4000-a000-000000200467',$Q$一律に$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「遥かに」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020046d';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020046d';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020046d',$Q$はるかに$Q$,true,1),
('b0000001-0000-4000-a000-00000020046d',$Q$ようかに$Q$,false,2),
('b0000001-0000-4000-a000-00000020046d',$Q$とおかに$Q$,false,3),
('b0000001-0000-4000-a000-00000020046d',$Q$えんかに$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文のうち、「ろくに」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200470';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200470';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200470',$Q$彼はろくに努力して試験に合格した。$Q$,false,1),
('b0000001-0000-4000-a000-000000200470',$Q$ろくに食事もとれないほど、仕事が忙しかった。$Q$,true,2),
('b0000001-0000-4000-a000-000000200470',$Q$彼女はろくに親切に話しかけてくれた。$Q$,false,3),
('b0000001-0000-4000-a000-000000200470',$Q$子どもたちはろくに元気に遊んでいた。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$彼女は何気なく窓の外に視線を向けた。下線部の「何気なく」と最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200471';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200471';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200471',$Q$無造作に$Q$,false,1),
('b0000001-0000-4000-a000-000000200471',$Q$ぼんやりと$Q$,false,2),
('b0000001-0000-4000-a000-000000200471',$Q$さりげなく$Q$,true,3),
('b0000001-0000-4000-a000-000000200471',$Q$突然$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「予め」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200476';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200476';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200476',$Q$あらかた$Q$,false,1),
('b0000001-0000-4000-a000-000000200476',$Q$あらためて$Q$,false,2),
('b0000001-0000-4000-a000-000000200476',$Q$あらかね$Q$,false,3),
('b0000001-0000-4000-a000-000000200476',$Q$あらかじめ$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$彼は絶えず自己研鑽を続け、どんな状況でも成長しようとしていた。下線部の「絶えず」と最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200478';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200478';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200478',$Q$常に$Q$,true,1),
('b0000001-0000-4000-a000-000000200478',$Q$徐々に$Q$,false,2),
('b0000001-0000-4000-a000-000000200478',$Q$ひたすら$Q$,false,3),
('b0000001-0000-4000-a000-000000200478',$Q$かえって$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$あの事故から五年が経った今も、彼はその光景を（　）夢で見るという。$Q$ WHERE id='b0000001-0000-4000-a000-000000200479';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200479';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200479',$Q$かつて$Q$,false,1),
('b0000001-0000-4000-a000-000000200479',$Q$未だに$Q$,true,2),
('b0000001-0000-4000-a000-000000200479',$Q$もはや$Q$,false,3),
('b0000001-0000-4000-a000-000000200479',$Q$かえって$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文のうち、「依然として」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020047a';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020047a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020047a',$Q$彼は依然として突然倒れた。$Q$,false,1),
('b0000001-0000-4000-a000-00000020047a',$Q$彼女は依然として急いで走り去った。$Q$,false,2),
('b0000001-0000-4000-a000-00000020047a',$Q$問題は解決策が講じられた後も、依然として残っている。$Q$,true,3),
('b0000001-0000-4000-a000-00000020047a',$Q$依然として昨日雨が降った。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「元来」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020047b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020047b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020047b',$Q$もとらい$Q$,false,1),
('b0000001-0000-4000-a000-00000020047b',$Q$げんらい$Q$,false,2),
('b0000001-0000-4000-a000-00000020047b',$Q$もとき$Q$,false,3),
('b0000001-0000-4000-a000-00000020047b',$Q$がんらい$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「漸く」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020047d';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020047d';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020047d',$Q$ようやく$Q$,true,1),
('b0000001-0000-4000-a000-00000020047d',$Q$しだいに$Q$,false,2),
('b0000001-0000-4000-a000-00000020047d',$Q$おもむろに$Q$,false,3),
('b0000001-0000-4000-a000-00000020047d',$Q$にわかに$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「すなわち」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020047e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020047e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020047e',$Q$則ち$Q$,false,1),
('b0000001-0000-4000-a000-00000020047e',$Q$即ち$Q$,true,2),
('b0000001-0000-4000-a000-00000020047e',$Q$乃ち$Q$,false,3),
('b0000001-0000-4000-a000-00000020047e',$Q$直ち$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$現在の社会情勢（　）対応策を考えることが求められている。$Q$ WHERE id='b0000001-0000-4000-a000-000000200481';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200481';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200481',$Q$に先立ち$Q$,false,1),
('b0000001-0000-4000-a000-000000200481',$Q$に関わらず$Q$,false,2),
('b0000001-0000-4000-a000-000000200481',$Q$に即して$Q$,true,3),
('b0000001-0000-4000-a000-000000200481',$Q$に向けて$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「アンケートの結果をふまえて、新たな改善策を検討する。」の「ふまえて」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200482';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200482';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200482',$Q$蹈まえて$Q$,false,1),
('b0000001-0000-4000-a000-000000200482',$Q$踏みえて$Q$,false,2),
('b0000001-0000-4000-a000-000000200482',$Q$跨まえて$Q$,false,3),
('b0000001-0000-4000-a000-000000200482',$Q$踏まえて$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「天皇のちょくめいにより、特別な措置がとられた。」の「ちょくめい」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='c2944c3c-5524-4af1-aa14-7093e241983e';
DELETE FROM quiz_question_options WHERE question_id='c2944c3c-5524-4af1-aa14-7093e241983e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('c2944c3c-5524-4af1-aa14-7093e241983e',$Q$勅命$Q$,true,1),
('c2944c3c-5524-4af1-aa14-7093e241983e',$Q$勅銘$Q$,false,2),
('c2944c3c-5524-4af1-aa14-7093e241983e',$Q$詔命$Q$,false,3),
('c2944c3c-5524-4af1-aa14-7093e241983e',$Q$勅名$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「学んだ理論を日常生活でじっせんすることが重要だ。」の「じっせん」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='d56ef02f-e19c-4c54-a507-77148f1387ae';
DELETE FROM quiz_question_options WHERE question_id='d56ef02f-e19c-4c54-a507-77148f1387ae';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('d56ef02f-e19c-4c54-a507-77148f1387ae',$Q$実線$Q$,false,1),
('d56ef02f-e19c-4c54-a507-77148f1387ae',$Q$実践$Q$,true,2),
('d56ef02f-e19c-4c54-a507-77148f1387ae',$Q$実銭$Q$,false,3),
('d56ef02f-e19c-4c54-a507-77148f1387ae',$Q$実旋$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「容疑者はこうそくされ、警察署に連行された。」の「こうそく」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='d73b6017-7007-4de7-a5b5-e305eac8d65f';
DELETE FROM quiz_question_options WHERE question_id='d73b6017-7007-4de7-a5b5-e305eac8d65f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('d73b6017-7007-4de7-a5b5-e305eac8d65f',$Q$高速$Q$,false,1),
('d73b6017-7007-4de7-a5b5-e305eac8d65f',$Q$拘速$Q$,false,2),
('d73b6017-7007-4de7-a5b5-e305eac8d65f',$Q$拘束$Q$,true,3),
('d73b6017-7007-4de7-a5b5-e305eac8d65f',$Q$勾束$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「ほうしゅう」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='222937df-1d0b-459b-9430-9de0e23d1e82';
DELETE FROM quiz_question_options WHERE question_id='222937df-1d0b-459b-9430-9de0e23d1e82';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('222937df-1d0b-459b-9430-9de0e23d1e82',$Q$報告$Q$,false,1),
('222937df-1d0b-459b-9430-9de0e23d1e82',$Q$保証$Q$,false,2),
('222937df-1d0b-459b-9430-9de0e23d1e82',$Q$報酬$Q$,true,3),
('222937df-1d0b-459b-9430-9de0e23d1e82',$Q$奉仕$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「ゆしゅつ」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='76bc2283-0747-4f99-9f2f-97e213b8beba';
DELETE FROM quiz_question_options WHERE question_id='76bc2283-0747-4f99-9f2f-97e213b8beba';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('76bc2283-0747-4f99-9f2f-97e213b8beba',$Q$搬入$Q$,false,1),
('76bc2283-0747-4f99-9f2f-97e213b8beba',$Q$輸出$Q$,true,2),
('76bc2283-0747-4f99-9f2f-97e213b8beba',$Q$産出$Q$,false,3),
('76bc2283-0747-4f99-9f2f-97e213b8beba',$Q$輸入$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「繰り返す」の読み方として正しいものはどれか。$Q$ WHERE id='ae20266f-a1f4-4a02-9ab9-c1741c6f4b32';
DELETE FROM quiz_question_options WHERE question_id='ae20266f-a1f4-4a02-9ab9-c1741c6f4b32';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ae20266f-a1f4-4a02-9ab9-c1741c6f4b32',$Q$ぬりかえす$Q$,false,1),
('ae20266f-a1f4-4a02-9ab9-c1741c6f4b32',$Q$もりかえす$Q$,false,2),
('ae20266f-a1f4-4a02-9ab9-c1741c6f4b32',$Q$きりかえす$Q$,false,3),
('ae20266f-a1f4-4a02-9ab9-c1741c6f4b32',$Q$くりかえす$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$（　）に入る言葉として最も適切なものはどれか。「現在の生産水準を（　）するため、設備の点検を定期的に行っている。」$Q$ WHERE id='b0000001-0000-4000-a000-000000140006';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000140006';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000140006',$Q$改善$Q$,false,1),
('b0000001-0000-4000-a000-000000140006',$Q$維持$Q$,true,2),
('b0000001-0000-4000-a000-000000140006',$Q$向上$Q$,false,3),
('b0000001-0000-4000-a000-000000140006',$Q$強化$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「確認する」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000140007';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000140007';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000140007',$Q$確かめる$Q$,true,1),
('b0000001-0000-4000-a000-000000140007',$Q$分析する$Q$,false,2),
('b0000001-0000-4000-a000-000000140007',$Q$整理する$Q$,false,3),
('b0000001-0000-4000-a000-000000140007',$Q$調査する$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$（　）に入る言葉として最も適切なものはどれか。「このプロジェクトを成功させるために、チーム全員が（　）することが大切だ。」$Q$ WHERE id='b0000001-0000-4000-a000-000000140008';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000140008';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000140008',$Q$競争$Q$,false,1),
('b0000001-0000-4000-a000-000000140008',$Q$対立$Q$,false,2),
('b0000001-0000-4000-a000-000000140008',$Q$協力$Q$,true,3),
('b0000001-0000-4000-a000-000000140008',$Q$独立$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「影響する」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000150001';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000150001';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000150001',$Q$感動する$Q$,false,1),
('b0000001-0000-4000-a000-000000150001',$Q$作用する$Q$,true,2),
('b0000001-0000-4000-a000-000000150001',$Q$反映する$Q$,false,3),
('b0000001-0000-4000-a000-000000150001',$Q$注目する$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「成功する」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000150004';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000150004';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000150004',$Q$彼は昨日の試合で成功して、優勝した。$Q$,false,1),
('b0000001-0000-4000-a000-000000150004',$Q$新しい製品の開発プロジェクトが成功した。$Q$,true,2),
('b0000001-0000-4000-a000-000000150004',$Q$彼女は試験の問題を全部成功した。$Q$,false,3),
('b0000001-0000-4000-a000-000000150004',$Q$この薬は患者の体調を成功した。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「発展」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000150006';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000150006';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000150006',$Q$はっけん$Q$,false,1),
('b0000001-0000-4000-a000-000000150006',$Q$はつでん$Q$,false,2),
('b0000001-0000-4000-a000-000000150006',$Q$はってん$Q$,true,3),
('b0000001-0000-4000-a000-000000150006',$Q$はつこう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$（　）に入る言葉として最も適切なものはどれか。「膨大なデータを素早く（　）するために、新しいソフトウェアを導入した。」$Q$ WHERE id='b0000001-0000-4000-a000-000000150008';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000150008';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000150008',$Q$管理$Q$,false,1),
('b0000001-0000-4000-a000-000000150008',$Q$保存$Q$,false,2),
('b0000001-0000-4000-a000-000000150008',$Q$分析$Q$,false,3),
('b0000001-0000-4000-a000-000000150008',$Q$処理$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「導入する」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000150009';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000150009';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000150009',$Q$取り出す$Q$,false,1),
('b0000001-0000-4000-a000-000000150009',$Q$引き出す$Q$,false,2),
('b0000001-0000-4000-a000-000000150009',$Q$取り入れる$Q$,true,3),
('b0000001-0000-4000-a000-000000150009',$Q$取り除く$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「厳しい」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000160001';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000160001';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000160001',$Q$げんしい$Q$,false,1),
('b0000001-0000-4000-a000-000000160001',$Q$おそろしい$Q$,false,2),
('b0000001-0000-4000-a000-000000160001',$Q$はげしい$Q$,false,3),
('b0000001-0000-4000-a000-000000160001',$Q$きびしい$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「望ましい」に意味が最も近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000160003';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000160003';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000160003',$Q$珍しい$Q$,false,1),
('b0000001-0000-4000-a000-000000160003',$Q$好ましい$Q$,true,2),
('b0000001-0000-4000-a000-000000160003',$Q$懐かしい$Q$,false,3),
('b0000001-0000-4000-a000-000000160003',$Q$苦しい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$（　）に入る言葉として最も適切なものはどれか。「このパスポートは来年の３月まで（　）です。」$Q$ WHERE id='b0000001-0000-4000-a000-000000160004';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000160004';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000160004',$Q$無効$Q$,false,1),
('b0000001-0000-4000-a000-000000160004',$Q$安全$Q$,false,2),
('b0000001-0000-4000-a000-000000160004',$Q$有効$Q$,true,3),
('b0000001-0000-4000-a000-000000160004',$Q$正確$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「適切」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000160005';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000160005';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000160005',$Q$この問題は適切に正解した。$Q$,false,1),
('b0000001-0000-4000-a000-000000160005',$Q$状況に応じた適切な判断が求められる。$Q$,true,2),
('b0000001-0000-4000-a000-000000160005',$Q$彼は適切に走って試合に勝った。$Q$,false,3),
('b0000001-0000-4000-a000-000000160005',$Q$このスープは適切においしかった。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「明確」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000160006';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000160006';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000160006',$Q$みょうかく$Q$,false,1),
('b0000001-0000-4000-a000-000000160006',$Q$めいかく$Q$,true,2),
('b0000001-0000-4000-a000-000000160006',$Q$めいかん$Q$,false,3),
('b0000001-0000-4000-a000-000000160006',$Q$みょうこう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「おこる」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002c3';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002c3';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002c3',$Q$憤る$Q$,false,1),
('b0000001-0000-4000-a000-0000002002c3',$Q$焦る$Q$,false,2),
('b0000001-0000-4000-a000-0000002002c3',$Q$揺る$Q$,false,3),
('b0000001-0000-4000-a000-0000002002c3',$Q$怒る$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「驚く」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002c4';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002c4';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002c4',$Q$おどろく$Q$,true,1),
('b0000001-0000-4000-a000-0000002002c4',$Q$おそれく$Q$,false,2),
('b0000001-0000-4000-a000-0000002002c4',$Q$おそろく$Q$,false,3),
('b0000001-0000-4000-a000-0000002002c4',$Q$おびえく$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「彼は将来のことを悩んでいる。」の「悩んでいる」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002c5';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002c5';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002c5',$Q$興奮している$Q$,false,1),
('b0000001-0000-4000-a000-0000002002c5',$Q$驚いている$Q$,false,2),
('b0000001-0000-4000-a000-0000002002c5',$Q$苦しんでいる$Q$,true,3),
('b0000001-0000-4000-a000-0000002002c5',$Q$怒っている$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$失敗を（　　）ことで、人は大きく成長できる。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002c8';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002c8';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002c8',$Q$証明する$Q$,false,1),
('b0000001-0000-4000-a000-0000002002c8',$Q$経験する$Q$,true,2),
('b0000001-0000-4000-a000-0000002002c8',$Q$主張する$Q$,false,3),
('b0000001-0000-4000-a000-0000002002c8',$Q$発表する$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「しっぱいする」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002c9';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002c9';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002c9',$Q$失敗する$Q$,true,1),
('b0000001-0000-4000-a000-0000002002c9',$Q$実配する$Q$,false,2),
('b0000001-0000-4000-a000-0000002002c9',$Q$失取する$Q$,false,3),
('b0000001-0000-4000-a000-0000002002c9',$Q$実敗する$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「活用する」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002cb';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002cb';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002cb',$Q$試験に合格して、彼はとても活用した。$Q$,false,1),
('b0000001-0000-4000-a000-0000002002cb',$Q$彼女は疲れてソファに活用した。$Q$,false,2),
('b0000001-0000-4000-a000-0000002002cb',$Q$先生は生徒に理由を活用した。$Q$,false,3),
('b0000001-0000-4000-a000-0000002002cb',$Q$インターネットを活用して情報を集めた。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「発表」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002cc';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002cc';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002cc',$Q$はつひょう$Q$,false,1),
('b0000001-0000-4000-a000-0000002002cc',$Q$はつびょう$Q$,false,2),
('b0000001-0000-4000-a000-0000002002cc',$Q$はっぴょう$Q$,true,3),
('b0000001-0000-4000-a000-0000002002cc',$Q$はちびょう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「彼は自分の意見を強く主張した。」の「主張した」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002cd';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002cd';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002cd',$Q$紹介した$Q$,false,1),
('b0000001-0000-4000-a000-0000002002cd',$Q$訴えた$Q$,true,2),
('b0000001-0000-4000-a000-0000002002cd',$Q$経験した$Q$,false,3),
('b0000001-0000-4000-a000-0000002002cd',$Q$発展させた$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$顧客からの問い合わせに迅速に（　　）ことが、サービスの質を高める。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002d1';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002d1';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002d1',$Q$対応する$Q$,true,1),
('b0000001-0000-4000-a000-0000002002d1',$Q$主張する$Q$,false,2),
('b0000001-0000-4000-a000-0000002002d1',$Q$経験する$Q$,false,3),
('b0000001-0000-4000-a000-0000002002d1',$Q$変化する$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「へんかする」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002d5';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002d5';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002d5',$Q$辺下する$Q$,false,1),
('b0000001-0000-4000-a000-0000002002d5',$Q$辺化する$Q$,false,2),
('b0000001-0000-4000-a000-0000002002d5',$Q$変下する$Q$,false,3),
('b0000001-0000-4000-a000-0000002002d5',$Q$変化する$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「この実験は新しい理論を証明した。」の「証明した」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002d7';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002d7';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002d7',$Q$発表した$Q$,false,1),
('b0000001-0000-4000-a000-0000002002d7',$Q$活用した$Q$,false,2),
('b0000001-0000-4000-a000-0000002002d7',$Q$示した$Q$,true,3),
('b0000001-0000-4000-a000-0000002002d7',$Q$経験した$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「注目する」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002d9';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002d9';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002d9',$Q$試験に合格して、彼はとても注目した。$Q$,false,1),
('b0000001-0000-4000-a000-0000002002d9',$Q$環境問題に注目することが今求められている。$Q$,true,2),
('b0000001-0000-4000-a000-0000002002d9',$Q$彼女は体調が悪くて、今日は注目している。$Q$,false,3),
('b0000001-0000-4000-a000-0000002002d9',$Q$新しい服を買って、彼女は注目した。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$近年、この地域の外国人観光客が急速に（　　）している。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002df';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002df';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002df',$Q$増加$Q$,true,1),
('b0000001-0000-4000-a000-0000002002df',$Q$証明$Q$,false,2),
('b0000001-0000-4000-a000-0000002002df',$Q$主張$Q$,false,3),
('b0000001-0000-4000-a000-0000002002df',$Q$対応$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「共感する」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002e1';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002e1';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002e1',$Q$彼は問題をすばやく共感して、解決策を提案した。$Q$,false,1),
('b0000001-0000-4000-a000-0000002002e1',$Q$先生は生徒の間違いを共感した。$Q$,false,2),
('b0000001-0000-4000-a000-0000002002e1',$Q$彼女は試験に共感して合格した。$Q$,false,3),
('b0000001-0000-4000-a000-0000002002e1',$Q$彼の考えに共感し、同じ意見を持つ人が多かった。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「求める」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002e3';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002e3';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002e3',$Q$たずねる$Q$,false,1),
('b0000001-0000-4000-a000-0000002002e3',$Q$もとめる$Q$,true,2),
('b0000001-0000-4000-a000-0000002002e3',$Q$もとまる$Q$,false,3),
('b0000001-0000-4000-a000-0000002002e3',$Q$おとめる$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「しめす」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002e5';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002e5';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002e5',$Q$占す$Q$,false,1),
('b0000001-0000-4000-a000-0000002002e5',$Q$閉す$Q$,false,2),
('b0000001-0000-4000-a000-0000002002e5',$Q$示す$Q$,true,3),
('b0000001-0000-4000-a000-0000002002e5',$Q$締す$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$このクラスでは、女性が定員の大半を（　）いる。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002e6';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002e6';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002e6',$Q$求めて$Q$,false,1),
('b0000001-0000-4000-a000-0000002002e6',$Q$示して$Q$,false,2),
('b0000001-0000-4000-a000-0000002002e6',$Q$補って$Q$,false,3),
('b0000001-0000-4000-a000-0000002002e6',$Q$占めて$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「この報告書はデータに基づいて作成された。」下線部「基づいて」と最も意味が近いのはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002e8';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002e8';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002e8',$Q$基にして$Q$,true,1),
('b0000001-0000-4000-a000-0000002002e8',$Q$照らして$Q$,false,2),
('b0000001-0000-4000-a000-0000002002e8',$Q$頼って$Q$,false,3),
('b0000001-0000-4000-a000-0000002002e8',$Q$従って$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「果たす」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002ed';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002ed';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002ed',$Q$彼は毎晩プログラミングに果たして、ついに資格を取得した。$Q$,false,1),
('b0000001-0000-4000-a000-0000002002ed',$Q$彼女はプロジェクトで重要な役割を立派に果たした。$Q$,true,2),
('b0000001-0000-4000-a000-0000002002ed',$Q$先生は生徒に宿題を果たすよう強く指示した。$Q$,false,3),
('b0000001-0000-4000-a000-0000002002ed',$Q$彼は毎日ランニングを果たして健康を維持している。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「補う」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002f0';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002f0';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002f0',$Q$おそなう$Q$,false,1),
('b0000001-0000-4000-a000-0000002002f0',$Q$おきなう$Q$,false,2),
('b0000001-0000-4000-a000-0000002002f0',$Q$おぎなう$Q$,true,3),
('b0000001-0000-4000-a000-0000002002f0',$Q$おとなう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「あふれる」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002f4';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002f4';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002f4',$Q$流れる$Q$,false,1),
('b0000001-0000-4000-a000-0000002002f4',$Q$漏れる$Q$,false,2),
('b0000001-0000-4000-a000-0000002002f4',$Q$満れる$Q$,false,3),
('b0000001-0000-4000-a000-0000002002f4',$Q$溢れる$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$現在の計画を（　）、より良い方法を探すことにした。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002f6';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002f6';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002f6',$Q$見直して$Q$,true,1),
('b0000001-0000-4000-a000-0000002002f6',$Q$打ち込んで$Q$,false,2),
('b0000001-0000-4000-a000-0000002002f6',$Q$追い込んで$Q$,false,3),
('b0000001-0000-4000-a000-0000002002f6',$Q$補って$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「彼は最近プログラミングに打ち込んでいる。」下線部「打ち込んで」と最も意味が近いのはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002f9';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002f9';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002f9',$Q$取り組んで$Q$,false,1),
('b0000001-0000-4000-a000-0000002002f9',$Q$没頭して$Q$,true,2),
('b0000001-0000-4000-a000-0000002002f9',$Q$参加して$Q$,false,3),
('b0000001-0000-4000-a000-0000002002f9',$Q$頑張って$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「追い込む」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002fa';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002fa';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002fa',$Q$彼は毎晩勉強に追い込んで、ついに目標を達成した。$Q$,false,1),
('b0000001-0000-4000-a000-0000002002fa',$Q$彼女は上司を追い込んで新しいプロジェクトを提案した。$Q$,false,2),
('b0000001-0000-4000-a000-0000002002fa',$Q$締め切りが迫り、チームは限界まで追い込まれた。$Q$,true,3),
('b0000001-0000-4000-a000-0000002002fa',$Q$彼はゴールを決め、チームを勝利に追い込んだ。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「当てはまる」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002fc';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002fc';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002fc',$Q$このルールはすべての状況に当てはまるわけではない。$Q$,true,1),
('b0000001-0000-4000-a000-0000002002fc',$Q$彼は毎日スポーツに当てはまって体を鍛えている。$Q$,false,2),
('b0000001-0000-4000-a000-0000002002fc',$Q$彼女は試験勉強に当てはまって夜遅くまで続けた。$Q$,false,3),
('b0000001-0000-4000-a000-0000002002fc',$Q$先生は生徒に質問を当てはまって答えさせた。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「割り当てる」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002fe';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002fe';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002fe',$Q$彼女は友人に感謝の気持ちを割り当てた。$Q$,false,1),
('b0000001-0000-4000-a000-0000002002fe',$Q$先生は週末の予定を割り当てて旅行した。$Q$,false,2),
('b0000001-0000-4000-a000-0000002002fe',$Q$彼は失敗の原因を割り当てて次の挑戦に備えた。$Q$,false,3),
('b0000001-0000-4000-a000-0000002002fe',$Q$チームリーダーは各メンバーに担当業務を割り当てた。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「激しい」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002002ff';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002002ff';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002002ff',$Q$あらあらしい$Q$,false,1),
('b0000001-0000-4000-a000-0000002002ff',$Q$きびしい$Q$,false,2),
('b0000001-0000-4000-a000-0000002002ff',$Q$はげしい$Q$,true,3),
('b0000001-0000-4000-a000-0000002002ff',$Q$はなはだしい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「はずかしい」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200300';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200300';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200300',$Q$羞ずかしい$Q$,false,1),
('b0000001-0000-4000-a000-000000200300',$Q$恥ずかしい$Q$,true,2),
('b0000001-0000-4000-a000-000000200300',$Q$恋ずかしい$Q$,false,3),
('b0000001-0000-4000-a000-000000200300',$Q$恐ずかしい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$試合でわずかな差で負けてしまい、とても（　）。$Q$ WHERE id='b0000001-0000-4000-a000-000000200301';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200301';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200301',$Q$恥ずかしかった$Q$,false,1),
('b0000001-0000-4000-a000-000000200301',$Q$幼かった$Q$,false,2),
('b0000001-0000-4000-a000-000000200301',$Q$空しかった$Q$,false,3),
('b0000001-0000-4000-a000-000000200301',$Q$悔しかった$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「職場では好ましい態度で接することが大切だ。」下線部「好ましい」と最も意味が近いのはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200304';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200304';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200304',$Q$激しい$Q$,false,1),
('b0000001-0000-4000-a000-000000200304',$Q$望ましい$Q$,true,2),
('b0000001-0000-4000-a000-000000200304',$Q$勇ましい$Q$,false,3),
('b0000001-0000-4000-a000-000000200304',$Q$情けない$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「彼の勇ましい姿に、観客は深く感動した。」下線部「勇ましい」と最も意味が近いのはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200306';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200306';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200306',$Q$激しい$Q$,false,1),
('b0000001-0000-4000-a000-000000200306',$Q$頼もしい$Q$,false,2),
('b0000001-0000-4000-a000-000000200306',$Q$勇敢な$Q$,true,3),
('b0000001-0000-4000-a000-000000200306',$Q$目覚ましい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「空しい」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200309';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200309';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200309',$Q$長年の努力が認められず、彼は空しい気持ちになった。$Q$,true,1),
('b0000001-0000-4000-a000-000000200309',$Q$試合で勝利を収めた彼は空しい喜びで叫んだ。$Q$,false,2),
('b0000001-0000-4000-a000-000000200309',$Q$彼女の空しい声で、部屋に笑い声が広がった。$Q$,false,3),
('b0000001-0000-4000-a000-000000200309',$Q$この映画は空しい結末で、観客全員が大いに喜んだ。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「おさない」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020030b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020030b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020030b',$Q$若い$Q$,false,1),
('b0000001-0000-4000-a000-00000020030b',$Q$弱い$Q$,false,2),
('b0000001-0000-4000-a000-00000020030b',$Q$少ない$Q$,false,3),
('b0000001-0000-4000-a000-00000020030b',$Q$幼い$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「等しい」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020030c';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020030c';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020030c',$Q$おなじい$Q$,false,1),
('b0000001-0000-4000-a000-00000020030c',$Q$ひとしい$Q$,true,2),
('b0000001-0000-4000-a000-00000020030c',$Q$ただしい$Q$,false,3),
('b0000001-0000-4000-a000-00000020030c',$Q$たのしい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$料理の量は十分だったが、味が少し（　）感じた。$Q$ WHERE id='b0000001-0000-4000-a000-00000020030e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020030e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020030e',$Q$空しく$Q$,false,1),
('b0000001-0000-4000-a000-00000020030e',$Q$手堅く$Q$,false,2),
('b0000001-0000-4000-a000-00000020030e',$Q$物足りなく$Q$,true,3),
('b0000001-0000-4000-a000-00000020030e',$Q$目覚ましく$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「情けない」の使い方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020030f';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020030f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020030f',$Q$こんな簡単な問題も解けないとは、自分が情けない。$Q$,true,1),
('b0000001-0000-4000-a000-00000020030f',$Q$彼の情けない演奏で、観客は感動して涙を流した。$Q$,false,2),
('b0000001-0000-4000-a000-00000020030f',$Q$情けない結果を出した彼女は、周囲から高く評価された。$Q$,false,3),
('b0000001-0000-4000-a000-00000020030f',$Q$彼は情けない表情で恋人の帰りを喜んで迎えた。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「彼女の手堅いやり方で、プロジェクトは順調に進んだ。」下線部「手堅い」と最も意味が近いのはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200312';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200312';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200312',$Q$積極的な$Q$,false,1),
('b0000001-0000-4000-a000-000000200312',$Q$細かい$Q$,false,2),
('b0000001-0000-4000-a000-000000200312',$Q$着実な$Q$,true,3),
('b0000001-0000-4000-a000-000000200312',$Q$大胆な$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「その選手の目覚ましい活躍に、観客は大いに沸いた。」下線部「目覚ましい」と最も意味が近いのはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200313';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200313';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200313',$Q$穏やかな$Q$,false,1),
('b0000001-0000-4000-a000-000000200313',$Q$著しい$Q$,true,2),
('b0000001-0000-4000-a000-000000200313',$Q$地味な$Q$,false,3),
('b0000001-0000-4000-a000-000000200313',$Q$予想通りの$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「正確」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020031b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020031b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020031b',$Q$しょうかく$Q$,false,1),
('b0000001-0000-4000-a000-00000020031b',$Q$せいかつ$Q$,false,2),
('b0000001-0000-4000-a000-00000020031b',$Q$せっかく$Q$,false,3),
('b0000001-0000-4000-a000-00000020031b',$Q$せいかく$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「ひつよう」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020031f';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020031f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020031f',$Q$必要$Q$,true,1),
('b0000001-0000-4000-a000-00000020031f',$Q$必用$Q$,false,2),
('b0000001-0000-4000-a000-00000020031f',$Q$必様$Q$,false,3),
('b0000001-0000-4000-a000-00000020031f',$Q$匹要$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$彼は（　）な発想を持っており、どんな課題にも創造的に対応できる。$Q$ WHERE id='b0000001-0000-4000-a000-000000200325';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200325';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200325',$Q$多様$Q$,false,1),
('b0000001-0000-4000-a000-000000200325',$Q$独自$Q$,false,2),
('b0000001-0000-4000-a000-000000200325',$Q$正確$Q$,false,3),
('b0000001-0000-4000-a000-000000200325',$Q$柔軟$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「多様」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200326';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200326';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200326',$Q$おおよう$Q$,false,1),
('b0000001-0000-4000-a000-000000200326',$Q$たさい$Q$,false,2),
('b0000001-0000-4000-a000-000000200326',$Q$たよう$Q$,true,3),
('b0000001-0000-4000-a000-000000200326',$Q$だよう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$この会社は（　）の技術を開発し、他社には真似できない製品を提供している。$Q$ WHERE id='b0000001-0000-4000-a000-000000200327';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200327';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200327',$Q$柔軟$Q$,false,1),
('b0000001-0000-4000-a000-000000200327',$Q$独自$Q$,true,2),
('b0000001-0000-4000-a000-000000200327',$Q$多様$Q$,false,3),
('b0000001-0000-4000-a000-000000200327',$Q$正確$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「けいざい」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020032a';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020032a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020032a',$Q$経済$Q$,true,1),
('b0000001-0000-4000-a000-00000020032a',$Q$軽際$Q$,false,2),
('b0000001-0000-4000-a000-00000020032a',$Q$経際$Q$,false,3),
('b0000001-0000-4000-a000-00000020032a',$Q$系済$Q$,false,4);

-- Q1: 政治 / 漢字読み (answer=3)
UPDATE quiz_questions SET question_text=$Q$「政治」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020032b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020032b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020032b',$Q$せいち$Q$,false,1),
('b0000001-0000-4000-a000-00000020032b',$Q$まつりごと$Q$,false,2),
('b0000001-0000-4000-a000-00000020032b',$Q$せいじ$Q$,true,3),
('b0000001-0000-4000-a000-00000020032b',$Q$せいし$Q$,false,4);

-- Q2: 環境 / 文脈規定 (answer=3)
UPDATE quiz_questions SET question_text=$Q$地球温暖化に対応するため、（　）問題に取り組む必要がある。$Q$ WHERE id='b0000001-0000-4000-a000-00000020032d';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020032d';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020032d',$Q$産業$Q$,false,1),
('b0000001-0000-4000-a000-00000020032d',$Q$技術$Q$,false,2),
('b0000001-0000-4000-a000-00000020032d',$Q$環境$Q$,true,3),
('b0000001-0000-4000-a000-00000020032d',$Q$背景$Q$,false,4);

-- Q3: 技術 / 漢字読み (answer=4)
UPDATE quiz_questions SET question_text=$Q$「技術」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020032e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020032e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020032e',$Q$きじゅつ$Q$,false,1),
('b0000001-0000-4000-a000-00000020032e',$Q$ぎずつ$Q$,false,2),
('b0000001-0000-4000-a000-00000020032e',$Q$きずつ$Q$,false,3),
('b0000001-0000-4000-a000-00000020032e',$Q$ぎじゅつ$Q$,true,4);

-- Q4: 教育 / 表記 (answer=2)
UPDATE quiz_questions SET question_text=$Q$「きょういく」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200330';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200330';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200330',$Q$郷育$Q$,false,1),
('b0000001-0000-4000-a000-000000200330',$Q$教育$Q$,true,2),
('b0000001-0000-4000-a000-000000200330',$Q$境育$Q$,false,3),
('b0000001-0000-4000-a000-000000200330',$Q$協育$Q$,false,4);

-- Q5: 成果 / 文脈規定 (answer=1)
UPDATE quiz_questions SET question_text=$Q$研究チームは三年間の努力の（　）として、画期的な新薬を開発した。$Q$ WHERE id='b0000001-0000-4000-a000-000000200332';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200332';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200332',$Q$成果$Q$,true,1),
('b0000001-0000-4000-a000-000000200332',$Q$方針$Q$,false,2),
('b0000001-0000-4000-a000-000000200332',$Q$資金$Q$,false,3),
('b0000001-0000-4000-a000-000000200332',$Q$背景$Q$,false,4);

-- Q6: 特徴 / 言い換え類義 (answer=4)
UPDATE quiz_questions SET question_text=$Q$「この製品の特徴は、軽さと丈夫さを両立している点だ。」ここでの「特徴」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200337';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200337';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200337',$Q$欠点$Q$,false,1),
('b0000001-0000-4000-a000-000000200337',$Q$印象$Q$,false,2),
('b0000001-0000-4000-a000-000000200337',$Q$性質$Q$,false,3),
('b0000001-0000-4000-a000-000000200337',$Q$特色$Q$,true,4);

-- Q7: 効果 / 用法 (answer=2)
UPDATE quiz_questions SET question_text=$Q$「効果」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020033a';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020033a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020033a',$Q$この本はとても効果な内容を扱っている。$Q$,false,1),
('b0000001-0000-4000-a000-00000020033a',$Q$その新薬には高い治療効果が期待されている。$Q$,true,2),
('b0000001-0000-4000-a000-00000020033a',$Q$彼女は大きな効果で発言し、場を盛り上げた。$Q$,false,3),
('b0000001-0000-4000-a000-00000020033a',$Q$会議の内容を効果してメモに残した。$Q$,false,4);

-- Q8: 評価 / 漢字読み (answer=1)
UPDATE quiz_questions SET question_text=$Q$「評価」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020033b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020033b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020033b',$Q$ひょうか$Q$,true,1),
('b0000001-0000-4000-a000-00000020033b',$Q$ひょうが$Q$,false,2),
('b0000001-0000-4000-a000-00000020033b',$Q$へいか$Q$,false,3),
('b0000001-0000-4000-a000-00000020033b',$Q$へいが$Q$,false,4);

-- Q9: 制度 / 用法 (answer=3)
UPDATE quiz_questions SET question_text=$Q$「制度」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020033d';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020033d';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020033d',$Q$彼はとても制度のある人だと評判だ。$Q$,false,1),
('b0000001-0000-4000-a000-00000020033d',$Q$部屋の中を制度よく整理した。$Q$,false,2),
('b0000001-0000-4000-a000-00000020033d',$Q$社会保障制度の見直しが急務となっている。$Q$,true,3),
('b0000001-0000-4000-a000-00000020033d',$Q$彼は困難な問題を制度して乗り越えた。$Q$,false,4);

-- Q10: 対策 / 表記 (answer=4)
UPDATE quiz_questions SET question_text=$Q$「たいさく」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020033e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020033e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020033e',$Q$代作$Q$,false,1),
('b0000001-0000-4000-a000-00000020033e',$Q$体策$Q$,false,2),
('b0000001-0000-4000-a000-00000020033e',$Q$対作$Q$,false,3),
('b0000001-0000-4000-a000-00000020033e',$Q$対策$Q$,true,4);

-- Q11: 段階 / 言い換え類義 (answer=1)
UPDATE quiz_questions SET question_text=$Q$「プロジェクトは新しい段階に入り、本格的な開発が始まった。」ここでの「段階」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200342';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200342';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200342',$Q$局面$Q$,true,1),
('b0000001-0000-4000-a000-000000200342',$Q$状態$Q$,false,2),
('b0000001-0000-4000-a000-000000200342',$Q$現象$Q$,false,3),
('b0000001-0000-4000-a000-000000200342',$Q$方策$Q$,false,4);

-- Q12: 要因 / 用法 (answer=2)
UPDATE quiz_questions SET question_text=$Q$「要因」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200345';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200345';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200345',$Q$この問題を解決するために要因な対応が必要だ。$Q$,false,1),
('b0000001-0000-4000-a000-000000200345',$Q$景気悪化の要因を詳しく調べる必要がある。$Q$,true,2),
('b0000001-0000-4000-a000-000000200345',$Q$このレポートを要因に提出してください。$Q$,false,3),
('b0000001-0000-4000-a000-000000200345',$Q$彼は部活動の要因として活躍した。$Q$,false,4);

-- Q13: 分野 / 文脈規定 (answer=3)
UPDATE quiz_questions SET question_text=$Q$彼女は医療の（　）で長年にわたり研究を続けている。$Q$ WHERE id='b0000001-0000-4000-a000-000000200347';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200347';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200347',$Q$背景$Q$,false,1),
('b0000001-0000-4000-a000-000000200347',$Q$資料$Q$,false,2),
('b0000001-0000-4000-a000-000000200347',$Q$分野$Q$,true,3),
('b0000001-0000-4000-a000-000000200347',$Q$機能$Q$,false,4);

-- Q14: 課題 / 表記 (answer=4)
UPDATE quiz_questions SET question_text=$Q$「かだい」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020034c';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020034c';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020034c',$Q$科代$Q$,false,1),
('b0000001-0000-4000-a000-00000020034c',$Q$果題$Q$,false,2),
('b0000001-0000-4000-a000-00000020034c',$Q$科題$Q$,false,3),
('b0000001-0000-4000-a000-00000020034c',$Q$課題$Q$,true,4);

-- Q15: 概念 / 言い換え類義 (answer=3)
UPDATE quiz_questions SET question_text=$Q$「『自由』という概念は時代や文化によって異なる。」ここでの「概念」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020034e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020034e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020034e',$Q$状態$Q$,false,1),
('b0000001-0000-4000-a000-00000020034e',$Q$連携$Q$,false,2),
('b0000001-0000-4000-a000-00000020034e',$Q$観念$Q$,true,3),
('b0000001-0000-4000-a000-00000020034e',$Q$実施$Q$,false,4);

-- Q1: 比率 → 漢字読み (correct: pos 3)
UPDATE quiz_questions SET question_text=$Q$「比率」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200354';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200354';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200354',$Q$ひそつ$Q$,false,1),
('b0000001-0000-4000-a000-000000200354',$Q$びりつ$Q$,false,2),
('b0000001-0000-4000-a000-000000200354',$Q$ひりつ$Q$,true,3),
('b0000001-0000-4000-a000-000000200354',$Q$ひりょく$Q$,false,4);

-- Q2: 水準 → 表記 (correct: pos 1)
UPDATE quiz_questions SET question_text=$Q$「すいじゅん」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200355';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200355';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200355',$Q$水準$Q$,true,1),
('b0000001-0000-4000-a000-000000200355',$Q$水順$Q$,false,2),
('b0000001-0000-4000-a000-000000200355',$Q$水純$Q$,false,3),
('b0000001-0000-4000-a000-000000200355',$Q$水潤$Q$,false,4);

-- Q3: 資料 → 文脈規定 (correct: pos 4)
UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「会議では、参加者全員に（　）を配布してください。」$Q$ WHERE id='b0000001-0000-4000-a000-000000200358';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200358';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200358',$Q$原因$Q$,false,1),
('b0000001-0000-4000-a000-000000200358',$Q$方針$Q$,false,2),
('b0000001-0000-4000-a000-000000200358',$Q$条件$Q$,false,3),
('b0000001-0000-4000-a000-000000200358',$Q$資料$Q$,true,4);

-- Q4: 実績 → 言い換え類義 (correct: pos 2)
UPDATE quiz_questions SET question_text=$Q$「この会社はこれまでの＿実績＿をアピールして、新たな取引先を獲得した。」　＿実績＿に最も意味の近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020035a';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020035a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020035a',$Q$計画$Q$,false,1),
('b0000001-0000-4000-a000-00000020035a',$Q$成果$Q$,true,2),
('b0000001-0000-4000-a000-00000020035a',$Q$能力$Q$,false,3),
('b0000001-0000-4000-a000-00000020035a',$Q$報告$Q$,false,4);

-- Q5: 需要 → 文脈規定 (correct: pos 1)
UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「近年、環境に優しい製品への（　）が急速に高まっている。」$Q$ WHERE id='b0000001-0000-4000-a000-00000020035b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020035b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020035b',$Q$需要$Q$,true,1),
('b0000001-0000-4000-a000-00000020035b',$Q$供給$Q$,false,2),
('b0000001-0000-4000-a000-00000020035b',$Q$傾向$Q$,false,3),
('b0000001-0000-4000-a000-00000020035b',$Q$影響$Q$,false,4);

-- Q6: 供給 → 用法 (correct: pos 2)
UPDATE quiz_questions SET question_text=$Q$「供給」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020035c';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020035c';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020035c',$Q$彼は友人に元気を供給し続けた。$Q$,false,1),
('b0000001-0000-4000-a000-00000020035c',$Q$その工場は地域の家庭に電力を供給している。$Q$,true,2),
('b0000001-0000-4000-a000-00000020035c',$Q$新しいアイデアを供給して問題を解決した。$Q$,false,3),
('b0000001-0000-4000-a000-00000020035c',$Q$毎朝の運動で体力を供給することができる。$Q$,false,4);

-- Q7: 利益 → 漢字読み (correct: pos 3)
UPDATE quiz_questions SET question_text=$Q$「利益」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020035d';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020035d';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020035d',$Q$れいき$Q$,false,1),
('b0000001-0000-4000-a000-00000020035d',$Q$りいき$Q$,false,2),
('b0000001-0000-4000-a000-00000020035d',$Q$りえき$Q$,true,3),
('b0000001-0000-4000-a000-00000020035d',$Q$りきえき$Q$,false,4);

-- Q8: 損害 → 言い換え類義 (correct: pos 4)
UPDATE quiz_questions SET question_text=$Q$「台風によって、農業が大きな＿損害＿を受けた。」　＿損害＿に最も意味の近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020035e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020035e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020035e',$Q$変化$Q$,false,1),
('b0000001-0000-4000-a000-00000020035e',$Q$原因$Q$,false,2),
('b0000001-0000-4000-a000-00000020035e',$Q$費用$Q$,false,3),
('b0000001-0000-4000-a000-00000020035e',$Q$被害$Q$,true,4);

-- Q9: 負担 → 用法 (correct: pos 3)
UPDATE quiz_questions SET question_text=$Q$「負担」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020035f';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020035f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020035f',$Q$試験に合格して、大きな負担を感じた。$Q$,false,1),
('b0000001-0000-4000-a000-00000020035f',$Q$そのプロジェクトを負担するメンバーを募集した。$Q$,false,2),
('b0000001-0000-4000-a000-00000020035f',$Q$子どもの教育費が家計の大きな負担となっている。$Q$,true,3),
('b0000001-0000-4000-a000-00000020035f',$Q$毎日運動することで、健康への負担が高まった。$Q$,false,4);

-- Q10: 責任 → 文脈規定 (correct: pos 1)
UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「管理職として、チームの成果に（　）を持つことが重要だ。」$Q$ WHERE id='b0000001-0000-4000-a000-000000200360';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200360';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200360',$Q$責任$Q$,true,1),
('b0000001-0000-4000-a000-000000200360',$Q$手順$Q$,false,2),
('b0000001-0000-4000-a000-000000200360',$Q$能力$Q$,false,3),
('b0000001-0000-4000-a000-000000200360',$Q$判断$Q$,false,4);

-- Q11: 義務 → 漢字読み (correct: pos 2)
UPDATE quiz_questions SET question_text=$Q$「義務」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200361';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200361';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200361',$Q$きむ$Q$,false,1),
('b0000001-0000-4000-a000-000000200361',$Q$ぎむ$Q$,true,2),
('b0000001-0000-4000-a000-000000200361',$Q$よしむ$Q$,false,3),
('b0000001-0000-4000-a000-000000200361',$Q$ぎぼ$Q$,false,4);

-- Q12: 常識 → 表記 (correct: pos 4)
UPDATE quiz_questions SET question_text=$Q$「じょうしき」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200363';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200363';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200363',$Q$情識$Q$,false,1),
('b0000001-0000-4000-a000-000000200363',$Q$状識$Q$,false,2),
('b0000001-0000-4000-a000-000000200363',$Q$常式$Q$,false,3),
('b0000001-0000-4000-a000-000000200363',$Q$常識$Q$,true,4);

-- Q13: 意識 → 言い換え類義 (correct: pos 1)
UPDATE quiz_questions SET question_text=$Q$「最近、若者の環境問題への＿意識＿が高まっている。」　＿意識＿に最も意味の近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200364';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200364';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200364',$Q$関心$Q$,true,1),
('b0000001-0000-4000-a000-000000200364',$Q$技術$Q$,false,2),
('b0000001-0000-4000-a000-000000200364',$Q$知識$Q$,false,3),
('b0000001-0000-4000-a000-000000200364',$Q$条件$Q$,false,4);

-- Q14: 知識 → 用法 (correct: pos 4)
UPDATE quiz_questions SET question_text=$Q$「知識」の使い方として最も適切なものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200365';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200365';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200365',$Q$彼は困っている友人に知識をかけてあげた。$Q$,false,1),
('b0000001-0000-4000-a000-000000200365',$Q$大きな知識で試合に臨んだ結果、優勝した。$Q$,false,2),
('b0000001-0000-4000-a000-000000200365',$Q$毎日の運動で体への知識が上がった。$Q$,false,3),
('b0000001-0000-4000-a000-000000200365',$Q$この分野に関する専門的な知識があれば、転職に有利だ。$Q$,true,4);

-- Q15: 実力 → 表記 (correct: pos 2)
UPDATE quiz_questions SET question_text=$Q$「じつりょく」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200368';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200368';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200368',$Q$実緑$Q$,false,1),
('b0000001-0000-4000-a000-000000200368',$Q$実力$Q$,true,2),
('b0000001-0000-4000-a000-000000200368',$Q$実稜$Q$,false,3),
('b0000001-0000-4000-a000-000000200368',$Q$実録$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「影響」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020036e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020036e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020036e',$Q$えいきょ$Q$,false,1),
('b0000001-0000-4000-a000-00000020036e',$Q$えいこう$Q$,false,2),
('b0000001-0000-4000-a000-00000020036e',$Q$えいきょう$Q$,true,3),
('b0000001-0000-4000-a000-00000020036e',$Q$かげひびき$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「二つの出来事の間には深い（　）がある。」$Q$ WHERE id='b0000001-0000-4000-a000-00000020036f';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020036f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020036f',$Q$影響$Q$,false,1),
('b0000001-0000-4000-a000-00000020036f',$Q$関係$Q$,true,2),
('b0000001-0000-4000-a000-00000020036f',$Q$変化$Q$,false,3),
('b0000001-0000-4000-a000-00000020036f',$Q$規模$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「前提」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200371';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200371';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200371',$Q$まえてい$Q$,false,1),
('b0000001-0000-4000-a000-000000200371',$Q$ぜんたい$Q$,false,2),
('b0000001-0000-4000-a000-000000200371',$Q$ぜんさ$Q$,false,3),
('b0000001-0000-4000-a000-000000200371',$Q$ぜんてい$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「この地域の経済の展望は明るいと言われている。」「展望」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200372';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200372';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200372',$Q$現在の状況$Q$,false,1),
('b0000001-0000-4000-a000-000000200372',$Q$将来の見通し$Q$,true,2),
('b0000001-0000-4000-a000-000000200372',$Q$過去の実績$Q$,false,3),
('b0000001-0000-4000-a000-000000200372',$Q$外部からの影響$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「動向」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200373';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200373';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200373',$Q$うごむき$Q$,false,1),
('b0000001-0000-4000-a000-000000200373',$Q$どうむき$Q$,false,2),
('b0000001-0000-4000-a000-000000200373',$Q$どうこう$Q$,true,3),
('b0000001-0000-4000-a000-000000200373',$Q$どうこ$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「事故を防ぐため、適切な（　）を取る必要がある。」$Q$ WHERE id='b0000001-0000-4000-a000-000000200376';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200376';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200376',$Q$見解$Q$,false,1),
('b0000001-0000-4000-a000-000000200376',$Q$機会$Q$,false,2),
('b0000001-0000-4000-a000-000000200376',$Q$経過$Q$,false,3),
('b0000001-0000-4000-a000-000000200376',$Q$措置$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「体制」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200377';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200377';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200377',$Q$からだせい$Q$,false,1),
('b0000001-0000-4000-a000-000000200377',$Q$たいせい$Q$,true,2),
('b0000001-0000-4000-a000-000000200377',$Q$ていせい$Q$,false,3),
('b0000001-0000-4000-a000-000000200377',$Q$たいせき$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「この機械の仕組みはとても複雑だ。」「仕組み」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200378';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200378';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200378',$Q$目的$Q$,false,1),
('b0000001-0000-4000-a000-000000200378',$Q$効果$Q$,false,2),
('b0000001-0000-4000-a000-000000200378',$Q$構造$Q$,true,3),
('b0000001-0000-4000-a000-000000200378',$Q$状況$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「環境問題への積極的な（　）が求められている。」$Q$ WHERE id='b0000001-0000-4000-a000-000000200379';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200379';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200379',$Q$対話$Q$,false,1),
('b0000001-0000-4000-a000-000000200379',$Q$内容$Q$,false,2),
('b0000001-0000-4000-a000-000000200379',$Q$取り組み$Q$,true,3),
('b0000001-0000-4000-a000-000000200379',$Q$経験$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「実施」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020037a';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020037a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020037a',$Q$じつし$Q$,false,1),
('b0000001-0000-4000-a000-00000020037a',$Q$じっせ$Q$,false,2),
('b0000001-0000-4000-a000-00000020037a',$Q$じっち$Q$,false,3),
('b0000001-0000-4000-a000-00000020037a',$Q$じっし$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「新しい考え方が社会に浸透してきた。」「浸透」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020037e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020037e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020037e',$Q$消滅していく$Q$,false,1),
('b0000001-0000-4000-a000-00000020037e',$Q$広く普及していく$Q$,true,2),
('b0000001-0000-4000-a000-00000020037e',$Q$急速に変化する$Q$,false,3),
('b0000001-0000-4000-a000-00000020037e',$Q$大きく影響を与える$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「政府が発表した（　）によると、失業率は下がっているらしい。」$Q$ WHERE id='b0000001-0000-4000-a000-000000200382';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200382';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200382',$Q$法律$Q$,false,1),
('b0000001-0000-4000-a000-000000200382',$Q$統計$Q$,true,2),
('b0000001-0000-4000-a000-000000200382',$Q$意見$Q$,false,3),
('b0000001-0000-4000-a000-000000200382',$Q$技術$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「このプロジェクトを進めるには、十分な（　）を確保する必要がある。」$Q$ WHERE id='b0000001-0000-4000-a000-000000200383';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200383';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200383',$Q$情報$Q$,false,1),
('b0000001-0000-4000-a000-000000200383',$Q$目標$Q$,false,2),
('b0000001-0000-4000-a000-000000200383',$Q$予算$Q$,true,3),
('b0000001-0000-4000-a000-000000200383',$Q$設備$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「わが社では優れた（　）を育成することに力を入れている。」$Q$ WHERE id='b0000001-0000-4000-a000-000000200384';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200384';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200384',$Q$関係$Q$,false,1),
('b0000001-0000-4000-a000-000000200384',$Q$人材$Q$,true,2),
('b0000001-0000-4000-a000-000000200384',$Q$制度$Q$,false,3),
('b0000001-0000-4000-a000-000000200384',$Q$計画$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「若者の雇用を促進するための政策が必要だ。」「雇用」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200385';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200385';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200385',$Q$福祉$Q$,false,1),
('b0000001-0000-4000-a000-000000200385',$Q$訓練$Q$,false,2),
('b0000001-0000-4000-a000-000000200385',$Q$就業$Q$,true,3),
('b0000001-0000-4000-a000-000000200385',$Q$教育$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「彼女は長年にわたり、地域の発展に（　）してきた。」$Q$ WHERE id='b0000001-0000-4000-a000-000000200389';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200389';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200389',$Q$参加$Q$,false,1),
('b0000001-0000-4000-a000-000000200389',$Q$対応$Q$,false,2),
('b0000001-0000-4000-a000-000000200389',$Q$集中$Q$,false,3),
('b0000001-0000-4000-a000-000000200389',$Q$貢献$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「連携」の使い方として最も適切な文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020038a';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020038a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020038a',$Q$彼女は毎朝、隣の人と連携のあいさつをする。$Q$,false,1),
('b0000001-0000-4000-a000-00000020038a',$Q$二つの部署が連携して問題を解決した。$Q$,true,2),
('b0000001-0000-4000-a000-00000020038a',$Q$先生は授業中に教科書と連携を読んだ。$Q$,false,3),
('b0000001-0000-4000-a000-00000020038a',$Q$この道路は市内と郊外を連携している。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「むしろ」の使い方として最も適切な文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020038b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020038b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020038b',$Q$会議が終わった後、むしろ帰宅した。$Q$,false,1),
('b0000001-0000-4000-a000-00000020038b',$Q$失敗を怒るより、むしろ原因を考えるべきだ。$Q$,true,2),
('b0000001-0000-4000-a000-00000020038b',$Q$田んぼの後片付けにむしろをしっかり敷いた。$Q$,false,3),
('b0000001-0000-4000-a000-00000020038b',$Q$彼はむしろ早く仕事が終わったので、散歩に行った。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「彼の給料では、毎月（　）数万円しか貯金できない。」$Q$ WHERE id='b0000001-0000-4000-a000-00000020038d';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020038d';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020038d',$Q$せめて$Q$,false,1),
('b0000001-0000-4000-a000-00000020038d',$Q$ようやく$Q$,false,2),
('b0000001-0000-4000-a000-00000020038d',$Q$むしろ$Q$,false,3),
('b0000001-0000-4000-a000-00000020038d',$Q$せいぜい$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「忙しくても、（　）一日に一回は連絡してほしい。」$Q$ WHERE id='b0000001-0000-4000-a000-00000020038e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020038e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020038e',$Q$むしろ$Q$,false,1),
('b0000001-0000-4000-a000-00000020038e',$Q$せいぜい$Q$,false,2),
('b0000001-0000-4000-a000-00000020038e',$Q$せめて$Q$,true,3),
('b0000001-0000-4000-a000-00000020038e',$Q$やっと$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「わざわざ」の使い方として最も適切な文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200392';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200392';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200392',$Q$わざわざ疲れていたので、早めに帰宅した。$Q$,false,1),
('b0000001-0000-4000-a000-000000200392',$Q$わざわざ遠くから来てくださり、ありがとうございます。$Q$,true,2),
('b0000001-0000-4000-a000-000000200392',$Q$彼はわざわざ友達と一緒に毎日勉強する。$Q$,false,3),
('b0000001-0000-4000-a000-000000200392',$Q$試験がわざわざ終わったので、ほっとした。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「ようやく」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200395';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200395';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200395',$Q$遙く$Q$,false,1),
('b0000001-0000-4000-a000-000000200395',$Q$暫く$Q$,false,2),
('b0000001-0000-4000-a000-000000200395',$Q$漸く$Q$,true,3),
('b0000001-0000-4000-a000-000000200395',$Q$徐く$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「いずれ」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200396';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200396';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200396',$Q$其れ$Q$,false,1),
('b0000001-0000-4000-a000-000000200396',$Q$此れ$Q$,false,2),
('b0000001-0000-4000-a000-000000200396',$Q$彼れ$Q$,false,3),
('b0000001-0000-4000-a000-000000200396',$Q$何れ$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「一応」の使い方として最も適切な文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200397';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200397';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200397',$Q$彼女は一応の理由もなく遅刻した。$Q$,false,1),
('b0000001-0000-4000-a000-000000200397',$Q$念のため、一応書類を確認してください。$Q$,true,2),
('b0000001-0000-4000-a000-000000200397',$Q$一応の速さで仕事を終わらせた。$Q$,false,3),
('b0000001-0000-4000-a000-000000200397',$Q$その計画は一応に反対された。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「一層」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200398';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200398';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200398',$Q$いちそう$Q$,false,1),
('b0000001-0000-4000-a000-000000200398',$Q$いっそ$Q$,false,2),
('b0000001-0000-4000-a000-000000200398',$Q$いっそう$Q$,true,3),
('b0000001-0000-4000-a000-000000200398',$Q$ひとそう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「一斉に」の使い方として最も適切な文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-000000200399';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-000000200399';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-000000200399',$Q$彼は一斉に問題を一人で解いた。$Q$,false,1),
('b0000001-0000-4000-a000-000000200399',$Q$生徒たちは一斉に走り出した。$Q$,true,2),
('b0000001-0000-4000-a000-000000200399',$Q$試験は一斉に難しかった。$Q$,false,3),
('b0000001-0000-4000-a000-000000200399',$Q$彼女は一斉に頑張った。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$次の文の（　）に入る言葉として最も適切なものはどれか。「緊急事態が発生したため、（　）対応する必要がある。」$Q$ WHERE id='b0000001-0000-4000-a000-00000020039b';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020039b';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020039b',$Q$一応$Q$,false,1),
('b0000001-0000-4000-a000-00000020039b',$Q$むしろ$Q$,false,2),
('b0000001-0000-4000-a000-00000020039b',$Q$直ちに$Q$,true,3),
('b0000001-0000-4000-a000-00000020039b',$Q$概ね$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「おおむね」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-00000020039e';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-00000020039e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-00000020039e',$Q$大凡$Q$,false,1),
('b0000001-0000-4000-a000-00000020039e',$Q$大体$Q$,false,2),
('b0000001-0000-4000-a000-00000020039e',$Q$概ね$Q$,true,3),
('b0000001-0000-4000-a000-00000020039e',$Q$大半$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「必ずしも」の使い方として最も適切な文はどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003a0';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003a0';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003a0',$Q$彼は必ずしも約束を守る人だ。$Q$,false,1),
('b0000001-0000-4000-a000-0000002003a0',$Q$高いものが必ずしも良いとは限らない。$Q$,true,2),
('b0000001-0000-4000-a000-0000002003a0',$Q$彼女は必ずしも正直に話してくれた。$Q$,false,3),
('b0000001-0000-4000-a000-0000002003a0',$Q$必ずしも早く走れば試合に勝てる。$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「彼は相変わらず元気そうだ。」「相変わらず」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003a3';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003a3';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003a3',$Q$突然$Q$,false,1),
('b0000001-0000-4000-a000-0000002003a3',$Q$どうにか$Q$,false,2),
('b0000001-0000-4000-a000-0000002003a3',$Q$全く別の様子で$Q$,false,3),
('b0000001-0000-4000-a000-0000002003a3',$Q$以前と変わらず$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「予め」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003a4';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003a4';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003a4',$Q$よかじめ$Q$,false,1),
('b0000001-0000-4000-a000-0000002003a4',$Q$まえかじめ$Q$,false,2),
('b0000001-0000-4000-a000-0000002003a4',$Q$あらかじめ$Q$,true,3),
('b0000001-0000-4000-a000-0000002003a4',$Q$かねかじめ$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$（　）それだけではなく、彼にはほかにも問題があった。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003ac';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003ac';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003ac',$Q$なお$Q$,false,1),
('b0000001-0000-4000-a000-0000002003ac',$Q$すなわち$Q$,false,2),
('b0000001-0000-4000-a000-0000002003ac',$Q$むしろ$Q$,false,3),
('b0000001-0000-4000-a000-0000002003ac',$Q$単に$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「すなわち」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003ae';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003ae';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003ae',$Q$則ち$Q$,false,1),
('b0000001-0000-4000-a000-0000002003ae',$Q$即ち$Q$,true,2),
('b0000001-0000-4000-a000-0000002003ae',$Q$就ち$Q$,false,3),
('b0000001-0000-4000-a000-0000002003ae',$Q$且ち$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$会議の詳細については後日お知らせします。（　）、ご不明の点は担当者までお問い合わせください。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003af';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003af';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003af',$Q$ところが$Q$,false,1),
('b0000001-0000-4000-a000-0000002003af',$Q$したがって$Q$,false,2),
('b0000001-0000-4000-a000-0000002003af',$Q$それとも$Q$,false,3),
('b0000001-0000-4000-a000-0000002003af',$Q$なお$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$この経験は、彼女（　）大きな転機となった。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003b7';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003b7';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003b7',$Q$にわたって$Q$,false,1),
('b0000001-0000-4000-a000-0000002003b7',$Q$にとって$Q$,true,2),
('b0000001-0000-4000-a000-0000002003b7',$Q$に反して$Q$,false,3),
('b0000001-0000-4000-a000-0000002003b7',$Q$に伴って$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「伴う」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003b8';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003b8';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003b8',$Q$ともなう$Q$,true,1),
('b0000001-0000-4000-a000-0000002003b8',$Q$はなう$Q$,false,2),
('b0000001-0000-4000-a000-0000002003b8',$Q$まとなう$Q$,false,3),
('b0000001-0000-4000-a000-0000002003b8',$Q$こなう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$顧客のニーズ（　）、サービスの内容を変えていく必要がある。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003b9';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003b9';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003b9',$Q$に反して$Q$,false,1),
('b0000001-0000-4000-a000-0000002003b9',$Q$にわたって$Q$,false,2),
('b0000001-0000-4000-a000-0000002003b9',$Q$にとって$Q$,false,3),
('b0000001-0000-4000-a000-0000002003b9',$Q$に応じて$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「沿う」の読み方として正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003ba';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003ba';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003ba',$Q$のう$Q$,false,1),
('b0000001-0000-4000-a000-0000002003ba',$Q$そう$Q$,true,2),
('b0000001-0000-4000-a000-0000002003ba',$Q$えう$Q$,false,3),
('b0000001-0000-4000-a000-0000002003ba',$Q$たう$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「田中さんをはじめ、メンバー全員が集まった」の「はじめ」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003bb';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003bb';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003bb',$Q$本め$Q$,false,1),
('b0000001-0000-4000-a000-0000002003bb',$Q$元め$Q$,false,2),
('b0000001-0000-4000-a000-0000002003bb',$Q$始め$Q$,true,3),
('b0000001-0000-4000-a000-0000002003bb',$Q$初め$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$彼の行動は、会社の方針（　）いた。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003bf';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003bf';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003bf',$Q$にわたって$Q$,false,1),
('b0000001-0000-4000-a000-0000002003bf',$Q$に応じて$Q$,false,2),
('b0000001-0000-4000-a000-0000002003bf',$Q$に沿って$Q$,false,3),
('b0000001-0000-4000-a000-0000002003bf',$Q$に反して$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$この調査は三年間（　）続けられた。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003c0';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003c0';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003c0',$Q$に反して$Q$,false,1),
('b0000001-0000-4000-a000-0000002003c0',$Q$にわたって$Q$,true,2),
('b0000001-0000-4000-a000-0000002003c0',$Q$に応じて$Q$,false,3),
('b0000001-0000-4000-a000-0000002003c0',$Q$を問わず$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$有名な大学を卒業したからといって、成功できる（　）。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003c2';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003c2';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003c2',$Q$とは限らない$Q$,true,1),
('b0000001-0000-4000-a000-0000002003c2',$Q$わけにはいかない$Q$,false,2),
('b0000001-0000-4000-a000-0000002003c2',$Q$一方だ$Q$,false,3),
('b0000001-0000-4000-a000-0000002003c2',$Q$ざるを得ない$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$約束をしたのだから、今さらキャンセルする（　）。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003c4';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003c4';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003c4',$Q$とは限らない$Q$,false,1),
('b0000001-0000-4000-a000-0000002003c4',$Q$ざるを得ない$Q$,false,2),
('b0000001-0000-4000-a000-0000002003c4',$Q$わけにはいかない$Q$,true,3),
('b0000001-0000-4000-a000-0000002003c4',$Q$つつある$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「締め切りが明日なので、今夜徹夜せざるを得ない」に最も意味が近いものはどれか。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003c5';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003c5';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003c5',$Q$今夜徹夜するはずがない$Q$,false,1),
('b0000001-0000-4000-a000-0000002003c5',$Q$今夜徹夜するしかない$Q$,true,2),
('b0000001-0000-4000-a000-0000002003c5',$Q$今夜徹夜してもかまわない$Q$,false,3),
('b0000001-0000-4000-a000-0000002003c5',$Q$今夜徹夜するかもしれない$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$状況は少しずつ改善され（　）。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003c9';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003c9';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003c9',$Q$わけにはいかない$Q$,false,1),
('b0000001-0000-4000-a000-0000002003c9',$Q$つつある$Q$,true,2),
('b0000001-0000-4000-a000-0000002003c9',$Q$とは限らない$Q$,false,3),
('b0000001-0000-4000-a000-0000002003c9',$Q$を問わず$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$最近この地域では、家賃が上がる（　）で、住みにくくなっている。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003ca';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003ca';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003ca',$Q$一方$Q$,true,1),
('b0000001-0000-4000-a000-0000002003ca',$Q$とおり$Q$,false,2),
('b0000001-0000-4000-a000-0000002003ca',$Q$はず$Q$,false,3),
('b0000001-0000-4000-a000-0000002003ca',$Q$つもり$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$内容をよく確認した（　）、ご署名ください。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003cd';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003cd';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003cd',$Q$上で$Q$,true,1),
('b0000001-0000-4000-a000-0000002003cd',$Q$ものの$Q$,false,2),
('b0000001-0000-4000-a000-0000002003cd',$Q$つつ$Q$,false,3),
('b0000001-0000-4000-a000-0000002003cd',$Q$ながらも$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$このサービスは、国籍（　）、どなたでもご利用いただけます。$Q$ WHERE id='b0000001-0000-4000-a000-0000002003cf';
DELETE FROM quiz_question_options WHERE question_id='b0000001-0000-4000-a000-0000002003cf';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('b0000001-0000-4000-a000-0000002003cf',$Q$にとって$Q$,false,1),
('b0000001-0000-4000-a000-0000002003cf',$Q$に反して$Q$,false,2),
('b0000001-0000-4000-a000-0000002003cf',$Q$にわたって$Q$,false,3),
('b0000001-0000-4000-a000-0000002003cf',$Q$を問わず$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「漏洩」の読み方として正しいものはどれか。$Q$ WHERE id='c5942de4-49c8-4f5c-bdda-ab8b9936a27a';
DELETE FROM quiz_question_options WHERE question_id='c5942de4-49c8-4f5c-bdda-ab8b9936a27a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('c5942de4-49c8-4f5c-bdda-ab8b9936a27a',$Q$もれえい$Q$,false,1),
('c5942de4-49c8-4f5c-bdda-ab8b9936a27a',$Q$ろうえい$Q$,true,2),
('c5942de4-49c8-4f5c-bdda-ab8b9936a27a',$Q$ろうせい$Q$,false,3),
('c5942de4-49c8-4f5c-bdda-ab8b9936a27a',$Q$るえい$Q$,false,4);

UPDATE quiz_questions SET question_text=$Q$「誇る」の使い方として正しいものはどれか。$Q$ WHERE id='daadd2b8-2182-4872-9b7c-01d57b385427';
DELETE FROM quiz_question_options WHERE question_id='daadd2b8-2182-4872-9b7c-01d57b385427';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('daadd2b8-2182-4872-9b7c-01d57b385427',$Q$彼は自分の弱点を誇って紹介した。$Q$,false,1),
('daadd2b8-2182-4872-9b7c-01d57b385427',$Q$彼は先生の功績を誇った。$Q$,false,2),
('daadd2b8-2182-4872-9b7c-01d57b385427',$Q$彼女は試験の失敗を誇った。$Q$,false,3),
('daadd2b8-2182-4872-9b7c-01d57b385427',$Q$この美術館は世界的な名画を多数誇っている。$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「えいきょう」を漢字で書くとき、正しいものはどれか。$Q$ WHERE id='de1f426d-070a-46bf-919b-067351773009';
DELETE FROM quiz_question_options WHERE question_id='de1f426d-070a-46bf-919b-067351773009';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('de1f426d-070a-46bf-919b-067351773009',$Q$影像$Q$,false,1),
('de1f426d-070a-46bf-919b-067351773009',$Q$音響$Q$,false,2),
('de1f426d-070a-46bf-919b-067351773009',$Q$反響$Q$,false,3),
('de1f426d-070a-46bf-919b-067351773009',$Q$影響$Q$,true,4);

UPDATE quiz_questions SET question_text=$Q$「根拠」の読み方として正しいものはどれか。$Q$ WHERE id='fb1b04eb-86ac-4363-8fb6-28f965c68a89';
DELETE FROM quiz_question_options WHERE question_id='fb1b04eb-86ac-4363-8fb6-28f965c68a89';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('fb1b04eb-86ac-4363-8fb6-28f965c68a89',$Q$こんこ$Q$,false,1),
('fb1b04eb-86ac-4363-8fb6-28f965c68a89',$Q$ねきょ$Q$,false,2),
('fb1b04eb-86ac-4363-8fb6-28f965c68a89',$Q$こんきょ$Q$,true,3),
('fb1b04eb-86ac-4363-8fb6-28f965c68a89',$Q$こんしょ$Q$,false,4);

COMMIT;
