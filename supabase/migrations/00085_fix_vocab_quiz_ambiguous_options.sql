-- Fix ambiguous quiz options in JLPT vocabulary quizzes (N2/N1)
-- 22 questions where wrong answer options were synonyms of the correct answer
-- Replace with semantically distinct (often antonymous) alternatives

BEGIN;

-- ============================================
-- Critical: Nearly identical synonyms (10 questions)
-- ============================================

-- Q150001: 影響する (영향을 미치다)
UPDATE quiz_question_options SET option_text = '반영하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000150001' AND option_text = '영향을 끼치다';
UPDATE quiz_question_options SET option_text = '작용하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000150001' AND option_text = '영향을 주다';
UPDATE quiz_question_options SET option_text = '감동하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000150001' AND option_text = '영향을 받다';

-- Q160002: 素晴らしい (훌륭하다)
UPDATE quiz_question_options SET option_text = '평범하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160002' AND option_text = '멋지다';
UPDATE quiz_question_options SET option_text = '부족하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160002' AND option_text = '훌륭한';
UPDATE quiz_question_options SET option_text = '어리석다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160002' AND option_text = '우수하다';

-- Q160005: 適切 (적절하다)
UPDATE quiz_question_options SET option_text = '불충분하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160005' AND option_text = '적합하다';
UPDATE quiz_question_options SET option_text = '과도하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160005' AND option_text = '적당하다';
UPDATE quiz_question_options SET option_text = '부적절하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160005' AND option_text = '적정하다';

-- Q160006: 明確 (명확하다)
UPDATE quiz_question_options SET option_text = '모호하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160006' AND option_text = '명백하다';
UPDATE quiz_question_options SET option_text = '불분명하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160006' AND option_text = '명료하다';
UPDATE quiz_question_options SET option_text = '암묵적이다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160006' AND option_text = '명시적이다';

-- Q170007: 促す (촉구하다)
UPDATE quiz_question_options SET option_text = '거부하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170007' AND option_text = '재촉하다';
UPDATE quiz_question_options SET option_text = '저지하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170007' AND option_text = '독촉하다';
UPDATE quiz_question_options SET option_text = '양보하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170007' AND option_text = '요구하다';

-- Q170009: 補う (보충하다)
UPDATE quiz_question_options SET option_text = '제거하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170009' AND option_text = '보완하다';
UPDATE quiz_question_options SET option_text = '삭감하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170009' AND option_text = '보장하다';
UPDATE quiz_question_options SET option_text = '방치하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170009' AND option_text = '보호하다';

-- Q180004: 顕著 (현저하다)
UPDATE quiz_question_options SET option_text = '미미하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180004' AND option_text = '현저하게';
UPDATE quiz_question_options SET option_text = '불명확하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180004' AND option_text = '현저한';
UPDATE quiz_question_options SET option_text = '사소하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180004' AND option_text = '현저히';

-- Q180006: 緻密 (치밀하다)
UPDATE quiz_question_options SET option_text = '대충이다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180006' AND option_text = '정밀하다';
UPDATE quiz_question_options SET option_text = '거칠다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180006' AND option_text = '세밀하다';
UPDATE quiz_question_options SET option_text = '산만하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180006' AND option_text = '밀집하다';

-- Q180008: 過酷 (가혹하다)
UPDATE quiz_question_options SET option_text = '온화하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180008' AND option_text = '혹독하다';
UPDATE quiz_question_options SET option_text = '관대하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180008' AND option_text = '엄격하다';
UPDATE quiz_question_options SET option_text = '느긋하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180008' AND option_text = '엄중하다';

-- Q180010: 不可欠 (불가결하다)
UPDATE quiz_question_options SET option_text = '불필요하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180010' AND option_text = '필수적이다';
UPDATE quiz_question_options SET option_text = '사소하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180010' AND option_text = '필요하다';
UPDATE quiz_question_options SET option_text = '무관하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180010' AND option_text = '중요하다';

-- ============================================
-- High: Semantically close, confusing (12 questions)
-- ============================================

