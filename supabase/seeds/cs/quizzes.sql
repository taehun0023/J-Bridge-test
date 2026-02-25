-- ============================================
-- J-Bridge CS Knowledge Quiz Seed Data
-- 16 Quizzes: 7 categories × 2 levels + 2 comprehensive
-- Total: 330 questions, 1320 options
-- ============================================

-- ============================================
-- Quiz 1: 基礎理論 ITパスポート テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('基礎理論 ITパスポート テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '10進数の「13」を2進数に変換すると、正しいものはどれか。', '13 = 8+4+1 = 1101(2) となります。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1101', true, 1),
(v_q_id, '1011', false, 2),
(v_q_id, '1110', false, 3),
(v_q_id, '1001', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '1バイトで表現できる情報の数はいくつか。', '1バイト＝8ビットであり、2の8乗＝256通りの情報を表現できます。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '256', true, 1),
(v_q_id, '128', false, 2),
(v_q_id, '512', false, 3),
(v_q_id, '64', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'AND演算において、1 AND 0 の結果はどれか。', 'AND演算は両方の入力が1のときのみ結果が1になります。1 AND 0 = 0 です。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '0', true, 1),
(v_q_id, '1', false, 2),
(v_q_id, '2', false, 3),
(v_q_id, '不定', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'OR演算において、0 OR 1 の結果はどれか。', 'OR演算はどちらか一方でも1であれば結果が1になります。0 OR 1 = 1 です。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1', true, 1),
(v_q_id, '0', false, 2),
(v_q_id, '2', false, 3),
(v_q_id, '不定', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '16進数の「A」は10進数でいくつか。', '16進数ではA=10, B=11, C=12, D=13, E=14, F=15 を表します。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '10', true, 1),
(v_q_id, '11', false, 2),
(v_q_id, '15', false, 3),
(v_q_id, '16', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '文字コードの説明として正しいものはどれか。', '文字コードは、コンピュータ上で文字を扱うために、各文字に割り当てられた固有の番号体系です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '文字をコンピュータで扱うために割り当てた番号の体系', true, 1),
(v_q_id, 'プログラムのソースコードのこと', false, 2),
(v_q_id, '暗号化のためのアルゴリズム', false, 3),
(v_q_id, 'ファイルの拡張子のこと', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'XOR演算において、1 XOR 1 の結果はどれか。', 'XOR（排他的論理和）は入力が異なるとき1、同じとき0になります。1 XOR 1 = 0 です。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '0', true, 1),
(v_q_id, '1', false, 2),
(v_q_id, '2', false, 3),
(v_q_id, '不定', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2進数の「1010」を10進数に変換すると、正しいものはどれか。', '1010(2) = 1×8 + 0×4 + 1×2 + 0×1 = 10 です。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '10', true, 1),
(v_q_id, '12', false, 2),
(v_q_id, '8', false, 3),
(v_q_id, '11', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ビット（bit）の説明として正しいものはどれか。', 'ビットはコンピュータが扱う情報の最小単位で、0か1の値を取ります。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'コンピュータが扱う情報の最小単位', true, 1),
(v_q_id, '8桁の2進数のこと', false, 2),
(v_q_id, 'データの転送速度の単位', false, 3),
(v_q_id, 'メモリの容量の単位', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'NOT演算について正しい説明はどれか。', 'NOT演算は入力値を反転させる演算で、1を入力すると0、0を入力すると1が出力されます。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '入力の真偽を反転させる演算', true, 1),
(v_q_id, '二つの入力の論理積を求める演算', false, 2),
(v_q_id, '二つの入力の論理和を求める演算', false, 3),
(v_q_id, '入力値をそのまま出力する演算', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '集合A={1,2,3}と集合B={2,3,4}の積集合（A∩B）はどれか。', '積集合は両方の集合に共通する要素の集まりです。A∩B={2,3}となります。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '{2, 3}', true, 1),
(v_q_id, '{1, 2, 3, 4}', false, 2),
(v_q_id, '{1, 4}', false, 3),
(v_q_id, '{1, 2, 3}', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '真理値表とは何か。', '真理値表は論理演算の入力と出力のすべての組み合わせを一覧にした表です。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '論理演算の入出力をすべて一覧にした表', true, 1),
(v_q_id, 'データベースのテーブル構造を示す図', false, 2),
(v_q_id, 'プログラムの実行結果を記録した表', false, 3),
(v_q_id, 'ネットワークの接続状況を示す表', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '確率において、サイコロを1回振って偶数が出る確率はどれか。', 'サイコロの偶数は2,4,6の3つで、全体6通りのうち3通り。確率は3/6=1/2です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1/2', true, 1),
(v_q_id, '1/3', false, 2),
(v_q_id, '1/6', false, 3),
(v_q_id, '2/3', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'アナログデータをデジタルデータに変換する処理を何というか。', 'アナログ信号をデジタル信号に変換する処理をA/D変換（アナログ・デジタル変換）といいます。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'A/D変換', true, 1),
(v_q_id, 'D/A変換', false, 2),
(v_q_id, 'エンコード', false, 3),
(v_q_id, 'デコード', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '標本化（サンプリング）の説明として正しいものはどれか。', '標本化はアナログ信号を一定の時間間隔で測定し、離散的な値として取得するプロセスです。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'アナログ信号を一定間隔で測定すること', true, 1),
(v_q_id, 'デジタルデータを圧縮すること', false, 2),
(v_q_id, 'データを暗号化すること', false, 3),
(v_q_id, 'ファイルをバックアップすること', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '集合A={1,2,3}と集合B={2,3,4}の和集合（A∪B）はどれか。', '和集合は両方の集合に含まれるすべての要素の集まりです。A∪B={1,2,3,4}となります。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '{1, 2, 3, 4}', true, 1),
(v_q_id, '{2, 3}', false, 2),
(v_q_id, '{1, 4}', false, 3),
(v_q_id, '{1, 2, 3}', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '補数の説明として正しいものはどれか。', '補数はある数に足すと基数のべき乗になる数で、コンピュータでは負の数を表現するために使われます。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ある数に足すと基数のべき乗になる数', true, 1),
(v_q_id, '小数点以下を切り捨てた数', false, 2),
(v_q_id, '絶対値が等しい正の数', false, 3),
(v_q_id, '2で割った余りの数', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '情報量の単位として正しいものはどれか。', '情報量の基本単位はビット（bit）です。8ビット＝1バイトとなります。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ビット', true, 1),
(v_q_id, 'ヘルツ', false, 2),
(v_q_id, 'ワット', false, 3),
(v_q_id, 'ボルト', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ベン図とは何か。', 'ベン図は集合の関係を円などの図形を使って視覚的に表現した図です。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '集合の関係を図形で表現した図', true, 1),
(v_q_id, 'データの流れを表現した図', false, 2),
(v_q_id, 'プログラムの構造を表現した図', false, 3),
(v_q_id, 'ネットワーク構成を表現した図', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2進数の加算 1011 + 0110 の結果はどれか。', '1011(11) + 0110(6) = 10001(17) です。繰り上がりに注意します。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '10001', true, 1),
(v_q_id, '10010', false, 2),
(v_q_id, '1111', false, 3),
(v_q_id, '10000', false, 4);

END $$;

-- ============================================
-- Quiz 2: 基礎理論 基本情報 テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('基礎理論 基本情報 テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '8ビットの2の補数表現で表せる整数の範囲はどれか。', '8ビットの2の補数表現では -128～127 の範囲の整数を表現できます。最上位ビットが符号を表します。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '-128～127', true, 1),
(v_q_id, '-127～128', false, 2),
(v_q_id, '-256～255', false, 3),
(v_q_id, '0～255', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '浮動小数点数の表現において、仮数部と指数部の説明として正しいものはどれか。', '浮動小数点数は符号部・指数部・仮数部で構成され、仮数部は有効数字を、指数部は小数点の位置を表します。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '仮数部は有効数字を、指数部は小数点の位置を表す', true, 1),
(v_q_id, '仮数部は小数点の位置を、指数部は有効数字を表す', false, 2),
(v_q_id, '仮数部は符号を、指数部は絶対値を表す', false, 3),
(v_q_id, '仮数部と指数部は同じ役割を持つ', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '論理式 A・B + A・¬B を簡略化した結果はどれか。', 'A・B + A・¬B = A・(B + ¬B) = A・1 = A となります。分配法則と補元法則を使います。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'A', true, 1),
(v_q_id, 'B', false, 2),
(v_q_id, 'A + B', false, 3),
(v_q_id, '0', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'IEEE 754における単精度浮動小数点数のビット長はどれか。', 'IEEE 754の単精度浮動小数点数は32ビット（符号1ビット、指数8ビット、仮数23ビット）です。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '32ビット', true, 1),
(v_q_id, '16ビット', false, 2),
(v_q_id, '64ビット', false, 3),
(v_q_id, '128ビット', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'けた落ちの説明として正しいものはどれか。', 'けた落ちは、ほぼ等しい二つの数の差を計算したとき、有効桁数が大幅に減少する現象です。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ほぼ等しい数の差を求めたとき有効桁数が減る現象', true, 1),
(v_q_id, '計算結果が表現可能な最大値を超える現象', false, 2),
(v_q_id, '小数点以下の桁が切り捨てられる現象', false, 3),
(v_q_id, '整数部分が失われる現象', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'オーバーフローの説明として正しいものはどれか。', 'オーバーフローは演算結果がコンピュータで表現可能な数値の範囲を超えてしまう現象です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '演算結果が表現可能な範囲を超える現象', true, 1),
(v_q_id, 'メモリが不足してプログラムが停止する現象', false, 2),
(v_q_id, '有効桁数が減少する現象', false, 3),
(v_q_id, '小数点以下が丸められる現象', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ド・モルガンの法則として正しいものはどれか。', 'ド・モルガンの法則：¬(A∧B) = ¬A∨¬B、¬(A∨B) = ¬A∧¬B が成立します。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '¬(A∧B) = ¬A∨¬B', true, 1),
(v_q_id, '¬(A∧B) = ¬A∧¬B', false, 2),
(v_q_id, '¬(A∨B) = ¬A∨¬B', false, 3),
(v_q_id, '¬(A∧B) = A∨B', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '情報エントロピーの説明として正しいものはどれか。', '情報エントロピーは情報源の不確実さの尺度で、確率が低い事象ほど情報量が大きくなります。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '情報源の不確実さ（あいまいさ）の尺度', true, 1),
(v_q_id, 'データの圧縮率を表す指標', false, 2),
(v_q_id, '通信速度を表す単位', false, 3),
(v_q_id, 'メモリ使用量を表す指標', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '16進数の 2F を10進数に変換した結果はどれか。', '2F(16) = 2×16 + 15×1 = 32 + 15 = 47 です。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '47', true, 1),
(v_q_id, '31', false, 2),
(v_q_id, '45', false, 3),
(v_q_id, '79', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'BCD（2進化10進数）の説明として正しいものはどれか。', 'BCDは10進数の各桁を4ビットの2進数で表現する方式です。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '10進数の各桁を4ビットの2進数で表す方式', true, 1),
(v_q_id, '2進数を10進数に変換するアルゴリズム', false, 2),
(v_q_id, '16進数を2進数で表す方式', false, 3),
(v_q_id, '8進数の各桁を3ビットで表す方式', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'シフト演算において、2進数を左に1ビット論理シフトすると元の値の何倍になるか。', '左に1ビットシフトすると各桁が1つ上の桁に移動するため、値は2倍になります。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '2倍', true, 1),
(v_q_id, '4倍', false, 2),
(v_q_id, '8倍', false, 3),
(v_q_id, '10倍', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '丸め誤差の説明として正しいものはどれか。', '丸め誤差は、数値を有限のビット数で表現する際に、表現しきれない部分を四捨五入等で処理した結果生じる誤差です。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '有限ビットで数値を表現する際に端数処理で生じる誤差', true, 1),
(v_q_id, 'プログラムの論理ミスによる計算誤差', false, 2),
(v_q_id, 'ハードウェアの故障による誤差', false, 3),
(v_q_id, 'ネットワーク通信中のデータ化けによる誤差', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '加算器において、全加算器（Full Adder）が半加算器（Half Adder）と異なる点はどれか。', '全加算器は下位桁からの繰り上がり（キャリー入力）を含めた3入力の加算ができます。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '下位桁からの繰り上がりを入力として扱える', true, 1),
(v_q_id, '減算も同時に行える', false, 2),
(v_q_id, '浮動小数点数を扱える', false, 3),
(v_q_id, '3つ以上の数の加算を同時に行える', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'カルノー図の用途として正しいものはどれか。', 'カルノー図は論理式を視覚的に簡略化するための図です。隣接するマスをまとめて式を最小化します。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '論理式を視覚的に簡略化する', true, 1),
(v_q_id, 'データの流れを可視化する', false, 2),
(v_q_id, 'ネットワーク構成を表現する', false, 3),
(v_q_id, 'データベースのテーブル関係を示す', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'Unicodeの説明として正しいものはどれか。', 'Unicodeは世界中の文字を一つの文字コード体系で統一的に扱うことを目的とした文字コード規格です。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '世界中の文字を統一的に扱う文字コード規格', true, 1),
(v_q_id, '日本語専用の文字コード規格', false, 2),
(v_q_id, 'ASCII文字のみを扱う規格', false, 3),
(v_q_id, 'バイナリデータの圧縮規格', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '誤り検出符号であるパリティビットの説明として正しいものはどれか。', 'パリティビットはデータに1ビット付加して、ビット列中の1の数を偶数または奇数に揃えることで誤りを検出します。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データに1ビット付加して1の数の偶奇で誤りを検出する方式', true, 1),
(v_q_id, 'データを二重に送信して比較する方式', false, 2),
(v_q_id, 'データを暗号化して改ざんを検出する方式', false, 3),
(v_q_id, 'データのハッシュ値を比較する方式', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ハミング符号の特徴として正しいものはどれか。', 'ハミング符号は1ビットの誤りを検出し、自動的に訂正することができる誤り訂正符号です。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1ビットの誤りを検出し訂正できる', true, 1),
(v_q_id, '2ビット以上の誤りを訂正できる', false, 2),
(v_q_id, '誤りの検出のみ可能で訂正はできない', false, 3),
(v_q_id, 'データ圧縮と誤り訂正を同時に行う', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '逆ポーランド記法（後置記法）で「3 4 + 5 ×」を計算した結果はどれか。', 'まず 3+4=7、次に 7×5=35 となります。逆ポーランド記法はスタックを使って計算します。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '35', true, 1),
(v_q_id, '23', false, 2),
(v_q_id, '27', false, 3),
(v_q_id, '60', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '状態遷移図の説明として正しいものはどれか。', '状態遷移図はシステムの状態と、イベントによる状態間の遷移を図で表したものです。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'システムの状態と遷移を図で表したもの', true, 1),
(v_q_id, 'データの流れを表した図', false, 2),
(v_q_id, 'クラスの継承関係を表した図', false, 3),
(v_q_id, 'プロセスのスケジューリングを表した図', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'オートマトンの説明として正しいものはどれか。', 'オートマトンは入力に応じて状態が遷移する抽象的な計算モデルで、有限オートマトンなどがあります。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '入力に応じて状態が遷移する抽象的な計算モデル', true, 1),
(v_q_id, '自動的にプログラムを生成するツール', false, 2),
(v_q_id, 'データベースを自動管理するシステム', false, 3),
(v_q_id, 'ネットワークを自動監視するソフトウェア', false, 4);

END $$;

-- ============================================
-- Quiz 3: アルゴリズム ITパスポート テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('アルゴリズム ITパスポート テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'アルゴリズムの説明として最も適切なものはどれか。', 'アルゴリズムとは、問題を解決するための手順や計算方法を明確に定義したものです。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '問題を解くための明確な手順', true, 1),
(v_q_id, 'プログラミング言語の文法', false, 2),
(v_q_id, 'コンピュータのハードウェア構成', false, 3),
(v_q_id, 'データベースの設計手法', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'フローチャートにおいて、判断（条件分岐）を表す図形はどれか。', 'フローチャートでは、ひし形が判断（条件分岐）を表します。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ひし形', true, 1),
(v_q_id, '長方形', false, 2),
(v_q_id, '円', false, 3),
(v_q_id, '平行四辺形', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '線形探索（リニアサーチ）の説明として正しいものはどれか。', '線形探索はデータを先頭から順番に一つずつ比較して目的のデータを探す手法です。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データを先頭から順に一つずつ調べる探索法', true, 1),
(v_q_id, 'データを半分に分けて探す探索法', false, 2),
(v_q_id, 'ランダムにデータを選んで探す探索法', false, 3),
(v_q_id, 'ハッシュ値を使って探す探索法', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2分探索の前提条件として正しいものはどれか。', '2分探索はデータがあらかじめソート（整列）されている必要があります。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データがソート（整列）済みであること', true, 1),
(v_q_id, 'データが連結リストに格納されていること', false, 2),
(v_q_id, 'データの個数が偶数であること', false, 3),
(v_q_id, 'データがすべて異なる値であること', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'バブルソートの説明として正しいものはどれか。', 'バブルソートは隣り合う要素を比較して交換を繰り返すことでデータを並べ替える手法です。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '隣り合う要素を比較・交換して並べ替える手法', true, 1),
(v_q_id, '最小値を見つけて先頭に移動させる手法', false, 2),
(v_q_id, 'データを分割して統合する手法', false, 3),
(v_q_id, 'ランダムに並べ替えを行う手法', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '選択ソートの説明として正しいものはどれか。', '選択ソートは未整列部分から最小（または最大）の要素を選んで先頭に配置していく手法です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '未整列部分から最小値を選び先頭に配置する手法', true, 1),
(v_q_id, '隣り合う要素を比較して交換する手法', false, 2),
(v_q_id, 'データを再帰的に分割して整列する手法', false, 3),
(v_q_id, '挿入位置を探して要素を挿入する手法', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '挿入ソートの説明として正しいものはどれか。', '挿入ソートは未整列の要素を一つずつ取り出し、整列済みの部分の適切な位置に挿入する手法です。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '整列済み部分の適切な位置に要素を挿入する手法', true, 1),
(v_q_id, '先頭から順にすべての要素を比較する手法', false, 2),
(v_q_id, 'データを半分に分割して結合する手法', false, 3),
(v_q_id, '最大値を末尾に移動させる手法', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'データが10件あるとき、線形探索で最悪の場合の比較回数はどれか。', '線形探索の最悪の場合は、目的のデータが最後にあるか存在しない場合で、全データ分の比較が必要です。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '10回', true, 1),
(v_q_id, '5回', false, 2),
(v_q_id, '3回', false, 3),
(v_q_id, '1回', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'フローチャートにおいて、処理を表す図形はどれか。', 'フローチャートでは、長方形が処理を表します。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '長方形', true, 1),
(v_q_id, 'ひし形', false, 2),
(v_q_id, '平行四辺形', false, 3),
(v_q_id, '楕円', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '繰り返し処理の例として最も適切なものはどれか。', '繰り返し処理（ループ）は同じ処理を条件が満たされるまで繰り返し実行する構造です。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '配列の全要素に対して同じ計算を行う', true, 1),
(v_q_id, '条件に応じて異なる処理を行う', false, 2),
(v_q_id, '処理を一度だけ実行する', false, 3),
(v_q_id, 'プログラムを終了する', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '再帰（リカーション）の説明として正しいものはどれか。', '再帰とは、関数やプロシージャが自分自身を呼び出して問題を解く手法です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '関数が自分自身を呼び出すこと', true, 1),
(v_q_id, '同じ処理を並列に実行すること', false, 2),
(v_q_id, '条件分岐を繰り返すこと', false, 3),
(v_q_id, 'データを逆順に並べ替えること', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '擬似コードの目的として最も適切なものはどれか。', '擬似コードは特定のプログラミング言語に依存せずアルゴリズムの手順を記述するための表現方法です。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'プログラミング言語に依存せずアルゴリズムを記述する', true, 1),
(v_q_id, 'プログラムを自動的に生成する', false, 2),
(v_q_id, 'ソースコードのエラーを検出する', false, 3),
(v_q_id, 'プログラムの実行速度を測定する', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '配列の要素にアクセスする際の時間計算量はどれか。', '配列はインデックスを使って直接アクセスできるため、アクセス時間は一定（O(1)）です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(1)', true, 1),
(v_q_id, 'O(n)', false, 2),
(v_q_id, 'O(log n)', false, 3),
(v_q_id, 'O(n²)', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ソートアルゴリズムの目的として正しいものはどれか。', 'ソートアルゴリズムはデータを一定の規則（昇順・降順など）に従って並べ替えることを目的とします。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データを一定の規則に従って並べ替える', true, 1),
(v_q_id, 'データを検索する', false, 2),
(v_q_id, 'データを圧縮する', false, 3),
(v_q_id, 'データを暗号化する', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '順次・選択・繰り返しの3つの基本構造のうち、「選択」にあたるものはどれか。', '選択構造は条件に基づいて処理を分岐させるif文のような構造です。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '条件に基づいて処理を分岐させる構造', true, 1),
(v_q_id, '処理を上から順に実行する構造', false, 2),
(v_q_id, '処理を条件が満たされるまで繰り返す構造', false, 3),
(v_q_id, '関数を定義して呼び出す構造', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'トレースの説明として正しいものはどれか。', 'トレースはプログラムの動作を1ステップずつ追跡し、変数の変化などを確認する手法です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'プログラムを1ステップずつ追跡して動作を確認する手法', true, 1),
(v_q_id, 'プログラムの実行時間を計測する手法', false, 2),
(v_q_id, 'プログラムを自動テストする手法', false, 3),
(v_q_id, 'プログラムを圧縮する手法', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '探索アルゴリズムの目的として最も適切なものはどれか。', '探索アルゴリズムはデータの集まりの中から特定の条件に合うデータを見つけ出す手法です。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データの集まりから目的のデータを見つける', true, 1),
(v_q_id, 'データを効率よく保存する', false, 2),
(v_q_id, 'データを暗号化する', false, 3),
(v_q_id, 'データの整合性を検証する', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '変数の説明として最も適切なものはどれか。', '変数はプログラムの中でデータを一時的に記憶しておくための名前付きの領域です。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データを一時的に記憶する名前付きの領域', true, 1),
(v_q_id, '固定された値のこと', false, 2),
(v_q_id, 'プログラムの実行命令のこと', false, 3),
(v_q_id, 'ファイルの保存場所のこと', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'データが1000件あるとき、2分探索で最大何回の比較で見つけられるか。', '2分探索の最大比較回数は log₂(1000) ≒ 10 回です。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '10回', true, 1),
(v_q_id, '100回', false, 2),
(v_q_id, '500回', false, 3),
(v_q_id, '1000回', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'アルゴリズムの良さを評価する基準として適切なものはどれか。', 'アルゴリズムの良さは処理にかかる時間（時間計算量）や必要なメモリ量（空間計算量）で評価します。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '処理時間と使用メモリ量', true, 1),
(v_q_id, 'ソースコードの行数', false, 2),
(v_q_id, '使用するプログラミング言語', false, 3),
(v_q_id, 'プログラマの経験年数', false, 4);

END $$;

-- ============================================
-- Quiz 4: アルゴリズム 基本情報 テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('アルゴリズム 基本情報 テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'クイックソートの平均時間計算量はどれか。', 'クイックソートの平均時間計算量はO(n log n)です。ピボットを使い分割統治法で並べ替えます。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(n log n)', true, 1),
(v_q_id, 'O(n²)', false, 2),
(v_q_id, 'O(n)', false, 3),
(v_q_id, 'O(log n)', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'マージソートの特徴として正しいものはどれか。', 'マージソートは安定ソートであり、最悪計算量もO(n log n)です。分割統治法を用います。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '安定ソートであり最悪計算量がO(n log n)である', true, 1),
(v_q_id, 'インプレースソートで追加メモリが不要である', false, 2),
(v_q_id, '最悪計算量がO(n²)である', false, 3),
(v_q_id, 'データがソート済みのとき最も遅くなる', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2分探索木において、要素の探索にかかる平均時間計算量はどれか。', '平衡が保たれた2分探索木では、探索の平均時間計算量はO(log n)です。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(log n)', true, 1),
(v_q_id, 'O(n)', false, 2),
(v_q_id, 'O(1)', false, 3),
(v_q_id, 'O(n log n)', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ハッシュ法における衝突（コリジョン）の説明として正しいものはどれか。', '衝突とは、異なるキーに対してハッシュ関数が同じハッシュ値を返すことです。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '異なるキーが同じハッシュ値になること', true, 1),
(v_q_id, 'ハッシュテーブルが満杯になること', false, 2),
(v_q_id, '同じキーが複数回登録されること', false, 3),
(v_q_id, 'ハッシュ関数の計算に時間がかかること', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '深さ優先探索（DFS）の説明として正しいものはどれか。', 'DFSはグラフやツリーの探索で、一つの枝をできるだけ深く進んでからバックトラックする手法です。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '一つの枝を深く進んでからバックトラックする手法', true, 1),
(v_q_id, '同じ深さのノードをすべて探索してから次の深さに進む手法', false, 2),
(v_q_id, 'ランダムにノードを選んで探索する手法', false, 3),
(v_q_id, '最短経路を保証する探索手法', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '幅優先探索（BFS）の説明として正しいものはどれか。', 'BFSは始点から近い順（同じ深さ）にすべてのノードを探索してから次の深さに進む手法です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '始点から近い順にすべてのノードを探索する手法', true, 1),
(v_q_id, '一つの枝を最後まで探索する手法', false, 2),
(v_q_id, 'コスト最小の経路を選ぶ手法', false, 3),
(v_q_id, 'ヒューリスティック関数を使う手法', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '動的計画法（DP）の説明として正しいものはどれか。', '動的計画法は問題を部分問題に分割し、その結果を保存して再利用する手法です。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '部分問題の結果を保存して再利用する手法', true, 1),
(v_q_id, '問題をランダムに分割して解く手法', false, 2),
(v_q_id, '常にその時点の最善の選択をする手法', false, 3),
(v_q_id, '全ての組み合わせを試す手法', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '貪欲法（グリーディ法）の説明として正しいものはどれか。', '貪欲法は各ステップで局所的に最適な選択を行い、全体の最適解を目指す手法です。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '各ステップで局所的に最適な選択を行う手法', true, 1),
(v_q_id, 'すべての可能性を網羅的に調べる手法', false, 2),
(v_q_id, '問題を再帰的に小さく分割する手法', false, 3),
(v_q_id, 'ランダムな選択を繰り返す手法', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'クイックソートの最悪時間計算量はどれか。', 'クイックソートの最悪時間計算量はO(n²)で、ピボットの選択が最悪な場合に発生します。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(n²)', true, 1),
(v_q_id, 'O(n log n)', false, 2),
(v_q_id, 'O(n)', false, 3),
(v_q_id, 'O(log n)', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ヒープソートが使用するデータ構造はどれか。', 'ヒープソートはヒープ（二分ヒープ）というデータ構造を使って並べ替えを行います。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ヒープ（二分ヒープ）', true, 1),
(v_q_id, 'スタック', false, 2),
(v_q_id, 'キュー', false, 3),
(v_q_id, '連結リスト', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '分割統治法の説明として正しいものはどれか。', '分割統治法は問題を小さな部分問題に分割し、それぞれを解いてから結果を統合する手法です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '問題を小さく分割し、解を統合する手法', true, 1),
(v_q_id, '問題を並列に処理する手法', false, 2),
(v_q_id, 'データを順次処理する手法', false, 3),
(v_q_id, 'ランダムに問題を分割する手法', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '安定ソートの説明として正しいものはどれか。', '安定ソートは同じ値を持つ要素の元の順序がソート後も保たれるソートアルゴリズムです。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '同じ値の要素の元の順序がソート後も保たれる', true, 1),
(v_q_id, '常にO(n log n)で動作する', false, 2),
(v_q_id, '追加メモリを使用しない', false, 3),
(v_q_id, '最悪計算量がO(n)である', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'バックトラッキングの説明として正しいものはどれか。', 'バックトラッキングは解の候補を試し、行き詰まったら直前の状態に戻って別の候補を試す手法です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '行き詰まったら直前に戻り別の候補を試す手法', true, 1),
(v_q_id, 'すべての候補を同時に並列で探索する手法', false, 2),
(v_q_id, '解の候補をランダムに選択する手法', false, 3),
(v_q_id, '最初に見つかった解を最適解とする手法', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ダイクストラ法の目的として正しいものはどれか。', 'ダイクストラ法は重み付きグラフにおいて、始点から各頂点への最短経路を求めるアルゴリズムです。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '重み付きグラフの最短経路を求める', true, 1),
(v_q_id, 'グラフの連結成分を求める', false, 2),
(v_q_id, 'グラフの最大フローを求める', false, 3),
(v_q_id, 'グラフの全域木を求める', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'O(n²)のアルゴリズムにおいて、データ数が2倍になると処理時間は約何倍になるか。', 'O(n²)ではデータ数が2倍になると処理時間は2²=4倍になります。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '4倍', true, 1),
(v_q_id, '2倍', false, 2),
(v_q_id, '8倍', false, 3),
(v_q_id, '16倍', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ハッシュ法の衝突解決方法であるチェイン法の説明として正しいものはどれか。', 'チェイン法は同じハッシュ値を持つデータを連結リストでつなげて管理する方法です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '同じハッシュ値のデータを連結リストで管理する', true, 1),
(v_q_id, '空いているハッシュ値の場所にデータを格納する', false, 2),
(v_q_id, 'ハッシュテーブルのサイズを2倍に拡張する', false, 3),
(v_q_id, '衝突したデータを別のテーブルに移動する', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'オープンアドレス法の説明として正しいものはどれか。', 'オープンアドレス法は衝突が起きた場合、ハッシュテーブル内の別の空き領域を探してデータを格納する方法です。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '衝突時にテーブル内の別の空き場所にデータを格納する', true, 1),
(v_q_id, '衝突時にデータを連結リストで管理する', false, 2),
(v_q_id, '衝突時にハッシュ関数を変更する', false, 3),
(v_q_id, '衝突時にデータを破棄する', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'フィボナッチ数列の再帰的な計算の時間計算量はどれか。', '単純な再帰によるフィボナッチ数列の計算は指数的な時間計算量O(2^n)になります。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(2^n)', true, 1),
(v_q_id, 'O(n)', false, 2),
(v_q_id, 'O(n²)', false, 3),
(v_q_id, 'O(n log n)', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '次のうち、安定ソートに該当するものはどれか。', 'マージソートは安定ソートです。クイックソートとヒープソートは不安定ソートです。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'マージソート', true, 1),
(v_q_id, 'クイックソート', false, 2),
(v_q_id, 'ヒープソート', false, 3),
(v_q_id, 'シェルソート', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ユークリッドの互除法の用途として正しいものはどれか。', 'ユークリッドの互除法は2つの正の整数の最大公約数を効率的に求めるアルゴリズムです。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '2つの整数の最大公約数を求める', true, 1),
(v_q_id, '素数を列挙する', false, 2),
(v_q_id, '最小公倍数を直接求める', false, 3),
(v_q_id, '整数を素因数分解する', false, 4);

END $$;

-- ============================================
-- Quiz 5: データ構造 ITパスポート テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('データ構造 ITパスポート テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '配列の説明として正しいものはどれか。', '配列は同じ型のデータを連続したメモリ領域に格納するデータ構造です。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '同じ型のデータを連続した領域に格納する構造', true, 1),
(v_q_id, '異なる型のデータを混在させる構造', false, 2),
(v_q_id, 'データを先入れ先出しで管理する構造', false, 3),
(v_q_id, 'データを階層的に管理する構造', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'スタックのデータの出し入れ方式はどれか。', 'スタックはLIFO（Last In, First Out：後入れ先出し）方式でデータを管理します。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '後入れ先出し（LIFO）', true, 1),
(v_q_id, '先入れ先出し（FIFO）', false, 2),
(v_q_id, 'ランダムアクセス', false, 3),
(v_q_id, '優先度順', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'キューのデータの出し入れ方式はどれか。', 'キューはFIFO（First In, First Out：先入れ先出し）方式でデータを管理します。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '先入れ先出し（FIFO）', true, 1),
(v_q_id, '後入れ先出し（LIFO）', false, 2),
(v_q_id, 'ランダムアクセス', false, 3),
(v_q_id, '優先度順', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'リスト（連結リスト）の説明として正しいものはどれか。', '連結リストは各要素が次の要素へのポインタを持ち、鎖のように連結されたデータ構造です。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '各要素が次の要素への参照を持つ構造', true, 1),
(v_q_id, 'データを連続した領域に格納する構造', false, 2),
(v_q_id, 'データを木構造で管理する構造', false, 3),
(v_q_id, 'データをキーと値のペアで管理する構造', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '木構造において、最上位のノードを何というか。', '木構造の最上位のノードはルート（根）ノードと呼ばれます。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ルート（根）', true, 1),
(v_q_id, 'リーフ（葉）', false, 2),
(v_q_id, 'ブランチ（枝）', false, 3),
(v_q_id, 'ノード（節）', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '木構造において、子を持たないノードを何というか。', '子ノードを持たない末端のノードはリーフ（葉）ノードと呼ばれます。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'リーフ（葉）', true, 1),
(v_q_id, 'ルート（根）', false, 2),
(v_q_id, '親ノード', false, 3),
(v_q_id, '兄弟ノード', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'スタックの操作で、データを追加する操作を何というか。', 'スタックにデータを追加する操作はプッシュ（push）と呼ばれます。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'プッシュ（push）', true, 1),
(v_q_id, 'ポップ（pop）', false, 2),
(v_q_id, 'エンキュー（enqueue）', false, 3),
(v_q_id, 'デキュー（dequeue）', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'キューにデータを追加する操作を何というか。', 'キューにデータを追加する操作はエンキュー（enqueue）と呼ばれます。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'エンキュー（enqueue）', true, 1),
(v_q_id, 'デキュー（dequeue）', false, 2),
(v_q_id, 'プッシュ（push）', false, 3),
(v_q_id, 'ポップ（pop）', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'スタックが利用される身近な例として最も適切なものはどれか。', 'Webブラウザの「戻る」ボタンは、訪問履歴をスタックで管理する典型例です。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'Webブラウザの「戻る」ボタンの履歴管理', true, 1),
(v_q_id, 'プリンタの印刷待ち行列', false, 2),
(v_q_id, 'データベースの検索結果', false, 3),
(v_q_id, 'ファイルのフォルダ一覧', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'キューが利用される身近な例として最も適切なものはどれか。', 'プリンタの印刷待ち行列は、先に送った印刷ジョブが先に処理されるFIFO方式です。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'プリンタの印刷待ち行列', true, 1),
(v_q_id, 'テキストエディタの「元に戻す」機能', false, 2),
(v_q_id, 'ファイルの圧縮処理', false, 3),
(v_q_id, 'パスワードの暗号化', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2分木の説明として正しいものはどれか。', '2分木は各ノードが最大2つの子ノードを持つ木構造です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '各ノードが最大2つの子を持つ木構造', true, 1),
(v_q_id, 'ノードが2つだけの木構造', false, 2),
(v_q_id, '深さが2の木構造', false, 3),
(v_q_id, '全ノードが2つの子を持つ木構造', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'レコードの説明として正しいものはどれか。', 'レコードは異なるデータ型の要素をまとめて一つにしたデータ構造です。構造体とも呼ばれます。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '異なるデータ型の要素をまとめた構造', true, 1),
(v_q_id, '同じデータ型のみで構成される構造', false, 2),
(v_q_id, 'データを順番に並べた構造', false, 3),
(v_q_id, 'データを暗号化した構造', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '配列のインデックスの説明として正しいものはどれか。', 'インデックスは配列の各要素の位置を示す番号で、通常0から始まります。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '配列の各要素の位置を示す番号', true, 1),
(v_q_id, '配列に格納されたデータの値', false, 2),
(v_q_id, '配列のデータ型を表す情報', false, 3),
(v_q_id, '配列の要素数を示す値', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'データ構造を選ぶ際に考慮すべき点として最も適切なものはどれか。', 'データ構造の選択は、どのような操作を頻繁に行うかによって決めるべきです。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '頻繁に行う操作の種類と効率', true, 1),
(v_q_id, 'プログラミング言語の種類', false, 2),
(v_q_id, 'コンピュータのメーカー', false, 3),
(v_q_id, 'プログラマの好み', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'グラフ構造において、ノード間をつなぐ線を何というか。', 'グラフにおいてノード（頂点）間をつなぐ線はエッジ（辺）と呼ばれます。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'エッジ（辺）', true, 1),
(v_q_id, 'パス（経路）', false, 2),
(v_q_id, 'リンク（接続）', false, 3),
(v_q_id, 'ルート（根）', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ハッシュテーブルの特徴として最も適切なものはどれか。', 'ハッシュテーブルはキーからハッシュ値を計算し、データの格納・検索を高速に行えるデータ構造です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'キーを使ってデータの検索を高速に行える', true, 1),
(v_q_id, 'データを順番に並べて管理する', false, 2),
(v_q_id, 'データの挿入と削除ができない', false, 3),
(v_q_id, 'データを暗号化して格納する', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '配列とリストの違いとして正しいものはどれか。', '配列はメモリ上で連続した領域に格納されますが、リストは各要素がポインタでつながれています。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '配列はメモリ上で連続、リストはポインタでつながる', true, 1),
(v_q_id, '配列は要素の追加が容易、リストは困難', false, 2),
(v_q_id, '配列はデータ型が自由、リストは固定', false, 3),
(v_q_id, '配列とリストに違いはない', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'スタックからデータを取り出す操作を何というか。', 'スタックからデータを取り出す操作はポップ（pop）と呼ばれます。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ポップ（pop）', true, 1),
(v_q_id, 'プッシュ（push）', false, 2),
(v_q_id, 'デキュー（dequeue）', false, 3),
(v_q_id, 'ピーク（peek）', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '木構造の深さ（高さ）の説明として正しいものはどれか。', '木構造の深さはルートからリーフまでの最長パスの辺の数です。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ルートからリーフまでの最長パスの辺の数', true, 1),
(v_q_id, 'ノードの総数', false, 2),
(v_q_id, 'リーフの数', false, 3),
(v_q_id, 'エッジの総数', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '次のデータ構造のうち、LIFOで動作するものはどれか。', 'LIFO（Last In, First Out）で動作するデータ構造はスタックです。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'スタック', true, 1),
(v_q_id, 'キュー', false, 2),
(v_q_id, '配列', false, 3),
(v_q_id, 'リスト', false, 4);

END $$;

-- ============================================
-- Quiz 6: データ構造 基本情報 テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('データ構造 基本情報 テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '双方向連結リストの特徴として正しいものはどれか。', '双方向連結リストは各ノードが前と次の両方のノードへのポインタを持ちます。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '各ノードが前後両方のノードへのポインタを持つ', true, 1),
(v_q_id, '各ノードが次のノードへのポインタのみを持つ', false, 2),
(v_q_id, '先頭と末尾が接続されて環状になっている', false, 3),
(v_q_id, 'ノードの挿入・削除ができない', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'AVL木の特徴として正しいものはどれか。', 'AVL木は各ノードの左右部分木の高さの差が1以下に保たれる平衡2分探索木です。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '左右部分木の高さの差が常に1以下の平衡木', true, 1),
(v_q_id, 'すべてのリーフが同じ深さにある木', false, 2),
(v_q_id, '各ノードが最大3つの子を持つ木', false, 3),
(v_q_id, 'データがランダムに配置される木', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ヒープの説明として正しいものはどれか。', 'ヒープは親ノードの値が子ノードの値以上（最大ヒープ）または以下（最小ヒープ）である完全2分木です。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '親の値が子の値以上（または以下）の完全2分木', true, 1),
(v_q_id, '左の子が右の子より小さい2分木', false, 2),
(v_q_id, 'すべてのノードが同じ値を持つ木', false, 3),
(v_q_id, 'データを配列で管理する線形構造', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'B木（Bツリー）が主に使用される場面はどれか。', 'B木はデータベースのインデックスやファイルシステムなど、ディスクアクセスの最適化に使われます。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データベースのインデックス', true, 1),
(v_q_id, 'メモリ内のソート', false, 2),
(v_q_id, 'ネットワークのルーティング', false, 3),
(v_q_id, '画像の圧縮処理', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2分探索木において、左部分木と右部分木の関係として正しいものはどれか。', '2分探索木では左部分木のすべてのノードの値は親より小さく、右部分木はすべて大きいです。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '左部分木の値は親より小さく、右部分木の値は親より大きい', true, 1),
(v_q_id, '左部分木の値は親より大きく、右部分木の値は親より小さい', false, 2),
(v_q_id, '左右の部分木の値に順序の制約はない', false, 3),
(v_q_id, '左右の部分木は常に同じ数のノードを持つ', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '循環リスト（環状リスト）の特徴として正しいものはどれか。', '循環リストは最後のノードが先頭のノードを指すことで環状になったリストです。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '最後のノードが先頭のノードを指して環状になる', true, 1),
(v_q_id, '各ノードが2つの次ノードを持つ', false, 2),
(v_q_id, '先頭からしかアクセスできない', false, 3),
(v_q_id, '要素の挿入ができない', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '優先度付きキューの説明として正しいものはどれか。', '優先度付きキューは要素に優先度が設定され、最も優先度の高い要素から取り出されるデータ構造です。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '優先度の高い要素から取り出されるキュー', true, 1),
(v_q_id, '先入れ先出しで要素を管理するキュー', false, 2),
(v_q_id, '後入れ先出しで要素を管理するキュー', false, 3),
(v_q_id, 'ランダムに要素を取り出すキュー', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '隣接行列でグラフを表現する場合の空間計算量はどれか。（頂点数をnとする）', '隣接行列はn×nの2次元配列を使うため、空間計算量はO(n²)です。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(n²)', true, 1),
(v_q_id, 'O(n)', false, 2),
(v_q_id, 'O(n log n)', false, 3),
(v_q_id, 'O(1)', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '隣接リストでグラフを表現する場合の利点として正しいものはどれか。', '隣接リストは辺の数が少ない疎グラフにおいてメモリ効率が良いです。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '疎グラフでメモリ効率が良い', true, 1),
(v_q_id, '任意の2頂点間の辺の有無を定数時間で判定できる', false, 2),
(v_q_id, '実装が隣接行列より単純である', false, 3),
(v_q_id, '全グラフで隣接行列よりメモリ効率が良い', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ハッシュテーブルの平均的な検索時間計算量はどれか。', 'ハッシュテーブルは衝突がない場合、キーから直接アドレスを計算できるため、平均O(1)で検索できます。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(1)', true, 1),
(v_q_id, 'O(n)', false, 2),
(v_q_id, 'O(log n)', false, 3),
(v_q_id, 'O(n²)', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '赤黒木の特徴として正しいものはどれか。', '赤黒木は各ノードに赤か黒の色を付け、特定の規則に従うことで平衡を保つ2分探索木です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ノードに色を付けて平衡を保つ2分探索木', true, 1),
(v_q_id, 'すべてのリーフが同じ深さの完全2分木', false, 2),
(v_q_id, 'ソート済みデータ専用の木構造', false, 3),
(v_q_id, '3つ以上の子を持てる多分木', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'トライ木（Trie）が主に使用される用途はどれか。', 'トライ木は文字列の検索や辞書の実装に使われ、共通の接頭辞を共有してメモリを節約します。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '文字列の検索や辞書の実装', true, 1),
(v_q_id, '数値のソート', false, 2),
(v_q_id, 'グラフの最短経路探索', false, 3),
(v_q_id, '画像データの格納', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '配列の先頭への要素の挿入の時間計算量はどれか。', '配列の先頭に要素を挿入するには、既存の全要素を後ろにずらす必要があるため、O(n)です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(n)', true, 1),
(v_q_id, 'O(1)', false, 2),
(v_q_id, 'O(log n)', false, 3),
(v_q_id, 'O(n²)', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '単方向連結リストの先頭への要素の挿入の時間計算量はどれか。', '単方向連結リストの先頭への挿入は、新ノードを作成して先頭ポインタを更新するだけなのでO(1)です。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(1)', true, 1),
(v_q_id, 'O(n)', false, 2),
(v_q_id, 'O(log n)', false, 3),
(v_q_id, 'O(n²)', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '完全2分木の定義として正しいものはどれか。', '完全2分木は最下層を除くすべての層が満たされ、最下層は左詰めになっている2分木です。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '最下層を除き全層が満たされ、最下層は左詰めの2分木', true, 1),
(v_q_id, 'すべてのノードが0個または2個の子を持つ2分木', false, 2),
(v_q_id, 'すべてのリーフが同じ深さにある2分木', false, 3),
(v_q_id, 'ノード数が偶数の2分木', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2分探索木に対する中順走査（in-order traversal）の結果はどれか。', '2分探索木を中順走査すると、ノードの値が昇順に得られます。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ノードの値が昇順に得られる', true, 1),
(v_q_id, 'ノードの値が降順に得られる', false, 2),
(v_q_id, 'ルートから順に層ごとに得られる', false, 3),
(v_q_id, '結果の順序は不定である', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'スタックのオーバーフローが発生するのはどのような場合か。', 'スタックオーバーフローは、スタックの容量を超えてデータをプッシュしようとした場合に発生します。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'スタックの容量を超えてプッシュした場合', true, 1),
(v_q_id, '空のスタックからポップした場合', false, 2),
(v_q_id, 'スタックを初期化した場合', false, 3),
(v_q_id, 'スタックの要素を参照した場合', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'デック（Deque）の説明として正しいものはどれか。', 'デック（両端キュー）は先頭と末尾の両方からデータの挿入と削除ができるデータ構造です。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '両端からデータの挿入と削除ができる構造', true, 1),
(v_q_id, '先頭からのみデータを操作できる構造', false, 2),
(v_q_id, 'ランダムな位置にアクセスできる構造', false, 3),
(v_q_id, '要素に優先度を付けて管理する構造', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '有向グラフと無向グラフの違いとして正しいものはどれか。', '有向グラフの辺には方向があり、無向グラフの辺には方向がありません。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '有向グラフの辺には方向があり、無向グラフにはない', true, 1),
(v_q_id, '有向グラフは重みを持ち、無向グラフは持たない', false, 2),
(v_q_id, '有向グラフは閉路を持ち、無向グラフは持たない', false, 3),
(v_q_id, '有向グラフと無向グラフに違いはない', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'n個のノードを持つ完全2分木の高さ（深さ）はおよそどれか。', '完全2分木の高さはおよそ log₂(n) です。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'log₂(n)', true, 1),
(v_q_id, 'n', false, 2),
(v_q_id, 'n/2', false, 3),
(v_q_id, 'n²', false, 4);

END $$;

-- ============================================
-- Quiz 7: コンピュータシステム ITパスポート テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('コンピュータシステム ITパスポート テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'CPUの役割として正しいものはどれか。', 'CPU（中央処理装置）はプログラムの命令を解釈し、演算や制御を行うコンピュータの中心部品です。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'プログラムの命令を解釈し実行する装置', true, 1),
(v_q_id, 'データを長期間保存する装置', false, 2),
(v_q_id, '画面に映像を表示する装置', false, 3),
(v_q_id, 'ネットワークに接続する装置', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'メモリ（主記憶装置）の説明として正しいものはどれか。', 'メモリはCPUが直接アクセスでき、実行中のプログラムやデータを一時的に格納する記憶装置です。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'CPUが直接アクセスする一時的な記憶装置', true, 1),
(v_q_id, 'データを永続的に保存する装置', false, 2),
(v_q_id, '外部機器と接続する装置', false, 3),
(v_q_id, 'プログラムを作成する装置', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ハードディスク（HDD）の説明として正しいものはどれか。', 'HDDは磁気ディスクを回転させてデータを読み書きする補助記憶装置です。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '磁気ディスクでデータを読み書きする補助記憶装置', true, 1),
(v_q_id, '半導体を使用した高速な記憶装置', false, 2),
(v_q_id, '光学式の記憶装置', false, 3),
(v_q_id, '揮発性の一時記憶装置', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SSDの特徴としてHDDと比較して正しいものはどれか。', 'SSDはフラッシュメモリを使用し、HDDより読み書きが高速で、物理的な駆動部品がありません。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '読み書きが高速で物理的な駆動部品がない', true, 1),
(v_q_id, '記憶容量が大きく価格が安い', false, 2),
(v_q_id, 'データの書き換え回数に制限がない', false, 3),
(v_q_id, '磁気ディスクを使用している', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'OSの役割として正しいものはどれか。', 'OS（オペレーティングシステム）はハードウェアとアプリケーションの仲介を行い、コンピュータ資源を管理します。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ハードウェアとアプリケーションの仲介・資源管理', true, 1),
(v_q_id, '文書や表を作成する', false, 2),
(v_q_id, 'ウイルスを駆除する', false, 3),
(v_q_id, 'インターネットに接続する', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '入力装置として正しいものはどれか。', 'キーボードはユーザーからコンピュータにデータを入力する入力装置の代表例です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'キーボード', true, 1),
(v_q_id, 'ディスプレイ', false, 2),
(v_q_id, 'プリンタ', false, 3),
(v_q_id, 'スピーカー', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '出力装置として正しいものはどれか。', 'ディスプレイはコンピュータの処理結果を表示する出力装置の代表例です。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ディスプレイ', true, 1),
(v_q_id, 'マウス', false, 2),
(v_q_id, 'キーボード', false, 3),
(v_q_id, 'スキャナ', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'RAMの特徴として正しいものはどれか。', 'RAMは読み書き可能な揮発性メモリで、電源を切るとデータが失われます。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '読み書き可能で電源を切るとデータが消える', true, 1),
(v_q_id, '読み取り専用で書き換えができない', false, 2),
(v_q_id, '電源を切ってもデータが保持される', false, 3),
(v_q_id, '補助記憶装置として使用される', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ROMの特徴として正しいものはどれか。', 'ROMは読み取り専用のメモリで、電源を切ってもデータが保持される不揮発性メモリです。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '読み取り専用で電源を切ってもデータが保持される', true, 1),
(v_q_id, '読み書き可能で揮発性のメモリ', false, 2),
(v_q_id, 'データの書き換えが高速にできる', false, 3),
(v_q_id, '主記憶装置として使用される', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'クロック周波数の説明として正しいものはどれか。', 'クロック周波数はCPUの動作速度を表す指標で、単位はHz（ヘルツ）です。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'CPUの動作速度を表す指標', true, 1),
(v_q_id, 'メモリの容量を表す指標', false, 2),
(v_q_id, 'ディスクの回転速度を表す指標', false, 3),
(v_q_id, 'ネットワークの通信速度を表す指標', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'USBの説明として正しいものはどれか。', 'USBは周辺機器をコンピュータに接続するための汎用インターフェース規格です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '周辺機器を接続する汎用インターフェース規格', true, 1),
(v_q_id, 'ネットワーク通信のプロトコル', false, 2),
(v_q_id, 'データ圧縮の規格', false, 3),
(v_q_id, 'プログラミング言語の一種', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '仮想化技術の説明として正しいものはどれか。', '仮想化は1台の物理コンピュータ上で複数の仮想的なコンピュータ環境を動作させる技術です。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1台の物理マシンで複数の仮想環境を動作させる技術', true, 1),
(v_q_id, 'データを仮想的に暗号化する技術', false, 2),
(v_q_id, 'ネットワークを仮想的に分離する技術のみ', false, 3),
(v_q_id, '仮想現実（VR）を実現する技術', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'クラウドコンピューティングの説明として正しいものはどれか。', 'クラウドコンピューティングはインターネット経由でサーバーやストレージなどのITリソースを利用するサービスです。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'インターネット経由でITリソースを利用するサービス', true, 1),
(v_q_id, '天気予報を行うコンピュータシステム', false, 2),
(v_q_id, '自社内にサーバーを設置するサービス', false, 3),
(v_q_id, 'パソコン内のデータを自動保存する機能', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'GPUの用途として最も適切なものはどれか。', 'GPU（Graphics Processing Unit）は画像処理に特化したプロセッサで、並列計算が得意です。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '画像処理や並列計算', true, 1),
(v_q_id, 'データの長期保存', false, 2),
(v_q_id, 'ネットワーク通信の制御', false, 3),
(v_q_id, '文書の印刷処理', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'BIOSの役割として正しいものはどれか。', 'BIOSはコンピュータの電源投入時にハードウェアの初期化やOSの起動を行うファームウェアです。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '電源投入時にハードウェア初期化とOS起動を行う', true, 1),
(v_q_id, 'アプリケーションソフトを管理する', false, 2),
(v_q_id, 'ネットワーク接続を管理する', false, 3),
(v_q_id, 'データのバックアップを行う', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'マルチタスクの説明として正しいものはどれか。', 'マルチタスクはOSが複数のプログラムを同時に（見かけ上）実行する機能です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '複数のプログラムを同時に実行する機能', true, 1),
(v_q_id, '1つのプログラムを複数のCPUで実行する機能', false, 2),
(v_q_id, '複数のユーザーが同時にログインする機能', false, 3),
(v_q_id, '複数のファイルを同時に保存する機能', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'デバイスドライバの説明として正しいものはどれか。', 'デバイスドライバはOSが周辺機器を制御するためのソフトウェアです。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'OSが周辺機器を制御するためのソフトウェア', true, 1),
(v_q_id, 'ハードディスクのデータを管理するソフトウェア', false, 2),
(v_q_id, 'ネットワーク通信を行うためのプロトコル', false, 3),
(v_q_id, 'ウイルスを検出するソフトウェア', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ファイルシステムの役割として正しいものはどれか。', 'ファイルシステムはストレージ上のデータを管理し、ファイルの保存・読み出しを制御する仕組みです。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ストレージ上のデータを管理する仕組み', true, 1),
(v_q_id, 'CPUの処理速度を管理する仕組み', false, 2),
(v_q_id, 'ネットワーク接続を管理する仕組み', false, 3),
(v_q_id, 'ユーザーの認証を管理する仕組み', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'バッチ処理の説明として正しいものはどれか。', 'バッチ処理は複数の処理をまとめて一括で実行する処理方式です。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '複数の処理をまとめて一括で実行する方式', true, 1),
(v_q_id, '要求ごとにリアルタイムで処理する方式', false, 2),
(v_q_id, '複数のコンピュータで分散処理する方式', false, 3),
(v_q_id, 'ユーザーの対話的な操作で処理する方式', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'IoT機器の説明として正しいものはどれか。', 'IoT機器はインターネットに接続され、データの収集や遠隔制御が可能な機器です。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'インターネットに接続してデータ収集や制御を行う機器', true, 1),
(v_q_id, '高性能な計算処理専用の機器', false, 2),
(v_q_id, 'データを暗号化する専用機器', false, 3),
(v_q_id, 'ネットワークを遮断する機器', false, 4);

END $$;

-- ============================================
-- Quiz 8: コンピュータシステム 基本情報 テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('コンピュータシステム 基本情報 テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'パイプライン処理の説明として正しいものはどれか。', 'パイプライン処理は命令の実行をステージに分割し、各ステージを並行して処理することで高速化する手法です。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '命令実行をステージに分割して並行処理する手法', true, 1),
(v_q_id, '複数のCPUで同じ命令を実行する手法', false, 2),
(v_q_id, 'メモリ上のデータを順番に処理する手法', false, 3),
(v_q_id, '命令を一つずつ順番に実行する手法', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'キャッシュメモリの目的として正しいものはどれか。', 'キャッシュメモリはCPUと主記憶装置の速度差を埋めるための高速な小容量メモリです。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'CPUと主記憶装置の速度差を埋める', true, 1),
(v_q_id, 'データを永続的に保存する', false, 2),
(v_q_id, 'ネットワーク通信を高速化する', false, 3),
(v_q_id, '補助記憶の容量を増やす', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '割り込み処理の説明として正しいものはどれか。', '割り込みは実行中の処理を中断して、優先度の高い処理を実行するCPUの機能です。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '実行中の処理を中断して優先度の高い処理を実行する', true, 1),
(v_q_id, 'プログラムの実行を永久に停止する', false, 2),
(v_q_id, '複数のプログラムを交互に実行する', false, 3),
(v_q_id, 'メモリのデータを書き換える', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '仮想記憶の説明として正しいものはどれか。', '仮想記憶は補助記憶の一部を主記憶の拡張として使用し、見かけ上のメモリ空間を大きくする技術です。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '補助記憶を使って見かけ上のメモリ空間を拡大する技術', true, 1),
(v_q_id, 'データを暗号化してメモリに格納する技術', false, 2),
(v_q_id, 'メモリの物理容量を実際に増やす技術', false, 3),
(v_q_id, 'キャッシュメモリの容量を増やす技術', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ページングの説明として正しいものはどれか。', 'ページングは仮想記憶で、メモリを固定サイズのページに分割して管理する方式です。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'メモリを固定サイズのページに分割して管理する方式', true, 1),
(v_q_id, 'メモリを可変サイズのセグメントに分割する方式', false, 2),
(v_q_id, 'メモリの使用量を監視する方式', false, 3),
(v_q_id, 'メモリ内のデータを暗号化する方式', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'スラッシングの説明として正しいものはどれか。', 'スラッシングはページフォールトが頻発し、OSがページの入れ替えに大半の時間を費やして処理効率が著しく低下する現象です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ページの入れ替えが頻発して処理効率が著しく低下する現象', true, 1),
(v_q_id, 'CPUの処理速度が低下する現象', false, 2),
(v_q_id, 'ハードディスクが故障する現象', false, 3),
(v_q_id, 'ネットワークの通信速度が低下する現象', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'RAID5の特徴として正しいものはどれか。', 'RAID5はデータとパリティ情報を複数のディスクに分散して格納し、1台のディスク故障に耐えられます。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'パリティを分散配置し1台の故障に耐えられる', true, 1),
(v_q_id, 'データを2台のディスクにミラーリングする', false, 2),
(v_q_id, 'ストライピングのみで冗長性がない', false, 3),
(v_q_id, '3台以上のディスク故障に耐えられる', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'プロセスとスレッドの違いとして正しいものはどれか。', 'プロセスは独立したメモリ空間を持ち、スレッドは同一プロセス内でメモリ空間を共有します。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'スレッドは同一プロセス内でメモリ空間を共有する', true, 1),
(v_q_id, 'プロセスはスレッドより軽量である', false, 2),
(v_q_id, 'スレッドは独立したメモリ空間を持つ', false, 3),
(v_q_id, 'プロセスとスレッドに違いはない', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'デッドロックの説明として正しいものはどれか。', 'デッドロックは複数のプロセスが互いに相手の持つ資源を待ち合い、いずれも進行できなくなる状態です。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '複数のプロセスが互いに資源を待ち合い進行不能になる状態', true, 1),
(v_q_id, 'プロセスが無限ループに入る状態', false, 2),
(v_q_id, 'メモリが不足してプロセスが停止する状態', false, 3),
(v_q_id, 'CPUの使用率が100%になる状態', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'MIPS（Million Instructions Per Second）の説明として正しいものはどれか。', 'MIPSはCPUが1秒間に実行できる命令数を百万単位で表した処理性能の指標です。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1秒間に実行できる命令数を百万単位で表した性能指標', true, 1),
(v_q_id, 'メモリの転送速度を表す指標', false, 2),
(v_q_id, 'ディスクの回転速度を表す指標', false, 3),
(v_q_id, 'ネットワークの帯域幅を表す指標', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'RISC型プロセッサの特徴として正しいものはどれか。', 'RISCは命令セットを単純化し、各命令を1クロックサイクルで実行することを目指すアーキテクチャです。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '命令を単純化し高速実行を目指す', true, 1),
(v_q_id, '複雑な命令セットを持つ', false, 2),
(v_q_id, '1命令で複雑な処理を実行する', false, 3),
(v_q_id, 'マイクロプログラム方式で動作する', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'アドレッシングモードの一つである間接アドレッシングの説明として正しいものはどれか。', '間接アドレッシングは命令中のアドレスが示す番地に格納されている値を、実際のデータのアドレスとして使用する方式です。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '指定アドレスの内容をデータのアドレスとして使用する方式', true, 1),
(v_q_id, '指定アドレスのデータを直接使用する方式', false, 2),
(v_q_id, '命令中に直接データを含める方式', false, 3),
(v_q_id, 'プログラムカウンタからの相対位置で指定する方式', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'マルチプロセッサシステムの利点として正しいものはどれか。', 'マルチプロセッサは複数のCPUで処理を分担するため、処理能力の向上と信頼性の向上が期待できます。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '処理能力と信頼性の向上', true, 1),
(v_q_id, 'メモリ使用量の削減', false, 2),
(v_q_id, '消費電力の削減', false, 3),
(v_q_id, 'ソフトウェア開発の簡略化', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'キャッシュメモリのヒット率が90%のとき、ミス率はどれか。', 'ヒット率 + ミス率 = 100% なので、ヒット率90%のときミス率は10%です。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '10%', true, 1),
(v_q_id, '90%', false, 2),
(v_q_id, '50%', false, 3),
(v_q_id, '0%', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ラウンドロビン方式のプロセススケジューリングの説明として正しいものはどれか。', 'ラウンドロビンは各プロセスに均等な時間（タイムクォンタム）を割り当てて順番に実行する方式です。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '各プロセスに均等な時間を割り当て順番に実行する方式', true, 1),
(v_q_id, '最も優先度の高いプロセスを常に実行する方式', false, 2),
(v_q_id, '実行時間の短いプロセスを優先する方式', false, 3),
(v_q_id, '先に到着したプロセスを先に実行する方式', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'DMAの説明として正しいものはどれか。', 'DMA（Direct Memory Access）はCPUを介さずに、周辺機器とメモリ間で直接データを転送する方式です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'CPUを介さず周辺機器とメモリ間で直接データ転送する方式', true, 1),
(v_q_id, 'CPUがすべてのデータ転送を制御する方式', false, 2),
(v_q_id, 'メモリ上のデータを自動的に暗号化する方式', false, 3),
(v_q_id, 'ディスク上のデータを直接修正する方式', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'RAID1（ミラーリング）の説明として正しいものはどれか。', 'RAID1は同じデータを2台のディスクに同時に書き込むことで、一方の故障に備える方式です。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '同じデータを2台のディスクに同時に書き込む方式', true, 1),
(v_q_id, 'データをストライピングして高速化する方式', false, 2),
(v_q_id, 'パリティを使って誤り訂正する方式', false, 3),
(v_q_id, '3台以上のディスクに分散書き込みする方式', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'セマフォの説明として正しいものはどれか。', 'セマフォは排他制御のために使われる同期機構で、カウンタ変数を使って共有資源へのアクセスを制御します。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'カウンタ変数で共有資源へのアクセスを制御する同期機構', true, 1),
(v_q_id, 'プロセス間でデータを送受信する仕組み', false, 2),
(v_q_id, 'メモリを自動的に管理する仕組み', false, 3),
(v_q_id, 'ファイルのアクセス権を管理する仕組み', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'メモリインターリーブの目的として正しいものはどれか。', 'メモリインターリーブは複数のメモリバンクに交互にアクセスすることで、見かけ上のアクセス速度を向上させる技法です。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '複数のメモリバンクへ交互にアクセスし速度を向上させる', true, 1),
(v_q_id, 'メモリの消費電力を削減する', false, 2),
(v_q_id, 'メモリの容量を増やす', false, 3),
(v_q_id, 'メモリのエラーを訂正する', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'フォールトトレラントシステムの説明として正しいものはどれか。', 'フォールトトレラントシステムは部品の故障が発生してもシステム全体の機能を維持できるように設計されたシステムです。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '故障が発生してもシステム全体の機能を維持するシステム', true, 1),
(v_q_id, '故障を検出して自動的に修理するシステム', false, 2),
(v_q_id, '故障時に自動的にシャットダウンするシステム', false, 3),
(v_q_id, '故障の原因を分析するシステム', false, 4);

END $$;

-- ============================================
-- Quiz 9: データベース ITパスポート テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('データベース ITパスポート テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'データベースの説明として正しいものはどれか。', 'データベースは関連するデータを整理・統合して管理し、効率的に検索・更新できるようにしたデータの集合です。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データを整理・統合して効率的に管理するデータの集合', true, 1),
(v_q_id, 'ファイルを保存するフォルダのこと', false, 2),
(v_q_id, 'プログラムのソースコードのこと', false, 3),
(v_q_id, 'ネットワーク上のサーバーのこと', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '関係データベース（リレーショナルデータベース）の特徴として正しいものはどれか。', '関係データベースはデータを表（テーブル）形式で管理し、SQLを使ってデータの操作を行います。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データを表（テーブル）形式で管理する', true, 1),
(v_q_id, 'データをツリー構造で管理する', false, 2),
(v_q_id, 'データをグラフ構造で管理する', false, 3),
(v_q_id, 'データをキーと値のペアで管理する', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'テーブルの行（レコード）の説明として正しいものはどれか。', 'テーブルの行（レコード、タプル）は一つのデータの集まり（1件のデータ）を表します。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1件分のデータの集まり', true, 1),
(v_q_id, 'データの項目名', false, 2),
(v_q_id, 'テーブル全体のこと', false, 3),
(v_q_id, 'データの型定義', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'テーブルの列（カラム）の説明として正しいものはどれか。', '列（カラム、属性）はデータの項目（フィールド）を表し、名前やデータ型を持ちます。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データの項目（フィールド）を表す', true, 1),
(v_q_id, '1件分のデータを表す', false, 2),
(v_q_id, 'テーブル間の関係を表す', false, 3),
(v_q_id, 'データの並び順を表す', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '主キー（プライマリキー）の説明として正しいものはどれか。', '主キーはテーブル内の各レコードを一意に識別するための列（またはその組み合わせ）です。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'テーブル内の各レコードを一意に識別する列', true, 1),
(v_q_id, '他のテーブルを参照する列', false, 2),
(v_q_id, 'データの並び順を決める列', false, 3),
(v_q_id, 'NULLを許容する列', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '外部キー（フォーリンキー）の説明として正しいものはどれか。', '外部キーは他のテーブルの主キーを参照して、テーブル間の関連を表現する列です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '他のテーブルの主キーを参照してテーブル間の関連を表す列', true, 1),
(v_q_id, 'テーブル内のレコードを一意に識別する列', false, 2),
(v_q_id, '外部のデータベースに接続するための列', false, 3),
(v_q_id, 'データの暗号化に使用する列', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SQLのSELECT文の用途として正しいものはどれか。', 'SELECT文はデータベースからデータを検索・取得するために使用されるSQL文です。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データベースからデータを検索・取得する', true, 1),
(v_q_id, 'テーブルにデータを追加する', false, 2),
(v_q_id, 'テーブルからデータを削除する', false, 3),
(v_q_id, 'テーブルの構造を変更する', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SQLのINSERT文の用途として正しいものはどれか。', 'INSERT文はテーブルに新しいデータ（レコード）を追加するために使用されるSQL文です。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'テーブルに新しいデータを追加する', true, 1),
(v_q_id, 'テーブルからデータを検索する', false, 2),
(v_q_id, 'テーブルのデータを更新する', false, 3),
(v_q_id, 'テーブルを削除する', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SQLのUPDATE文の用途として正しいものはどれか。', 'UPDATE文は既存のデータを変更・修正するために使用されるSQL文です。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '既存のデータを変更・修正する', true, 1),
(v_q_id, 'テーブルに新しいデータを追加する', false, 2),
(v_q_id, 'テーブルからデータを削除する', false, 3),
(v_q_id, 'データベースを作成する', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SQLのDELETE文の用途として正しいものはどれか。', 'DELETE文はテーブルから条件に合うデータを削除するために使用されるSQL文です。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'テーブルからデータを削除する', true, 1),
(v_q_id, 'テーブルに新しいデータを追加する', false, 2),
(v_q_id, 'テーブルの構造を変更する', false, 3),
(v_q_id, 'データを検索する', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'WHERE句の用途として正しいものはどれか。', 'WHERE句はSQLで検索や操作の対象となるデータの条件を指定するために使用します。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データの条件を指定して絞り込む', true, 1),
(v_q_id, 'データの並び順を指定する', false, 2),
(v_q_id, 'データのグループ化を指定する', false, 3),
(v_q_id, '取得する列を指定する', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ORDER BY句の用途として正しいものはどれか。', 'ORDER BY句は検索結果を指定した列の値で昇順または降順に並べ替えるために使用します。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '検索結果を指定した列の値で並べ替える', true, 1),
(v_q_id, '検索条件を指定する', false, 2),
(v_q_id, 'テーブルを結合する', false, 3),
(v_q_id, '集計関数を適用する', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'トランザクションの説明として正しいものはどれか。', 'トランザクションはデータベースに対する一連の操作をひとまとまりとして扱い、全て成功するか全て取り消すかのどちらかとする処理単位です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '一連の操作をまとめて全て成功か全て取り消しにする処理単位', true, 1),
(v_q_id, 'データの検索を高速化する仕組み', false, 2),
(v_q_id, 'テーブル間の関係を定義する仕組み', false, 3),
(v_q_id, 'バックアップを作成する仕組み', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'バックアップの目的として正しいものはどれか。', 'バックアップはデータの破損や消失に備えて、データの複製を別の場所に保存することです。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データの破損・消失に備えて複製を保存する', true, 1),
(v_q_id, 'データの検索速度を向上させる', false, 2),
(v_q_id, 'データを暗号化する', false, 3),
(v_q_id, 'データベースの容量を増やす', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'E-R図（ER図）の説明として正しいものはどれか。', 'E-R図はEntity-Relationship図の略で、データベース設計においてエンティティ（実体）とその関連を図示したものです。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'エンティティとその関連を図示したもの', true, 1),
(v_q_id, 'プログラムの処理の流れを示したもの', false, 2),
(v_q_id, 'ネットワークの接続構成を示したもの', false, 3),
(v_q_id, 'ユーザーの操作手順を示したもの', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'データベースの排他制御の目的として正しいものはどれか。', '排他制御は複数のユーザーが同時にデータを更新した場合のデータの整合性を保つための仕組みです。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '同時更新によるデータ不整合を防ぐ', true, 1),
(v_q_id, 'データの検索速度を向上させる', false, 2),
(v_q_id, 'データを暗号化して保護する', false, 3),
(v_q_id, 'データのバックアップを取る', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'NoSQLデータベースの特徴として正しいものはどれか。', 'NoSQLデータベースはリレーショナル型以外のデータベースの総称で、柔軟なデータ構造と高い拡張性が特徴です。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '柔軟なデータ構造と高い拡張性を持つ', true, 1),
(v_q_id, 'SQLのみで操作できる', false, 2),
(v_q_id, '必ずテーブル形式でデータを管理する', false, 3),
(v_q_id, 'トランザクション処理ができない', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'GROUP BY句の用途として正しいものはどれか。', 'GROUP BY句は指定した列の値でデータをグループ化し、集計関数と組み合わせて使います。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '指定した列の値でデータをグループ化する', true, 1),
(v_q_id, '検索結果を並べ替える', false, 2),
(v_q_id, '検索条件を指定する', false, 3),
(v_q_id, 'テーブルを結合する', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'インデックスの説明として正しいものはどれか。', 'インデックス（索引）はデータの検索を高速化するために、テーブルの特定の列に対して作成されるデータ構造です。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データの検索を高速化するために列に作成するデータ構造', true, 1),
(v_q_id, 'テーブル間の関連を定義する仕組み', false, 2),
(v_q_id, 'データのバックアップを取る仕組み', false, 3),
(v_q_id, 'データを暗号化する仕組み', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'NULL値の説明として正しいものはどれか。', 'NULLはデータが存在しない（未定義）ことを示す特別な値で、0や空文字列とは異なります。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データが存在しないことを示す特別な値', true, 1),
(v_q_id, '数値の0のこと', false, 2),
(v_q_id, '空の文字列のこと', false, 3),
(v_q_id, 'エラーを示す値', false, 4);

END $$;

-- ============================================
-- Quiz 10: データベース 基本情報 テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('データベース 基本情報 テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '正規化の目的として正しいものはどれか。', '正規化はデータの冗長性を排除し、更新時の異常（挿入・削除・更新異常）を防ぐためのテーブル設計手法です。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データの冗長性を排除し更新異常を防ぐ', true, 1),
(v_q_id, 'データの検索速度を向上させる', false, 2),
(v_q_id, 'テーブルの数を減らす', false, 3),
(v_q_id, 'データを暗号化する', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '第1正規形の条件として正しいものはどれか。', '第1正規形はすべての属性が原子値（これ以上分割できない値）を持つことが条件です。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'すべての属性が原子値（分割不可能な値）を持つ', true, 1),
(v_q_id, '部分関数従属を排除している', false, 2),
(v_q_id, '推移的関数従属を排除している', false, 3),
(v_q_id, 'すべての属性が主キーに依存している', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '第2正規形の条件として正しいものはどれか。', '第2正規形は第1正規形を満たし、かつ部分関数従属が存在しないことが条件です。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '第1正規形であり部分関数従属が存在しない', true, 1),
(v_q_id, 'すべての属性が原子値を持つ', false, 2),
(v_q_id, '推移的関数従属が存在しない', false, 3),
(v_q_id, '候補キーが一つだけである', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '第3正規形の条件として正しいものはどれか。', '第3正規形は第2正規形を満たし、かつ推移的関数従属が存在しないことが条件です。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '第2正規形であり推移的関数従属が存在しない', true, 1),
(v_q_id, '第1正規形であり部分関数従属が存在しない', false, 2),
(v_q_id, 'すべての属性が候補キーの一部である', false, 3),
(v_q_id, 'テーブルが3つ以下に分割されている', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ACID特性のうち「原子性（Atomicity）」の説明として正しいものはどれか。', '原子性はトランザクション内の操作がすべて成功するか、すべて失敗するか（取り消し）のどちらかであることを保証する性質です。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'トランザクションの操作がすべて成功かすべて失敗かのどちらかになる', true, 1),
(v_q_id, 'トランザクション前後でデータの整合性が保たれる', false, 2),
(v_q_id, '複数のトランザクションが互いに影響を与えない', false, 3),
(v_q_id, 'トランザクションの結果が永続的に保存される', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '結合（JOIN）の種類のうち、内部結合（INNER JOIN）の説明として正しいものはどれか。', '内部結合は結合条件に一致するレコードのみを両方のテーブルから取得する結合方法です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '結合条件に一致するレコードのみを取得する', true, 1),
(v_q_id, '一方のテーブルの全レコードと一致するレコードを取得する', false, 2),
(v_q_id, '両方のテーブルの全レコードを取得する', false, 3),
(v_q_id, '結合条件に一致しないレコードのみを取得する', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '左外部結合（LEFT OUTER JOIN）の説明として正しいものはどれか。', '左外部結合は左テーブルの全レコードと、右テーブルの一致するレコードを取得します。一致しない場合はNULLになります。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '左テーブルの全レコードと右テーブルの一致するレコードを取得する', true, 1),
(v_q_id, '両方のテーブルの一致するレコードのみを取得する', false, 2),
(v_q_id, '右テーブルの全レコードと左テーブルの一致するレコードを取得する', false, 3),
(v_q_id, '両方のテーブルの全レコードを取得する', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'サブクエリ（副問い合わせ）の説明として正しいものはどれか。', 'サブクエリはSQL文の中に入れ子にしたSQL文で、外側のクエリの条件として使用されます。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'SQL文の中に入れ子にしたSQL文', true, 1),
(v_q_id, '複数のテーブルを結合するSQL文', false, 2),
(v_q_id, 'データを一括更新するSQL文', false, 3),
(v_q_id, 'テーブルを作成するSQL文', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ビュー（VIEW）の説明として正しいものはどれか。', 'ビューはSELECT文の結果を仮想的なテーブルとして定義したもので、実データは持ちません。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'SELECT文の結果を仮想テーブルとして定義したもの', true, 1),
(v_q_id, 'テーブルのバックアップコピー', false, 2),
(v_q_id, 'インデックスの一種', false, 3),
(v_q_id, 'ストアドプロシージャの一種', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ストアドプロシージャの利点として正しいものはどれか。', 'ストアドプロシージャはデータベースサーバー側で実行されるため、ネットワーク通信量の削減と処理速度の向上が期待できます。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'サーバー側実行によるネットワーク通信量の削減', true, 1),
(v_q_id, 'クライアント側のメモリ消費を増やす', false, 2),
(v_q_id, 'テーブル構造を自動的に最適化する', false, 3),
(v_q_id, 'データの暗号化を自動的に行う', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ACID特性の「一貫性（Consistency）」の説明として正しいものはどれか。', '一貫性はトランザクションの前後でデータの整合性（制約やルール）が保たれることを保証する性質です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'トランザクション前後でデータの整合性が保たれる', true, 1),
(v_q_id, 'トランザクションがすべて成功かすべて失敗になる', false, 2),
(v_q_id, '複数のトランザクションが互いに影響しない', false, 3),
(v_q_id, 'コミット後のデータが永続的に保存される', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'デッドロックの説明として正しいものはどれか。', 'デッドロックは複数のトランザクションが互いのロックを待ち合い、いずれも進行できなくなる状態です。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '複数のトランザクションが互いにロックを待ち合う状態', true, 1),
(v_q_id, 'データベースの容量が不足した状態', false, 2),
(v_q_id, 'ネットワーク切断でトランザクションが中断した状態', false, 3),
(v_q_id, 'インデックスが破損した状態', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'B+木インデックスの特徴として正しいものはどれか。', 'B+木はリーフノードがリンクで繋がっているため範囲検索に適しており、データベースのインデックスに広く使われます。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'リーフノードがリンクで繋がり範囲検索に適している', true, 1),
(v_q_id, 'ハッシュ値を使って高速にアクセスする', false, 2),
(v_q_id, 'データを圧縮して格納する', false, 3),
(v_q_id, '全文検索に特化した構造である', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ロールバックの説明として正しいものはどれか。', 'ロールバックはトランザクション中にエラーが発生した場合、トランザクション開始前の状態に戻す処理です。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'トランザクション開始前の状態にデータを戻す処理', true, 1),
(v_q_id, 'トランザクションの結果を確定する処理', false, 2),
(v_q_id, 'データベースのバックアップを取る処理', false, 3),
(v_q_id, 'インデックスを再構築する処理', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '関係代数演算の「射影」の説明として正しいものはどれか。', '射影は関係（テーブル）から指定した属性（列）のみを取り出す演算で、SQLのSELECT句に相当します。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '指定した属性（列）のみを取り出す演算', true, 1),
(v_q_id, '条件に合う行のみを取り出す演算', false, 2),
(v_q_id, '2つのテーブルを結合する演算', false, 3),
(v_q_id, '2つのテーブルの積集合を求める演算', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '関係代数演算の「選択」の説明として正しいものはどれか。', '選択は関係から条件に合うタプル（行）のみを取り出す演算で、SQLのWHERE句に相当します。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '条件に合うタプル（行）のみを取り出す演算', true, 1),
(v_q_id, '指定した属性（列）のみを取り出す演算', false, 2),
(v_q_id, '2つのテーブルの和集合を求める演算', false, 3),
(v_q_id, '2つのテーブルの差集合を求める演算', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2相コミットプロトコルの目的として正しいものはどれか。', '2相コミットは分散データベースにおいて、複数のノードで一貫してトランザクションをコミットまたはロールバックするためのプロトコルです。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '分散データベースでトランザクションの一貫性を保つ', true, 1),
(v_q_id, 'データの検索速度を向上させる', false, 2),
(v_q_id, 'データのバックアップを自動化する', false, 3),
(v_q_id, 'テーブルの正規化を自動で行う', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '楽観的ロックと悲観的ロックの違いとして正しいものはどれか。', '楽観的ロックは競合が稀と仮定しコミット時に検証し、悲観的ロックはデータ取得時にロックをかけます。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '楽観的はコミット時に検証し、悲観的は取得時にロックする', true, 1),
(v_q_id, '楽観的は取得時にロックし、悲観的はコミット時に検証する', false, 2),
(v_q_id, '楽観的はデータを暗号化し、悲観的は暗号化しない', false, 3),
(v_q_id, '両方とも同じタイミングでロックする', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'WAL（Write-Ahead Logging）の説明として正しいものはどれか。', 'WALはデータを変更する前にログを先に書き込む方式で、障害復旧時にデータの一貫性を保証します。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データ変更前にログを先に書き込み障害復旧を保証する方式', true, 1),
(v_q_id, 'データ変更後にログを書き込む方式', false, 2),
(v_q_id, 'ログを書き込まずにデータを直接変更する方式', false, 3),
(v_q_id, 'データのバックアップを自動で取る方式', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'HAVING句の用途として正しいものはどれか。', 'HAVING句はGROUP BYでグループ化した結果に対して条件を指定するために使います。WHERE句はグループ化前の個別レコードに対する条件です。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'GROUP BYの結果に対して条件を指定する', true, 1),
(v_q_id, '個別のレコードに対して条件を指定する', false, 2),
(v_q_id, '検索結果を並べ替える', false, 3),
(v_q_id, 'テーブルを結合する条件を指定する', false, 4);

END $$;

-- ============================================
-- Quiz 11: ネットワーク ITパスポート テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('ネットワーク ITパスポート テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'IPアドレスの説明として正しいものはどれか。', 'IPアドレスはネットワーク上の機器を識別するための固有の番号です。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ネットワーク上の機器を識別するための番号', true, 1),
(v_q_id, 'Webサイトの名前のこと', false, 2),
(v_q_id, 'メールアドレスのこと', false, 3),
(v_q_id, 'ファイルの保存場所のこと', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'LANの説明として正しいものはどれか。', 'LAN（Local Area Network）は建物内やフロア内など、限られた範囲で構築されるネットワークです。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '限られた範囲で構築されるネットワーク', true, 1),
(v_q_id, '世界中をつなぐネットワーク', false, 2),
(v_q_id, '無線通信専用のネットワーク', false, 3),
(v_q_id, '衛星通信によるネットワーク', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'WANの説明として正しいものはどれか。', 'WAN（Wide Area Network）は地理的に離れた拠点間を接続する広域ネットワークです。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '地理的に離れた拠点を接続する広域ネットワーク', true, 1),
(v_q_id, '一つの建物内のネットワーク', false, 2),
(v_q_id, '無線LANのこと', false, 3),
(v_q_id, 'プライベートネットワークのこと', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'プロトコルの説明として正しいものはどれか。', 'プロトコルはコンピュータ間で通信を行うための取り決め（規約）です。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'コンピュータ間の通信の取り決め（規約）', true, 1),
(v_q_id, 'ネットワーク機器のこと', false, 2),
(v_q_id, 'IPアドレスの別名', false, 3),
(v_q_id, 'セキュリティソフトのこと', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'HTTPの説明として正しいものはどれか。', 'HTTP（HyperText Transfer Protocol）はWebページを転送するためのプロトコルです。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'Webページを転送するためのプロトコル', true, 1),
(v_q_id, 'メールを送信するためのプロトコル', false, 2),
(v_q_id, 'ファイルを転送するためのプロトコル', false, 3),
(v_q_id, 'ドメイン名を解決するプロトコル', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'DNSの役割として正しいものはどれか。', 'DNS（Domain Name System）はドメイン名をIPアドレスに変換する（名前解決を行う）仕組みです。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ドメイン名をIPアドレスに変換する', true, 1),
(v_q_id, 'データを暗号化する', false, 2),
(v_q_id, 'メールを配送する', false, 3),
(v_q_id, 'ファイルを共有する', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ルーターの役割として正しいものはどれか。', 'ルーターは異なるネットワーク間でデータを中継し、最適な経路を選択して転送する装置です。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '異なるネットワーク間でデータを中継する装置', true, 1),
(v_q_id, 'コンピュータ同士を直接接続する装置', false, 2),
(v_q_id, 'データを暗号化する装置', false, 3),
(v_q_id, 'Webサイトを公開する装置', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'Wi-Fiの説明として正しいものはどれか。', 'Wi-Fiは無線LANの規格の一つで、電波を使ってケーブルなしでネットワークに接続できる技術です。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '電波を使ってケーブルなしでネットワーク接続する技術', true, 1),
(v_q_id, '有線LANの高速通信規格', false, 2),
(v_q_id, '携帯電話の通信規格', false, 3),
(v_q_id, '衛星通信の規格', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'URLの説明として正しいものはどれか。', 'URL（Uniform Resource Locator）はインターネット上のリソース（Webページなど）の場所を示す文字列です。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'インターネット上のリソースの場所を示す文字列', true, 1),
(v_q_id, 'ネットワーク上の機器の固有番号', false, 2),
(v_q_id, '暗号化通信の規格', false, 3),
(v_q_id, 'メールの送信先を示す文字列', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'MACアドレスの説明として正しいものはどれか。', 'MACアドレスはネットワーク機器に製造時に付与される固有の物理アドレスです。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ネットワーク機器に付与される固有の物理アドレス', true, 1),
(v_q_id, 'ソフトウェアで変更可能なIPアドレス', false, 2),
(v_q_id, 'ドメイン名のこと', false, 3),
(v_q_id, 'メールアドレスの別名', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'VPNの説明として正しいものはどれか。', 'VPN（Virtual Private Network）はインターネット上に暗号化された仮想的な専用回線を構築する技術です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'インターネット上に暗号化された仮想的な専用回線を構築する技術', true, 1),
(v_q_id, '物理的な専用回線を敷設する技術', false, 2),
(v_q_id, '無線LANの暗号化規格', false, 3),
(v_q_id, 'ウイルス対策ソフトの一種', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'DHCPの役割として正しいものはどれか。', 'DHCP（Dynamic Host Configuration Protocol）はネットワーク内の機器にIPアドレスを自動的に割り当てるプロトコルです。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'IPアドレスを自動的に割り当てる', true, 1),
(v_q_id, 'ドメイン名をIPアドレスに変換する', false, 2),
(v_q_id, 'メールを配送する', false, 3),
(v_q_id, 'Webページを転送する', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'スイッチングハブの役割として正しいものはどれか。', 'スイッチングハブはMACアドレスを基に、目的の機器にのみデータを転送する装置です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'MACアドレスを基に目的の機器にデータを転送する装置', true, 1),
(v_q_id, '異なるネットワーク間を接続する装置', false, 2),
(v_q_id, 'データを暗号化する装置', false, 3),
(v_q_id, '無線LANの基地局', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'クラウドサービスのSaaSの説明として正しいものはどれか。', 'SaaS（Software as a Service）はインターネット経由でソフトウェアをサービスとして提供する形態です。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'インターネット経由でソフトウェアを提供する形態', true, 1),
(v_q_id, 'サーバーのハードウェアを提供する形態', false, 2),
(v_q_id, 'OSやミドルウェアの実行環境を提供する形態', false, 3),
(v_q_id, 'ネットワーク回線を提供する形態', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SMTPの役割として正しいものはどれか。', 'SMTP（Simple Mail Transfer Protocol）はメールを送信・転送するためのプロトコルです。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'メールを送信・転送するプロトコル', true, 1),
(v_q_id, 'メールを受信するプロトコル', false, 2),
(v_q_id, 'Webページを転送するプロトコル', false, 3),
(v_q_id, 'ファイルを転送するプロトコル', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ポート番号の説明として正しいものはどれか。', 'ポート番号はネットワーク通信において、通信先のアプリケーションやサービスを識別するための番号です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '通信先のアプリケーションやサービスを識別する番号', true, 1),
(v_q_id, 'ネットワーク機器の物理的な接続口', false, 2),
(v_q_id, 'IPアドレスの別名', false, 3),
(v_q_id, 'ルーターの設定番号', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'FTPの役割として正しいものはどれか。', 'FTP（File Transfer Protocol）はネットワーク上でファイルを転送するためのプロトコルです。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ファイルを転送するプロトコル', true, 1),
(v_q_id, 'Webページを表示するプロトコル', false, 2),
(v_q_id, 'メールを送信するプロトコル', false, 3),
(v_q_id, '暗号通信を行うプロトコル', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'Bluetooth の説明として正しいものはどれか。', 'Bluetoothは近距離の機器間を無線で接続する短距離無線通信規格です。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '近距離の機器間を無線で接続する通信規格', true, 1),
(v_q_id, '高速な有線通信規格', false, 2),
(v_q_id, '長距離通信用の衛星通信規格', false, 3),
(v_q_id, 'インターネット接続のプロトコル', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'プロキシサーバーの説明として正しいものはどれか。', 'プロキシサーバーはクライアントの代理としてインターネットにアクセスし、通信を中継するサーバーです。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'クライアントの代理でインターネット通信を中継するサーバー', true, 1),
(v_q_id, 'Webサイトのコンテンツを公開するサーバー', false, 2),
(v_q_id, 'メールの送受信を行うサーバー', false, 3),
(v_q_id, 'データベースを管理するサーバー', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'IPアドレスのバージョンであるIPv4とIPv6の違いとして正しいものはどれか。', 'IPv4は32ビット、IPv6は128ビットのアドレス空間を持ち、IPv6の方がはるかに多くのアドレスを使用できます。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'IPv4は32ビット、IPv6は128ビットのアドレス空間を持つ', true, 1),
(v_q_id, 'IPv4は128ビット、IPv6は32ビットのアドレス空間を持つ', false, 2),
(v_q_id, 'IPv4とIPv6のアドレス空間は同じ', false, 3),
(v_q_id, 'IPv6はIPv4の2倍のアドレス空間を持つ', false, 4);

END $$;

-- ============================================
-- Quiz 12: ネットワーク 基本情報 テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('ネットワーク 基本情報 テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'OSI参照モデルの第3層（ネットワーク層）の役割として正しいものはどれか。', 'ネットワーク層はIPアドレスを基にしたルーティング（経路制御）を担当します。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'IPアドレスによるルーティング（経路制御）', true, 1),
(v_q_id, 'データの暗号化と復号', false, 2),
(v_q_id, '物理的な電気信号の伝送', false, 3),
(v_q_id, 'アプリケーション間のデータ交換', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'TCPとUDPの違いとして正しいものはどれか。', 'TCPはコネクション型で信頼性が高く、UDPはコネクションレス型で高速だが信頼性は低いです。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'TCPはコネクション型で信頼性が高く、UDPはコネクションレス型で高速', true, 1),
(v_q_id, 'UDPはコネクション型で信頼性が高く、TCPはコネクションレス型で高速', false, 2),
(v_q_id, '両方ともコネクション型である', false, 3),
(v_q_id, '両方ともコネクションレス型である', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'サブネットマスクの役割として正しいものはどれか。', 'サブネットマスクはIPアドレスのネットワーク部とホスト部を区別するために使われます。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'IPアドレスのネットワーク部とホスト部を区別する', true, 1),
(v_q_id, 'ドメイン名をIPアドレスに変換する', false, 2),
(v_q_id, 'データを暗号化する', false, 3),
(v_q_id, 'ネットワークの通信速度を制御する', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'TCP/IPの3ウェイハンドシェイクの手順として正しいものはどれか。', '3ウェイハンドシェイクはSYN→SYN+ACK→ACKの順でコネクションを確立します。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'SYN → SYN+ACK → ACK', true, 1),
(v_q_id, 'ACK → SYN → SYN+ACK', false, 2),
(v_q_id, 'SYN → ACK → SYN+ACK', false, 3),
(v_q_id, 'FIN → ACK → FIN+ACK', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'NAT（Network Address Translation）の説明として正しいものはどれか。', 'NATはプライベートIPアドレスとグローバルIPアドレスを相互に変換する技術です。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'プライベートIPとグローバルIPを相互に変換する技術', true, 1),
(v_q_id, 'ドメイン名とIPアドレスを変換する技術', false, 2),
(v_q_id, 'データを暗号化する技術', false, 3),
(v_q_id, 'ネットワークの帯域制御を行う技術', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'CIDR表記 192.168.1.0/24 において、使用可能なホストアドレス数はどれか。', '/24はネットワーク部が24ビット、ホスト部が8ビットです。2^8-2=254（ネットワークアドレスとブロードキャストを除く）。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '254', true, 1),
(v_q_id, '256', false, 2),
(v_q_id, '255', false, 3),
(v_q_id, '128', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ARPの役割として正しいものはどれか。', 'ARP（Address Resolution Protocol）はIPアドレスからMACアドレスを解決するプロトコルです。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'IPアドレスからMACアドレスを解決する', true, 1),
(v_q_id, 'MACアドレスからIPアドレスを解決する', false, 2),
(v_q_id, 'ドメイン名からIPアドレスを解決する', false, 3),
(v_q_id, 'ポート番号を解決する', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'OSI参照モデルの第4層（トランスポート層）の役割として正しいものはどれか。', 'トランスポート層はTCPやUDPが動作する層で、エンドツーエンドの信頼性のある通信を提供します。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'エンドツーエンドの信頼性のある通信を提供する', true, 1),
(v_q_id, '物理的な電気信号の伝送を行う', false, 2),
(v_q_id, 'IPアドレスによるルーティングを行う', false, 3),
(v_q_id, 'データの表現形式を変換する', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'VLAN（Virtual LAN）の目的として正しいものはどれか。', 'VLANは物理的なネットワーク構成に関係なく、論理的にネットワークを分割する技術です。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '論理的にネットワークを分割する', true, 1),
(v_q_id, 'ネットワークの通信速度を向上させる', false, 2),
(v_q_id, 'ネットワーク上のデータを暗号化する', false, 3),
(v_q_id, 'ネットワーク機器を仮想化する', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ロードバランサーの役割として正しいものはどれか。', 'ロードバランサーは複数のサーバーにリクエストを分散し、負荷を均等にする装置です。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '複数のサーバーにリクエストを分散して負荷を均等にする', true, 1),
(v_q_id, 'ネットワークのトラフィックを監視する', false, 2),
(v_q_id, '不正アクセスを検知して遮断する', false, 3),
(v_q_id, 'データをキャッシュして高速化する', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ICMPの説明として正しいものはどれか。', 'ICMP（Internet Control Message Protocol）はネットワークの診断や制御メッセージの送受信に使われるプロトコルで、pingコマンドに使用されます。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ネットワーク診断やエラー通知に使われるプロトコル', true, 1),
(v_q_id, 'メールを送信するプロトコル', false, 2),
(v_q_id, 'ファイルを転送するプロトコル', false, 3),
(v_q_id, 'ドメイン名を解決するプロトコル', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'TLS/SSLの役割として正しいものはどれか。', 'TLS/SSLは通信を暗号化して盗聴や改ざんを防ぐセキュリティプロトコルで、HTTPSの基盤です。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '通信を暗号化して盗聴や改ざんを防ぐ', true, 1),
(v_q_id, 'IPアドレスを動的に割り当てる', false, 2),
(v_q_id, 'ドメイン名を解決する', false, 3),
(v_q_id, 'メールを転送する', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'OSI参照モデルの層数はいくつか。', 'OSI参照モデルは物理層、データリンク層、ネットワーク層、トランスポート層、セッション層、プレゼンテーション層、アプリケーション層の7層です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '7層', true, 1),
(v_q_id, '4層', false, 2),
(v_q_id, '5層', false, 3),
(v_q_id, '6層', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ルーティングプロトコルのOSPFの特徴として正しいものはどれか。', 'OSPF（Open Shortest Path First）はリンクステート型のルーティングプロトコルで、ダイクストラ法で最短経路を計算します。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'リンクステート型で最短経路を計算するプロトコル', true, 1),
(v_q_id, 'ディスタンスベクタ型のプロトコル', false, 2),
(v_q_id, 'アプリケーション層で動作するプロトコル', false, 3),
(v_q_id, 'データを暗号化するプロトコル', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'QoS（Quality of Service）の目的として正しいものはどれか。', 'QoSはネットワーク上の通信品質を保証するために、帯域幅の制御や優先制御を行う技術です。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ネットワーク上の通信品質を保証するために帯域・優先制御を行う', true, 1),
(v_q_id, 'ネットワークのセキュリティを強化する', false, 2),
(v_q_id, 'ネットワーク機器の障害を検知する', false, 3),
(v_q_id, 'ネットワークの物理構成を管理する', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'DNSラウンドロビンの説明として正しいものはどれか。', 'DNSラウンドロビンは1つのドメイン名に複数のIPアドレスを関連付け、問い合わせのたびに異なるIPを返すことで負荷を分散する手法です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1つのドメイン名に複数のIPを関連付け問い合わせごとに異なるIPを返す', true, 1),
(v_q_id, '複数のドメイン名を1つのIPアドレスに関連付ける', false, 2),
(v_q_id, 'DNSのキャッシュを定期的にクリアする仕組み', false, 3),
(v_q_id, 'DNSサーバーを冗長化する仕組み', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SDN（Software Defined Networking）の説明として正しいものはどれか。', 'SDNはネットワークの制御をソフトウェアで集中管理し、柔軟なネットワーク構成を実現する技術です。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ネットワーク制御をソフトウェアで集中管理する技術', true, 1),
(v_q_id, 'ハードウェアでネットワークを制御する従来型の手法', false, 2),
(v_q_id, 'ネットワーク機器のファームウェアを自動更新する技術', false, 3),
(v_q_id, 'ネットワークの通信速度を自動調整する技術', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'TCPのフロー制御の目的として正しいものはどれか。', 'フロー制御は送信側のデータ送信速度を受信側の処理能力に合わせて調整し、受信バッファの溢れを防ぐ仕組みです。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '送信速度を受信側の処理能力に合わせて調整する', true, 1),
(v_q_id, 'データの暗号化を行う', false, 2),
(v_q_id, 'ルーティングの最適化を行う', false, 3),
(v_q_id, 'IPアドレスの割り当てを行う', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'HTTPのステータスコード404が示す意味はどれか。', 'HTTPステータスコード404はリクエストしたリソースがサーバー上に見つからないことを示します。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'リソースが見つからない（Not Found）', true, 1),
(v_q_id, 'サーバー内部エラー', false, 2),
(v_q_id, '認証が必要', false, 3),
(v_q_id, 'リクエスト成功', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'WebSocketの特徴として正しいものはどれか。', 'WebSocketはHTTPとは異なり、クライアントとサーバー間で双方向のリアルタイム通信を維持できるプロトコルです。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'クライアントとサーバー間で双方向リアルタイム通信ができる', true, 1),
(v_q_id, 'サーバーからクライアントへの一方向通信のみ', false, 2),
(v_q_id, 'リクエスト・レスポンス型の通信のみ', false, 3),
(v_q_id, 'ファイル転送専用のプロトコル', false, 4);

END $$;

-- ============================================
-- Quiz 13: セキュリティ ITパスポート テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('セキュリティ ITパスポート テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '情報セキュリティの3要素（CIA）に含まれないものはどれか。', '情報セキュリティの3要素は機密性（Confidentiality）、完全性（Integrity）、可用性（Availability）です。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '効率性', true, 1),
(v_q_id, '機密性', false, 2),
(v_q_id, '完全性', false, 3),
(v_q_id, '可用性', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'マルウェアの説明として正しいものはどれか。', 'マルウェアはコンピュータに害を与える悪意のあるソフトウェアの総称で、ウイルス、ワーム、トロイの木馬などが含まれます。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'コンピュータに害を与える悪意のあるソフトウェアの総称', true, 1),
(v_q_id, 'セキュリティ対策ソフトの総称', false, 2),
(v_q_id, 'ネットワーク機器の一種', false, 3),
(v_q_id, '暗号化技術の一種', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'フィッシング攻撃の説明として正しいものはどれか。', 'フィッシングは偽のWebサイトやメールを使って、パスワードや個人情報を騙し取る攻撃手法です。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '偽のWebサイトやメールで個人情報を騙し取る攻撃', true, 1),
(v_q_id, 'ネットワークに大量のデータを送りつける攻撃', false, 2),
(v_q_id, 'ソフトウェアの脆弱性を悪用する攻撃', false, 3),
(v_q_id, '物理的にコンピュータを破壊する攻撃', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ファイアウォールの役割として正しいものはどれか。', 'ファイアウォールはネットワークの境界に設置し、許可されていない通信を遮断してネットワークを保護する装置です。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '許可されていない通信を遮断してネットワークを保護する', true, 1),
(v_q_id, 'ウイルスを検出して駆除する', false, 2),
(v_q_id, 'データをバックアップする', false, 3),
(v_q_id, 'ネットワーク速度を向上させる', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'パスワードの管理方法として最も適切なものはどれか。', 'パスワードは複雑で長いものを設定し、サービスごとに異なるパスワードを使用することが推奨されます。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'サービスごとに異なる複雑なパスワードを使用する', true, 1),
(v_q_id, '覚えやすいように全サービスで同じパスワードを使用する', false, 2),
(v_q_id, '短くて覚えやすいパスワードを設定する', false, 3),
(v_q_id, 'パスワードをパソコンの画面に付箋で貼っておく', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '暗号化の説明として正しいものはどれか。', '暗号化はデータを第三者に読めない形式に変換し、情報の機密性を保護する技術です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'データを第三者に読めない形式に変換する技術', true, 1),
(v_q_id, 'データを圧縮して容量を減らす技術', false, 2),
(v_q_id, 'データのバックアップを作成する技術', false, 3),
(v_q_id, 'データの検索速度を向上させる技術', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ソーシャルエンジニアリングの説明として正しいものはどれか。', 'ソーシャルエンジニアリングは技術的手段ではなく、人間の心理的な弱点を利用して情報を不正に入手する手法です。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '人間の心理的弱点を利用して情報を不正入手する手法', true, 1),
(v_q_id, 'ソフトウェアの脆弱性を攻撃する手法', false, 2),
(v_q_id, 'ネットワークの盗聴を行う手法', false, 3),
(v_q_id, 'データを暗号化する手法', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ランサムウェアの説明として正しいものはどれか。', 'ランサムウェアはファイルを暗号化して使用不能にし、復号と引き換えに身代金を要求するマルウェアです。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ファイルを暗号化し身代金を要求するマルウェア', true, 1),
(v_q_id, 'ウイルスを検出するソフトウェア', false, 2),
(v_q_id, 'データを自動でバックアップするソフトウェア', false, 3),
(v_q_id, 'ネットワークの速度を低下させるマルウェア', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '二要素認証の説明として正しいものはどれか。', '二要素認証は「知識」「所有」「生体」の3つの認証要素のうち、2つを組み合わせて認証を行う方式です。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '2つの異なる認証要素を組み合わせて認証する方式', true, 1),
(v_q_id, 'パスワードを2回入力する方式', false, 2),
(v_q_id, '2人の管理者が同時に承認する方式', false, 3),
(v_q_id, '2つのデバイスで同時にログインする方式', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ウイルス対策ソフトの機能として正しいものはどれか。', 'ウイルス対策ソフトはマルウェアの検出・隔離・駆除を行い、コンピュータを保護するソフトウェアです。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'マルウェアの検出・隔離・駆除を行う', true, 1),
(v_q_id, 'ネットワークの通信速度を向上させる', false, 2),
(v_q_id, 'ファイルの圧縮・解凍を行う', false, 3),
(v_q_id, 'メールの自動送受信を行う', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '個人情報保護法の目的として正しいものはどれか。', '個人情報保護法は個人の権利利益を保護するため、個人情報の適切な取り扱いに関するルールを定めた法律です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '個人情報の適切な取り扱いルールを定め権利利益を保護する', true, 1),
(v_q_id, 'コンピュータウイルスを規制する', false, 2),
(v_q_id, 'インターネットの利用を制限する', false, 3),
(v_q_id, 'ソフトウェアの著作権を保護する', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'DDoS攻撃の説明として正しいものはどれか。', 'DDoS攻撃は多数のコンピュータから同時に大量のリクエストを送り、サービスを利用不能にする攻撃です。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '多数のコンピュータから大量のリクエストを送りサービスを停止させる攻撃', true, 1),
(v_q_id, '偽のWebサイトで個人情報を盗む攻撃', false, 2),
(v_q_id, 'ソフトウェアの脆弱性を悪用する攻撃', false, 3),
(v_q_id, 'USBメモリでウイルスを感染させる攻撃', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'バイオメトリクス認証の例として正しいものはどれか。', 'バイオメトリクス認証は指紋、虹彩、顔などの身体的特徴を使って本人確認を行う認証方式です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '指紋認証', true, 1),
(v_q_id, 'パスワード認証', false, 2),
(v_q_id, 'ICカード認証', false, 3),
(v_q_id, 'ワンタイムパスワード', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'スパムメールの説明として正しいものはどれか。', 'スパムメールは受信者の同意なく大量に送信される迷惑メールです。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '受信者の同意なく大量に送信される迷惑メール', true, 1),
(v_q_id, 'ウイルスに感染したメール', false, 2),
(v_q_id, '暗号化されたメール', false, 3),
(v_q_id, '電子署名付きのメール', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '情報セキュリティポリシーの説明として正しいものはどれか。', '情報セキュリティポリシーは組織における情報セキュリティに関する基本方針や対策基準を定めた文書です。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '組織の情報セキュリティに関する基本方針を定めた文書', true, 1),
(v_q_id, 'ウイルス対策ソフトの設定ファイル', false, 2),
(v_q_id, 'ネットワークの構成図', false, 3),
(v_q_id, 'パスワードの一覧表', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SSLサーバー証明書の役割として正しいものはどれか。', 'SSLサーバー証明書はWebサイトの運営者の実在性を証明し、暗号化通信を可能にする電子証明書です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'Webサイト運営者の実在性を証明し暗号化通信を可能にする', true, 1),
(v_q_id, 'ウイルスを検出する', false, 2),
(v_q_id, 'パスワードを管理する', false, 3),
(v_q_id, 'ファイルのバックアップを取る', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '不正アクセス禁止法で禁止されている行為はどれか。', '不正アクセス禁止法は他人のID・パスワードを無断で使用したり、セキュリティの脆弱性を突いて侵入する行為を禁じています。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '他人のID・パスワードを無断で使用してシステムに侵入する行為', true, 1),
(v_q_id, '自分のパスワードを変更する行為', false, 2),
(v_q_id, '公開されているWebサイトを閲覧する行為', false, 3),
(v_q_id, 'メールを送受信する行為', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'トロイの木馬の説明として正しいものはどれか。', 'トロイの木馬は有用なプログラムに見せかけて、裏で不正な動作を行うマルウェアです。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '有用なプログラムに見せかけて不正な動作を行うマルウェア', true, 1),
(v_q_id, '自己複製して他のコンピュータに感染するマルウェア', false, 2),
(v_q_id, 'ファイルを暗号化して身代金を要求するマルウェア', false, 3),
(v_q_id, '広告を強制的に表示するマルウェア', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'アクセス権の設定の目的として正しいものはどれか。', 'アクセス権の設定はユーザーごとに利用可能な機能やデータを制限し、不正なアクセスを防止することです。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ユーザーごとに利用可能な機能やデータを制限する', true, 1),
(v_q_id, 'すべてのユーザーに同じ権限を付与する', false, 2),
(v_q_id, 'データの転送速度を向上させる', false, 3),
(v_q_id, 'プログラムの実行速度を向上させる', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'セキュリティパッチの説明として正しいものはどれか。', 'セキュリティパッチはソフトウェアの脆弱性を修正するための更新プログラムです。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ソフトウェアの脆弱性を修正する更新プログラム', true, 1),
(v_q_id, 'ウイルス対策ソフトの名称', false, 2),
(v_q_id, 'データの暗号化ツール', false, 3),
(v_q_id, 'ネットワーク監視ツール', false, 4);

END $$;

-- ============================================
-- Quiz 14: セキュリティ 基本情報 テスト (20 questions × 5 points)
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('セキュリティ 基本情報 テスト', 'cs_knowledge', 60, 30, false)
RETURNING id INTO v_quiz_id;

-- Q1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '共通鍵暗号方式の特徴として正しいものはどれか。', '共通鍵暗号方式は暗号化と復号に同じ鍵を使用する方式で、処理速度が速いですが鍵の配送が課題です。', 5, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '暗号化と復号に同じ鍵を使用する', true, 1),
(v_q_id, '暗号化と復号に異なる鍵を使用する', false, 2),
(v_q_id, '鍵を使用せずにデータを暗号化する', false, 3),
(v_q_id, '公開鍵で暗号化し秘密鍵で復号する', false, 4);

-- Q2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '公開鍵暗号方式の特徴として正しいものはどれか。', '公開鍵暗号方式は暗号化用の公開鍵と復号用の秘密鍵のペアを使用し、鍵の配送問題を解決します。', 5, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '暗号化と復号に異なる鍵のペアを使用する', true, 1),
(v_q_id, '暗号化と復号に同じ鍵を使用する', false, 2),
(v_q_id, '鍵を使用しない暗号方式', false, 3),
(v_q_id, '常に共通鍵より高速に処理できる', false, 4);

-- Q3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'デジタル署名の目的として正しいものはどれか。', 'デジタル署名は送信者の本人確認（認証）とデータが改ざんされていないこと（完全性）を保証します。', 5, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '送信者の認証とデータの改ざん検知', true, 1),
(v_q_id, 'データの暗号化', false, 2),
(v_q_id, 'データの圧縮', false, 3),
(v_q_id, 'ネットワーク速度の向上', false, 4);

-- Q4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ハッシュ関数の特徴として正しいものはどれか。', 'ハッシュ関数は任意長のデータから固定長のハッシュ値を生成し、元のデータを復元できない一方向性を持ちます。', 5, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '固定長の値を生成し元のデータに戻せない一方向性を持つ', true, 1),
(v_q_id, 'ハッシュ値から元のデータを復元できる', false, 2),
(v_q_id, 'データを暗号化・復号する', false, 3),
(v_q_id, '入力データの長さに応じて出力長が変わる', false, 4);

-- Q5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SQLインジェクション攻撃の説明として正しいものはどれか。', 'SQLインジェクションはWebアプリケーションの入力欄に不正なSQL文を挿入して、データベースを不正に操作する攻撃です。', 5, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '入力欄に不正なSQL文を挿入してデータベースを不正操作する攻撃', true, 1),
(v_q_id, 'ネットワークに大量のデータを送りつける攻撃', false, 2),
(v_q_id, 'パスワードを総当たりで試す攻撃', false, 3),
(v_q_id, '偽のWebサイトに誘導する攻撃', false, 4);

-- Q6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'クロスサイトスクリプティング（XSS）の説明として正しいものはどれか。', 'XSSはWebサイトに悪意のあるスクリプトを埋め込み、利用者のブラウザ上で不正なスクリプトを実行させる攻撃です。', 5, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'Webサイトに悪意のあるスクリプトを埋め込みブラウザ上で実行させる攻撃', true, 1),
(v_q_id, 'サーバーに不正なSQLを送信する攻撃', false, 2),
(v_q_id, 'ネットワーク盗聴を行う攻撃', false, 3),
(v_q_id, 'ファイルを暗号化して身代金を要求する攻撃', false, 4);

-- Q7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'PKI（公開鍵基盤）の説明として正しいものはどれか。', 'PKIは公開鍵暗号方式を基盤として、認証局（CA）が公開鍵の正当性を証明する仕組みです。', 5, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '認証局が公開鍵の正当性を証明する仕組み', true, 1),
(v_q_id, '共通鍵を安全に配送する仕組み', false, 2),
(v_q_id, 'ファイアウォールを管理する仕組み', false, 3),
(v_q_id, 'ウイルスを検知する仕組み', false, 4);

-- Q8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ブルートフォース攻撃の説明として正しいものはどれか。', 'ブルートフォース攻撃はパスワードの全ての組み合わせを試行して正解を見つける総当たり攻撃です。', 5, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'パスワードの全組み合わせを試す総当たり攻撃', true, 1),
(v_q_id, '辞書に載っている単語だけを試す攻撃', false, 2),
(v_q_id, 'ネットワークを盗聴する攻撃', false, 3),
(v_q_id, '偽のWebサイトに誘導する攻撃', false, 4);

-- Q9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'IDS（侵入検知システム）の説明として正しいものはどれか。', 'IDSはネットワークやシステムへの不正アクセスを検知し、管理者に通知するシステムです。', 5, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '不正アクセスを検知して管理者に通知するシステム', true, 1),
(v_q_id, '不正アクセスを検知して自動的に遮断するシステム', false, 2),
(v_q_id, 'ウイルスを検出して駆除するシステム', false, 3),
(v_q_id, 'データを暗号化するシステム', false, 4);

-- Q10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'IPS（侵入防止システム）がIDSと異なる点はどれか。', 'IPSはIDSの機能に加えて、不正な通信を自動的に遮断する機能を持ちます。', 5, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '不正な通信を検知するだけでなく自動的に遮断する', true, 1),
(v_q_id, '検知のみで遮断は行わない', false, 2),
(v_q_id, 'ウイルス対策機能がある', false, 3),
(v_q_id, 'データの暗号化機能がある', false, 4);

-- Q11
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'CSRF（クロスサイトリクエストフォージェリ）の説明として正しいものはどれか。', 'CSRFはログイン済みの利用者に意図しないリクエストを送信させ、不正な操作を実行させる攻撃です。', 5, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ログイン済みの利用者に意図しないリクエストを送信させる攻撃', true, 1),
(v_q_id, 'Webサイトにスクリプトを埋め込む攻撃', false, 2),
(v_q_id, '不正なSQL文を入力する攻撃', false, 3),
(v_q_id, 'パスワードを総当たりで試す攻撃', false, 4);

-- Q12
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'AES暗号の特徴として正しいものはどれか。', 'AES（Advanced Encryption Standard）は米国政府標準の共通鍵暗号方式で、128/192/256ビットの鍵長を使用します。', 5, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '米国政府標準の共通鍵暗号方式', true, 1),
(v_q_id, '公開鍵暗号方式', false, 2),
(v_q_id, 'ハッシュ関数', false, 3),
(v_q_id, 'デジタル署名専用のアルゴリズム', false, 4);

-- Q13
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'RSA暗号の特徴として正しいものはどれか。', 'RSAは大きな素数の積の素因数分解が困難であることを安全性の根拠とする公開鍵暗号方式です。', 5, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '素因数分解の困難さに基づく公開鍵暗号方式', true, 1),
(v_q_id, '共通鍵暗号方式', false, 2),
(v_q_id, 'ハッシュ関数', false, 3),
(v_q_id, 'ストリーム暗号方式', false, 4);

-- Q14
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ペネトレーションテストの説明として正しいものはどれか。', 'ペネトレーションテストは実際の攻撃手法を模擬してシステムの脆弱性を検証するセキュリティテストです。', 5, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '実際の攻撃手法を模擬してシステムの脆弱性を検証するテスト', true, 1),
(v_q_id, 'プログラムの機能をテストする手法', false, 2),
(v_q_id, 'ネットワーク速度を測定するテスト', false, 3),
(v_q_id, 'ハードウェアの耐久性をテストする手法', false, 4);

-- Q15
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'WAF（Web Application Firewall）の説明として正しいものはどれか。', 'WAFはWebアプリケーション特有の攻撃（SQLインジェクション、XSS等）を検知・防御するファイアウォールです。', 5, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'Webアプリケーション特有の攻撃を検知・防御するファイアウォール', true, 1),
(v_q_id, 'ネットワーク層の通信を制御するファイアウォール', false, 2),
(v_q_id, 'メールのスパムを検出するフィルタ', false, 3),
(v_q_id, 'ウイルスを検出するソフトウェア', false, 4);

-- Q16
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ゼロデイ攻撃の説明として正しいものはどれか。', 'ゼロデイ攻撃は脆弱性が発見されてから修正パッチが提供される前に、その脆弱性を悪用する攻撃です。', 5, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '修正パッチ提供前に脆弱性を悪用する攻撃', true, 1),
(v_q_id, '0時ちょうどに実行される攻撃', false, 2),
(v_q_id, '検出率が0%の攻撃', false, 3),
(v_q_id, '被害額が0円の攻撃', false, 4);

-- Q17
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SSL/TLSにおけるハイブリッド暗号方式の説明として正しいものはどれか。', 'ハイブリッド暗号方式は公開鍵暗号で共通鍵を安全に交換し、実際のデータは高速な共通鍵暗号で暗号化します。', 5, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '公開鍵暗号で鍵を交換し共通鍵暗号でデータを暗号化する', true, 1),
(v_q_id, '公開鍵暗号のみでデータを暗号化する', false, 2),
(v_q_id, '共通鍵暗号のみでデータを暗号化する', false, 3),
(v_q_id, 'ハッシュ関数でデータを暗号化する', false, 4);

-- Q18
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ISMS（情報セキュリティマネジメントシステム）の国際規格はどれか。', 'ISMSの国際規格はISO/IEC 27001で、組織の情報セキュリティ管理体制を認証する規格です。', 5, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ISO/IEC 27001', true, 1),
(v_q_id, 'ISO 9001', false, 2),
(v_q_id, 'ISO 14001', false, 3),
(v_q_id, 'ISO/IEC 20000', false, 4);

-- Q19
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'セッションハイジャックの説明として正しいものはどれか。', 'セッションハイジャックは正規ユーザーのセッションIDを盗み取り、そのユーザーになりすまして不正にシステムを利用する攻撃です。', 5, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'セッションIDを盗み取りユーザーになりすます攻撃', true, 1),
(v_q_id, 'セッション中の通信を暗号化する技術', false, 2),
(v_q_id, 'セッションの有効時間を延長する技術', false, 3),
(v_q_id, 'セッションのログを記録する技術', false, 4);

-- Q20
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'バッファオーバーフロー攻撃の説明として正しいものはどれか。', 'バッファオーバーフロー攻撃はプログラムのバッファ領域を超えるデータを送り込み、不正なコードを実行させる攻撃です。', 5, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'バッファ領域を超えるデータを送り不正なコードを実行させる攻撃', true, 1),
(v_q_id, 'バッファの容量を縮小する攻撃', false, 2),
(v_q_id, 'ネットワークのバッファを消費する攻撃', false, 3),
(v_q_id, 'バッファ内のデータを暗号化する攻撃', false, 4);

END $$;

-- ============================================
-- Quiz 15: CS知識 ITパスポート 総合テスト (25 questions × 4 points)
-- Mix of all 7 categories at IP level
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('CS知識 ITパスポート 総合テスト', 'cs_knowledge', 60, 60, false)
RETURNING id INTO v_quiz_id;

-- Q1 (基礎理論)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2進数の「110」を10進数に変換すると正しいものはどれか。', '110(2) = 1×4 + 1×2 + 0×1 = 6 です。', 4, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '6', true, 1),
(v_q_id, '5', false, 2),
(v_q_id, '7', false, 3),
(v_q_id, '8', false, 4);

-- Q2 (基礎理論)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '1キロバイト（KB）は何バイトか。', '1KB = 1024バイトです（2の10乗）。', 4, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '1024バイト', true, 1),
(v_q_id, '1000バイト', false, 2),
(v_q_id, '512バイト', false, 3),
(v_q_id, '2048バイト', false, 4);

-- Q3 (基礎理論)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'NAND回路は何と何の組み合わせで構成されるか。', 'NAND回路はAND回路の出力をNOTで反転した回路です。', 4, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'AND + NOT', true, 1),
(v_q_id, 'OR + NOT', false, 2),
(v_q_id, 'XOR + NOT', false, 3),
(v_q_id, 'AND + OR', false, 4);

-- Q4 (アルゴリズム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'データを先頭から順に比較して探す手法を何というか。', '線形探索（リニアサーチ）はデータを先頭から一つずつ順に調べます。', 4, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '線形探索', true, 1),
(v_q_id, '2分探索', false, 2),
(v_q_id, 'ハッシュ探索', false, 3),
(v_q_id, '深さ優先探索', false, 4);

-- Q5 (アルゴリズム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'データを半分ずつ絞り込んで探す手法を何というか。', '2分探索（バイナリサーチ）はデータの中央値と比較して探索範囲を半分に絞ります。', 4, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '2分探索', true, 1),
(v_q_id, '線形探索', false, 2),
(v_q_id, 'バブルソート', false, 3),
(v_q_id, '選択ソート', false, 4);

-- Q6 (アルゴリズム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'フローチャートにおいて、入出力を表す図形はどれか。', 'フローチャートでは平行四辺形が入出力（データの読み込み・書き出し）を表します。', 4, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '平行四辺形', true, 1),
(v_q_id, 'ひし形', false, 2),
(v_q_id, '長方形', false, 3),
(v_q_id, '楕円', false, 4);

-- Q7 (データ構造)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'FIFO方式で動作するデータ構造はどれか。', 'FIFO（First In, First Out：先入れ先出し）はキューの特徴です。', 4, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'キュー', true, 1),
(v_q_id, 'スタック', false, 2),
(v_q_id, '木構造', false, 3),
(v_q_id, 'ハッシュテーブル', false, 4);

-- Q8 (データ構造)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '配列の特徴として正しいものはどれか。', '配列はインデックスを使って要素に直接アクセスできるため、ランダムアクセスが高速です。', 4, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'インデックスによるランダムアクセスが高速', true, 1),
(v_q_id, '要素の挿入・削除が高速', false, 2),
(v_q_id, '要素数を後から自由に変更できる', false, 3),
(v_q_id, '各要素が異なるデータ型を持てる', false, 4);

-- Q9 (データ構造)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '木構造で親ノードの上にある最上位のノードを何というか。', '木構造の最上位のノードはルート（根）です。', 4, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ルート', true, 1),
(v_q_id, 'リーフ', false, 2),
(v_q_id, 'ブランチ', false, 3),
(v_q_id, 'エッジ', false, 4);

-- Q10 (コンピュータシステム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'プログラムの命令を解釈して実行するコンピュータの中心部品は何か。', 'CPU（中央処理装置）がプログラムの命令を解釈し実行します。', 4, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'CPU', true, 1),
(v_q_id, 'メモリ', false, 2),
(v_q_id, 'HDD', false, 3),
(v_q_id, 'GPU', false, 4);

-- Q11 (コンピュータシステム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '電源を切るとデータが消えるメモリの種類はどれか。', 'RAM（Random Access Memory）は揮発性メモリで、電源を切るとデータが消えます。', 4, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'RAM', true, 1),
(v_q_id, 'ROM', false, 2),
(v_q_id, 'SSD', false, 3),
(v_q_id, 'HDD', false, 4);

-- Q12 (コンピュータシステム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'OSの機能として最も適切なものはどれか。', 'OSはハードウェアとアプリケーションの仲介をし、資源（CPU、メモリ等）を管理します。', 4, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ハードウェア資源の管理とアプリケーションの実行制御', true, 1),
(v_q_id, '表計算やワープロの機能を提供する', false, 2),
(v_q_id, 'ウイルスの検出と駆除を行う', false, 3),
(v_q_id, 'Webサイトを閲覧する', false, 4);

-- Q13 (データベース)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SQLでデータを取得するために使用する命令はどれか。', 'SELECT文はデータベースからデータを検索・取得するSQL命令です。', 4, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'SELECT', true, 1),
(v_q_id, 'INSERT', false, 2),
(v_q_id, 'UPDATE', false, 3),
(v_q_id, 'DELETE', false, 4);

-- Q14 (データベース)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'テーブルの各行を一意に識別するための列を何というか。', '主キー（プライマリキー）はテーブルの各行を一意に識別します。', 4, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '主キー（プライマリキー）', true, 1),
(v_q_id, '外部キー（フォーリンキー）', false, 2),
(v_q_id, 'インデックス', false, 3),
(v_q_id, 'ビュー', false, 4);

-- Q15 (データベース)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'データベースで複数の操作をひとまとまりとして扱う処理単位を何というか。', 'トランザクションは一連のDB操作をまとめて、全成功または全取消を保証する処理単位です。', 4, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'トランザクション', true, 1),
(v_q_id, 'インデックス', false, 2),
(v_q_id, 'ビュー', false, 3),
(v_q_id, 'スキーマ', false, 4);

-- Q16 (ネットワーク)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ドメイン名をIPアドレスに変換する仕組みを何というか。', 'DNS（Domain Name System）がドメイン名をIPアドレスに変換します。', 4, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'DNS', true, 1),
(v_q_id, 'DHCP', false, 2),
(v_q_id, 'HTTP', false, 3),
(v_q_id, 'FTP', false, 4);

-- Q17 (ネットワーク)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'メールの送信に使用されるプロトコルはどれか。', 'SMTP（Simple Mail Transfer Protocol）がメールの送信に使われます。', 4, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'SMTP', true, 1),
(v_q_id, 'POP3', false, 2),
(v_q_id, 'HTTP', false, 3),
(v_q_id, 'FTP', false, 4);

-- Q18 (ネットワーク)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'HTTPSの「S」が意味するものはどれか。', 'HTTPSのSは「Secure」で、SSL/TLSによる暗号化通信を示します。', 4, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'Secure（安全な）', true, 1),
(v_q_id, 'Speed（高速な）', false, 2),
(v_q_id, 'Simple（簡単な）', false, 3),
(v_q_id, 'Standard（標準的な）', false, 4);

-- Q19 (ネットワーク)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'IPアドレスを自動的に割り当てるプロトコルはどれか。', 'DHCP（Dynamic Host Configuration Protocol）がIPアドレスを自動的に割り当てます。', 4, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'DHCP', true, 1),
(v_q_id, 'DNS', false, 2),
(v_q_id, 'ARP', false, 3),
(v_q_id, 'NAT', false, 4);

-- Q20 (セキュリティ)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '情報セキュリティにおける「機密性」の説明として正しいものはどれか。', '機密性は許可された人だけが情報にアクセスできることを保証する性質です。', 4, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '許可された人だけが情報にアクセスできること', true, 1),
(v_q_id, '情報が正確で改ざんされていないこと', false, 2),
(v_q_id, '必要なときに情報を利用できること', false, 3),
(v_q_id, '誰が情報にアクセスしたか記録すること', false, 4);

-- Q21 (セキュリティ)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ネットワーク上の不正な通信を遮断する装置は何か。', 'ファイアウォールは許可されていない通信を遮断してネットワークを保護します。', 4, 21)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ファイアウォール', true, 1),
(v_q_id, 'ルーター', false, 2),
(v_q_id, 'スイッチングハブ', false, 3),
(v_q_id, 'モデム', false, 4);

-- Q22 (セキュリティ)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'パスワードと指紋認証を組み合わせた認証方式を何というか。', '異なる種類の認証要素（知識と生体）を組み合わせるので二要素認証です。', 4, 22)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '二要素認証', true, 1),
(v_q_id, 'シングルサインオン', false, 2),
(v_q_id, 'ワンタイムパスワード', false, 3),
(v_q_id, 'リスクベース認証', false, 4);

-- Q23 (セキュリティ)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ファイルを暗号化して身代金を要求するマルウェアを何というか。', 'ランサムウェアはファイルを暗号化し、復号のための金銭を要求するマルウェアです。', 4, 23)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ランサムウェア', true, 1),
(v_q_id, 'スパイウェア', false, 2),
(v_q_id, 'アドウェア', false, 3),
(v_q_id, 'ワーム', false, 4);

-- Q24 (コンピュータシステム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'SSDがHDDと比べて優れている点として正しいものはどれか。', 'SSDはフラッシュメモリを使い、物理的な駆動部品がないため読み書きが高速で衝撃にも強いです。', 4, 24)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '読み書きが高速で衝撃に強い', true, 1),
(v_q_id, '容量あたりの価格が安い', false, 2),
(v_q_id, '書き換え回数に制限がない', false, 3),
(v_q_id, 'データの長期保存に適している', false, 4);

-- Q25 (アルゴリズム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '隣り合う要素を比較・交換して並べ替えるソートアルゴリズムはどれか。', 'バブルソートは隣接する要素を比較して交換を繰り返すソートアルゴリズムです。', 4, 25)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'バブルソート', true, 1),
(v_q_id, '選択ソート', false, 2),
(v_q_id, '挿入ソート', false, 3),
(v_q_id, 'クイックソート', false, 4);

END $$;

-- ============================================
-- Quiz 16: CS知識 基本情報 総合テスト (25 questions × 4 points)
-- Mix of all 7 categories at FE level
-- ============================================
DO $$
DECLARE
  v_quiz_id UUID;
  v_q_id UUID;
BEGIN

INSERT INTO quizzes (title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('CS知識 基本情報 総合テスト', 'cs_knowledge', 60, 60, false)
RETURNING id INTO v_quiz_id;

-- Q1 (基礎理論)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '8ビットの2の補数表現で -1 を表すビット列はどれか。', '-1の2の補数表現は全ビットが1の 11111111 です。', 4, 1)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '11111111', true, 1),
(v_q_id, '10000001', false, 2),
(v_q_id, '00000001', false, 3),
(v_q_id, '11111110', false, 4);

-- Q2 (基礎理論)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '浮動小数点数の演算で、ほぼ等しい数の引き算により有効桁数が減る現象を何というか。', 'けた落ちは、ほぼ等しい2つの数の差を計算したとき有効桁数が大幅に減少する現象です。', 4, 2)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'けた落ち', true, 1),
(v_q_id, '丸め誤差', false, 2),
(v_q_id, 'オーバーフロー', false, 3),
(v_q_id, 'アンダーフロー', false, 4);

-- Q3 (基礎理論)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ド・モルガンの法則 ¬(A∨B) の等価な式はどれか。', 'ド・モルガンの法則より ¬(A∨B) = ¬A∧¬B です。', 4, 3)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '¬A∧¬B', true, 1),
(v_q_id, '¬A∨¬B', false, 2),
(v_q_id, 'A∧B', false, 3),
(v_q_id, 'A∨B', false, 4);

-- Q4 (アルゴリズム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'クイックソートの平均的な時間計算量はどれか。', 'クイックソートの平均時間計算量はO(n log n)です。', 4, 4)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'O(n log n)', true, 1),
(v_q_id, 'O(n²)', false, 2),
(v_q_id, 'O(n)', false, 3),
(v_q_id, 'O(log n)', false, 4);

-- Q5 (アルゴリズム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '重み付きグラフの始点から各頂点への最短経路を求めるアルゴリズムはどれか。', 'ダイクストラ法は重み付きグラフで始点から最短経路を求めるアルゴリズムです。', 4, 5)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ダイクストラ法', true, 1),
(v_q_id, 'クラスカル法', false, 2),
(v_q_id, 'プリム法', false, 3),
(v_q_id, 'ベルマンフォード法', false, 4);

-- Q6 (アルゴリズム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '部分問題の結果を記憶して再利用する手法を何というか。', '動的計画法（DP）は部分問題の結果を保存して再利用することで効率的に問題を解きます。', 4, 6)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '動的計画法', true, 1),
(v_q_id, '分割統治法', false, 2),
(v_q_id, '貪欲法', false, 3),
(v_q_id, 'バックトラッキング', false, 4);

-- Q7 (データ構造)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '2分探索木を中順走査（in-order traversal）した結果の特徴はどれか。', '2分探索木を中順走査するとノードの値が昇順に出力されます。', 4, 7)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ノードの値が昇順に出力される', true, 1),
(v_q_id, 'ノードの値が降順に出力される', false, 2),
(v_q_id, 'ルートが最初に出力される', false, 3),
(v_q_id, 'リーフが最初に出力される', false, 4);

-- Q8 (データ構造)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ハッシュテーブルで異なるキーが同じハッシュ値になることを何というか。', '異なるキーが同じハッシュ値を持つことを衝突（コリジョン）と呼びます。', 4, 8)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '衝突（コリジョン）', true, 1),
(v_q_id, 'オーバーフロー', false, 2),
(v_q_id, 'デッドロック', false, 3),
(v_q_id, 'フラグメンテーション', false, 4);

-- Q9 (データ構造)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ヒープの特徴として正しいものはどれか。', 'ヒープは親ノードが子ノード以上（最大ヒープ）または以下（最小ヒープ）の値を持つ完全2分木です。', 4, 9)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '親の値が子の値以上（または以下）の完全2分木', true, 1),
(v_q_id, '左の子が常に右の子より小さい2分木', false, 2),
(v_q_id, '全てのリーフが同じ深さにある木', false, 3),
(v_q_id, '各ノードが最大3つの子を持つ木', false, 4);

-- Q10 (コンピュータシステム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'CPUと主記憶装置の速度差を埋める高速な小容量メモリを何というか。', 'キャッシュメモリはCPUと主記憶装置の速度差を埋めるために使われます。', 4, 10)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'キャッシュメモリ', true, 1),
(v_q_id, 'レジスタ', false, 2),
(v_q_id, 'ROM', false, 3),
(v_q_id, '仮想メモリ', false, 4);

-- Q11 (コンピュータシステム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '複数のプロセスが互いの資源を待ち合い進行できない状態を何というか。', 'デッドロックは複数のプロセスが互いに相手の資源を待ち合い、進行不能になる状態です。', 4, 11)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'デッドロック', true, 1),
(v_q_id, 'スラッシング', false, 2),
(v_q_id, 'スタベーション', false, 3),
(v_q_id, 'ライブロック', false, 4);

-- Q12 (コンピュータシステム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '仮想記憶でページの入れ替えが頻発して性能が低下する現象を何というか。', 'スラッシングはページフォールトが頻発し、ページ入れ替えに大半の時間を費やす現象です。', 4, 12)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'スラッシング', true, 1),
(v_q_id, 'デッドロック', false, 2),
(v_q_id, 'フラグメンテーション', false, 3),
(v_q_id, 'ボトルネック', false, 4);

-- Q13 (コンピュータシステム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'RAID5で使われるデータ保護の仕組みはどれか。', 'RAID5はパリティ情報を複数のディスクに分散配置して、1台の故障に耐えます。', 4, 13)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '分散パリティ', true, 1),
(v_q_id, 'ミラーリング', false, 2),
(v_q_id, 'ストライピングのみ', false, 3),
(v_q_id, '二重書き込み', false, 4);

-- Q14 (データベース)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '正規化で第2正規形にするために排除すべきものはどれか。', '第2正規形にするためには部分関数従属を排除する必要があります。', 4, 14)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '部分関数従属', true, 1),
(v_q_id, '推移的関数従属', false, 2),
(v_q_id, '繰り返し属性', false, 3),
(v_q_id, '候補キーの重複', false, 4);

-- Q15 (データベース)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'ACID特性の「持続性（Durability）」の説明として正しいものはどれか。', '持続性はコミットされたトランザクションの結果は障害が発生しても失われないことを保証する性質です。', 4, 15)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'コミット後のデータは障害発生後も失われない', true, 1),
(v_q_id, 'トランザクションの操作がすべて成功かすべて失敗になる', false, 2),
(v_q_id, 'トランザクション前後でデータの整合性が保たれる', false, 3),
(v_q_id, '複数のトランザクションが互いに影響しない', false, 4);

-- Q16 (データベース)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '関係代数で条件に合う行のみを取り出す演算を何というか。', '選択演算は条件に合うタプル（行）のみを取り出す関係代数の演算です。', 4, 16)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '選択', true, 1),
(v_q_id, '射影', false, 2),
(v_q_id, '結合', false, 3),
(v_q_id, '除算', false, 4);

-- Q17 (ネットワーク)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'TCP/IPで接続確立に使われる3ウェイハンドシェイクの正しい順序はどれか。', '3ウェイハンドシェイクはSYN→SYN+ACK→ACKの順で行われます。', 4, 17)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'SYN → SYN+ACK → ACK', true, 1),
(v_q_id, 'ACK → SYN → SYN+ACK', false, 2),
(v_q_id, 'SYN → ACK → SYN', false, 3),
(v_q_id, 'FIN → ACK → FIN', false, 4);

-- Q18 (ネットワーク)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'IPアドレスからMACアドレスを解決するプロトコルはどれか。', 'ARP（Address Resolution Protocol）がIPアドレスからMACアドレスを解決します。', 4, 18)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ARP', true, 1),
(v_q_id, 'RARP', false, 2),
(v_q_id, 'ICMP', false, 3),
(v_q_id, 'IGMP', false, 4);

-- Q19 (ネットワーク)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'OSI参照モデルの第3層はどれか。', 'OSI参照モデルの第3層はネットワーク層で、IPアドレスによるルーティングを担当します。', 4, 19)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ネットワーク層', true, 1),
(v_q_id, 'データリンク層', false, 2),
(v_q_id, 'トランスポート層', false, 3),
(v_q_id, 'セッション層', false, 4);

-- Q20 (セキュリティ)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '暗号化と復号に異なる鍵のペアを使用する暗号方式を何というか。', '公開鍵暗号方式は暗号化用の公開鍵と復号用の秘密鍵のペアを使います。', 4, 20)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '公開鍵暗号方式', true, 1),
(v_q_id, '共通鍵暗号方式', false, 2),
(v_q_id, 'ハッシュ関数', false, 3),
(v_q_id, 'ストリーム暗号', false, 4);

-- Q21 (セキュリティ)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'Webアプリケーションの入力欄に不正なSQL文を挿入する攻撃を何というか。', 'SQLインジェクションは入力欄に不正なSQL文を挿入してデータベースを不正操作する攻撃です。', 4, 21)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'SQLインジェクション', true, 1),
(v_q_id, 'クロスサイトスクリプティング', false, 2),
(v_q_id, 'バッファオーバーフロー', false, 3),
(v_q_id, 'ディレクトリトラバーサル', false, 4);

-- Q22 (セキュリティ)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '固定長のハッシュ値を生成し、元のデータに戻せない一方向性を持つ関数を何というか。', 'ハッシュ関数は任意長データから固定長のハッシュ値を生成し、一方向性を持ちます。', 4, 22)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ハッシュ関数', true, 1),
(v_q_id, '暗号化関数', false, 2),
(v_q_id, '圧縮関数', false, 3),
(v_q_id, '認証関数', false, 4);

-- Q23 (セキュリティ)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '脆弱性が修正される前に悪用される攻撃を何というか。', 'ゼロデイ攻撃は脆弱性の修正パッチが提供される前にその脆弱性を悪用する攻撃です。', 4, 23)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'ゼロデイ攻撃', true, 1),
(v_q_id, 'ブルートフォース攻撃', false, 2),
(v_q_id, '辞書攻撃', false, 3),
(v_q_id, 'リプレイ攻撃', false, 4);

-- Q24 (データベース)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', 'B+木インデックスの利点として正しいものはどれか。', 'B+木はリーフノードがリンクで繋がっているため、範囲検索が効率的に行えます。', 4, 24)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, 'リーフがリンクで繋がり範囲検索が効率的', true, 1),
(v_q_id, 'ハッシュ値による高速な等値検索のみ', false, 2),
(v_q_id, 'メモリ上でのみ使用可能', false, 3),
(v_q_id, '挿入時のバランス調整が不要', false, 4);

-- Q25 (アルゴリズム)
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, sort_order)
VALUES (v_quiz_id, 'multiple_choice', '同じ値の要素の元の順序がソート後も保たれるソートの性質を何というか。', '安定ソートは同じ値を持つ要素の相対的な順序がソート前後で変わらない性質です。', 4, 25)
RETURNING id INTO v_q_id;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
(v_q_id, '安定ソート', true, 1),
(v_q_id, 'インプレースソート', false, 2),
(v_q_id, '比較ソート', false, 3),
(v_q_id, '外部ソート', false, 4);

END $$;
