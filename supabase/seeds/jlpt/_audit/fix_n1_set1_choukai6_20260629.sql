-- N1 Set1 청해 수정 6건 (87/88/90/91/92/97)
BEGIN;

-- [87] question_text에 企画案 추가 (상황 구체화)
UPDATE quiz_questions
SET question_text = replace(question_text,
  'ご意見をいただければ幸いです。',
  'この企画案について、ご意見をいただければ幸いです。')
WHERE id = 'edc20845-368e-45c5-b217-6924ad542265';

-- [88-opt1] 内々に処理するのは規則に反しませんか → では、関係部署すべてに共有しておきます。
UPDATE quiz_question_options
SET option_text = 'では、関係部署すべてに共有しておきます。'
WHERE id = '571076b3-f827-4d19-bb5a-b5da31b30a11';

-- [88-opt2] では、社内全体に周知しておきますね → すぐに社外にも公表したほうがよろしいでしょうか。
UPDATE quiz_question_options
SET option_text = 'すぐに社外にも公表したほうがよろしいでしょうか。'
WHERE id = 'f132d715-ffa3-4199-9cae-2afdbff84206';

-- [88-opt4★] 当面は社内で対処いたします → 関係者の範囲に留めて慎重に対応いたします。
UPDATE quiz_question_options
SET option_text = '承知しました。関係者の範囲に留めて慎重に対応いたします。'
WHERE id = '2be795e5-66ee-4992-880c-4378046ad0ee';

-- [90-opt1] こちらこそ、来ていただいて助かりました → こちらこそ、お越しいただき助かりました。(경어 교정)
UPDATE quiz_question_options
SET option_text = 'こちらこそ、お越しいただき助かりました。'
WHERE id = 'b1ba66f6-8bee-41c4-b44a-92792b5a7633';

-- [90-opt2] 말장난 제거: いいえ、足はそれほど疲れておりません → いえ、こちらに伺う予定はございませんでした。
UPDATE quiz_question_options
SET option_text = 'いえ、こちらに伺う予定はございませんでした。'
WHERE id = '378b4b80-d09b-4a7b-a09c-6f8f84e1dbbd';

-- [90-opt3] 遠方からいらっしゃる必要はありませんでした → それでは、また改めてお越しください。
UPDATE quiz_question_options
SET option_text = 'それでは、また改めてお越しください。'
WHERE id = 'a564d9ca-b7fe-4de7-b079-378d952e773d';

-- [91-opt2] いいえ、至って普通の要求だと思いますが → そうですね、こちらの条件を一切変えずに押し通しましょう。
UPDATE quiz_question_options
SET option_text = 'そうですね、こちらの条件を一切変えずに押し通しましょう。'
WHERE id = '1fd2ba85-0c94-4426-8c92-35a35e7869ac';

-- [91-opt3] では、すべてお断りしましょう → では、先方の意向をそのまま受け入れる方向で進めましょう。
UPDATE quiz_question_options
SET option_text = 'では、先方の意向をそのまま受け入れる方向で進めましょう。'
WHERE id = '59c6cc82-1377-4d8a-a038-d5496a4898b0';

-- [91-opt4] そうですね、全部受け入れましょう → いいえ、先方にも事情があるので、特に調整は不要でしょう。
UPDATE quiz_question_options
SET option_text = 'いいえ、先方にも事情があるので、特に調整は不要でしょう。'
WHERE id = '15c9a5da-2cb0-4d09-bf13-573dbf983d86';

-- [92-opt1] そうでしたか、私はまったく気づきませんでした → では、しばらく様子を見てから対応しましょう。
UPDATE quiz_question_options
SET option_text = 'では、しばらく様子を見てから対応しましょう。'
WHERE id = 'e7332db5-bcb3-42d6-8b4c-7f70caceacb5';

-- [92-opt3] お客様はいつもそうなんですよ → まずは担当者間で経緯を整理するだけで十分でしょう。
UPDATE quiz_question_options
SET option_text = 'まずは担当者間で経緯を整理するだけで十分でしょう。'
WHERE id = '19b69eb5-c5c9-436f-a80d-59163c8ae10c';

-- [92-opt4] まあ、そのうちお気持ちも落ち着かれるでしょう → まあ、こちらに非があるとは限りませんからね。
UPDATE quiz_question_options
SET option_text = 'まあ、こちらに非があるとは限りませんからね。'
WHERE id = 'c94204d6-ba8e-45fd-831e-702e1b49fd96';

-- [97-opt2] 根回しは必要ないと思いますが → はい、正式な議事録はまだ作成していません。
UPDATE quiz_question_options
SET option_text = 'はい、正式な議事録はまだ作成していません。'
WHERE id = 'b5d99d93-6082-45f4-a6ce-8bab8eba4e31';

-- [97-opt3] 根回しについては、まだ理解が浅くて… → いいえ、まだ一部の関係者には確認できていません。
UPDATE quiz_question_options
SET option_text = 'いいえ、まだ一部の関係者には確認できていません。'
WHERE id = '33f3e1ee-1316-487c-800a-9a42210473d8';

-- [97-opt4] いいえ、まだ時間はたっぷりありますので → そうですね、決定してから説明すれば十分だと思います。
UPDATE quiz_question_options
SET option_text = 'そうですね、決定してから説明すれば十分だと思います。'
WHERE id = '90fc4896-c1bb-4db2-bc11-0ae5e479a83f';

COMMIT;
