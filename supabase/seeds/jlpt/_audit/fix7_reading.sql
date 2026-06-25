-- 전수검토 7차: 모의고사 독해 2건 (ChatGPT #233, #249)
-- #233 set3 SHORT_READING グリーンウォッシング: 보기2가 정답(보기3)과 의미 중복 → 명확한 오답으로 교체 (정답 보기3 유지)
UPDATE quiz_question_options SET option_text='環境保護のために事業規模を大幅に縮小する経営判断。'
WHERE question_id='dad30003-0000-0000-0000-000000000003' AND sort_order=2;

-- #249 set3 INTEGRATED_READING(述べられていない問題点): 보기4가 問題点이 아닌 対策(범주 혼재) → 文章B에 언급된 問題点으로 교체 (정답=보기2 비용, 유지)
UPDATE quiz_question_options SET option_text='AIが既存の組織文化や価値観を強化・固定化してしまうリスク。'
WHERE question_id='dad30019-0000-0000-0000-000000000003' AND sort_order=4;
