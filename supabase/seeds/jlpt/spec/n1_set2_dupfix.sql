-- encoding: UTF-8
-- set2 WORD_USAGE 중복 회피 → set1/set2 어디에도 없는 「網羅」로 교체
UPDATE quiz_questions
SET question_text = E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「網羅」',
    explanation = '「網羅（もうら）」は「関係するものを一つ残らず取り入れること」を意味する。情報・項目・範囲などをもれなく含む文脈が正しい使い方。'
WHERE id = 'aee20022-0000-0000-0000-000000000002';

DELETE FROM quiz_question_options WHERE question_id = 'aee20022-0000-0000-0000-000000000002';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20022-0000-0000-0000-000000000002', 'この事典は当該分野の重要な専門用語をほぼ網羅している。', true, 1),
('aee20022-0000-0000-0000-000000000002', '彼は会議の間ずっと網羅していて、一言も発しなかった。', false, 2),
('aee20022-0000-0000-0000-000000000002', '突然の大雨に網羅されて、予定の行事は中止となった。', false, 3),
('aee20022-0000-0000-0000-000000000002', '提出期限を網羅できず、担当者から注意を受けた。', false, 4);