-- Q160001: 厳しい (엄격하다)
UPDATE quiz_question_options SET option_text = '부드럽다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160001' AND option_text = '엄중하다';
UPDATE quiz_question_options SET option_text = '가볍다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160001' AND option_text = '엄숙하다';
UPDATE quiz_question_options SET option_text = '느슨하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160001' AND option_text = '엄밀하다';

-- Q160004: 有効 (유효하다)
UPDATE quiz_question_options SET option_text = '무효이다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160004' AND option_text = '효과적이다';
UPDATE quiz_question_options SET option_text = '비효율적이다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160004' AND option_text = '효율적이다';
UPDATE quiz_question_options SET option_text = '쓸모없다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160004' AND option_text = '유용하다';

-- Q160007: 効率的 (효율적이다)
UPDATE quiz_question_options SET option_text = '비경제적이다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160007' AND option_text = '효과적이다';
UPDATE quiz_question_options SET option_text = '낭비적이다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160007' AND option_text = '유효하다';
UPDATE quiz_question_options SET option_text = '무용하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000160007' AND option_text = '유용하다';

-- Q170002: 遂げる (이루다)
UPDATE quiz_question_options SET option_text = '포기하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170002' AND option_text = '이루어내다';
UPDATE quiz_question_options SET option_text = '실패하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170002' AND option_text = '이루어지다';
UPDATE quiz_question_options SET option_text = '중단하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170002' AND option_text = '이루어가다';

-- Q170004: 妨げる (방해하다)
UPDATE quiz_question_options SET option_text = '돕다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170004' AND option_text = '저지하다';
UPDATE quiz_question_options SET option_text = '허용하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170004' AND option_text = '막다';
UPDATE quiz_question_options SET option_text = '개방하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170004' AND option_text = '차단하다';

-- Q170006: 免れる (면하다)
UPDATE quiz_question_options SET option_text = '직면하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170006' AND option_text = '피하다';
UPDATE quiz_question_options SET option_text = '감수하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170006' AND option_text = '회피하다';
UPDATE quiz_question_options SET option_text = '대면하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170006' AND option_text = '도피하다';

-- Q170010: 踏まえる (근거하다)
UPDATE quiz_question_options SET option_text = '무시하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170010' AND option_text = '기반하다';
UPDATE quiz_question_options SET option_text = '간과하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170010' AND option_text = '기초하다';
UPDATE quiz_question_options SET option_text = '경시하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000170010' AND option_text = '근본하다';

-- Q180001: 甚だしい (심하다)
UPDATE quiz_question_options SET option_text = '사소하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180001' AND option_text = '심각하다';
UPDATE quiz_question_options SET option_text = '가볍다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180001' AND option_text = '심각하게';
UPDATE quiz_question_options SET option_text = '미미하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180001' AND option_text = '심각한';

-- Q180003: 紛らわしい (헷갈리다)
UPDATE quiz_question_options SET option_text = '분명하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180003' AND option_text = '혼란스럽다';
UPDATE quiz_question_options SET option_text = '구별하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180003' AND option_text = '혼동하다';
UPDATE quiz_question_options SET option_text = '명쾌하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180003' AND option_text = '혼란하다';

-- Q180007: 繊細 (섬세하다)
UPDATE quiz_question_options SET option_text = '투박하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180007' AND option_text = '세밀하다';
UPDATE quiz_question_options SET option_text = '대범하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180007' AND option_text = '정밀하다';
UPDATE quiz_question_options SET option_text = '둔감하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180007' AND option_text = '미세하다';

-- Q180009: 厳密 (엄밀하다)
UPDATE quiz_question_options SET option_text = '대략적이다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180009' AND option_text = '정확하다';
UPDATE quiz_question_options SET option_text = '모호하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180009' AND option_text = '정밀하다';
UPDATE quiz_question_options SET option_text = '부정확하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000180009' AND option_text = '정확하게';

-- Q150010: 認める (인정하다)
UPDATE quiz_question_options SET option_text = '부정하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000150010' AND option_text = '승인하다';
UPDATE quiz_question_options SET option_text = '무시하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000150010' AND option_text = '확인하다';
UPDATE quiz_question_options SET option_text = '간과하다'
  WHERE question_id = 'b0000001-0000-4000-a000-000000150010' AND option_text = '인식하다';

COMMIT;
