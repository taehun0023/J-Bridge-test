-- N1 Set1 수정 10건 (반드시수정 5 + 수정권장 5)
-- 적용 대상: 로컬 + 테스트 DB 공통 (q_id/opt_id 동일)
BEGIN;

-- [13] 정답 快く → 心地よく
-- 風の感触表現に快く(=快く引き受ける의 부사)는 부자연스럽고 心地よく가 적절
UPDATE quiz_question_options
SET option_text = '心地よく'
WHERE id = 'd860a0a3-fc94-4fbe-91fa-02099d0f5a7b';

-- [16] 정답 縁起の悪い → 不快で思い出したくない
-- 忌まわしい = 불길함+혐오+떠올리기 싫음. 縁起の悪い만으론 너무 좁음
UPDATE quiz_question_options
SET option_text = '不快で思い出したくない'
WHERE id = '2ee5e701-36c2-40e2-a97c-a12e0bae3b04';

-- [26] 문장 변경: にして(정답)에 맞는 자연스러운 문장 → だけあって 문장으로 교체
-- 天才にして+驚いた보다 天才だけあって+当然의 방향이 더 자연스러움
UPDATE quiz_questions
SET question_text = '天才__________、この問題を易々と解いてしまうのも当然かもしれない。'
WHERE id = '4b98fb77-631f-4675-8e69-46a6a6dd82cb';

UPDATE quiz_question_options
SET option_text = 'だけあって'
WHERE id = '09e53304-1396-40b2-9637-b83ef863a52b';

-- [28] 문장 변경: 想像にかたくない가 정답으로 명확해지도록
-- "悲しみは…想像を絶する도 가능" 문제 → "沈んだことは想像にかたくない" 로 정답 고정
UPDATE quiz_questions
SET question_text = '彼が深い悲しみに沈んだことは、__________。'
WHERE id = '3f92efc6-7a13-4b69-85ec-6530d1e37e42';

-- [29] 오답 にあわせて → にかかわらず
-- に即して(기준 준수)와 にあわせて(조정)는 혼동 가능 → 완전히 다른 にかかわらず로 교체
UPDATE quiz_question_options
SET option_text = 'にかかわらず'
WHERE id = 'f399542f-183e-4eda-b086-fcd4bcb82118';

-- [31] 오답 からすると → にもかかわらず
-- にしてみれば와 からすると가 거의 동의어 → 명확히 다른 にもかかわらず로 교체
UPDATE quiz_question_options
SET option_text = 'にもかかわらず'
WHERE id = 'a5f925b9-629d-4011-b716-5c12277f1fa3';

-- [35] 오답 をおして → をものにして
-- をおして(무릅쓰고)도 悪天候에 자연스럽게 성립 → をものにして(자기 것으로 만들다)로 교체
UPDATE quiz_question_options
SET option_text = 'をものにして'
WHERE id = '6ce4e829-6e82-4bef-9cd7-00d1080ee128';

-- [39] 誠実な態度 → 誠実な人柄
-- 信頼を寄せる의 주체는 人柄 쪽이 더 자연스러움
UPDATE quiz_questions
SET question_text = replace(question_text, '誠実な態度', '誠実な人柄')
WHERE id = '2db7d958-4b9f-4f3d-8f07-8818381d757e';

-- [88] 정답 교체: 表沙汰にならないよう(은폐 뉘앙스) → 사내 대처로 중립화
UPDATE quiz_question_options
SET option_text = '承知しました。当面は社内で対処いたします。'
WHERE id = '2be795e5-66ee-4992-880c-4378046ad0ee';

-- [96] 말장난 오답 2개 → N1급으로 교체
UPDATE quiz_question_options
SET option_text = 'それは困りましたね。専門家に相談されてみてはいかがですか。'
WHERE id = '767c8d6d-fdb3-4b03-9fe7-4dde5f2d5d93';

UPDATE quiz_question_options
SET option_text = '少し休んでみれば、うまく解決するかもしれませんよ。'
WHERE id = 'f9878111-7d7f-47ba-a6e0-488bdc5295f3';

COMMIT;
