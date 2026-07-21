\encoding UTF8
SELECT email, full_name, role, is_onboarded, onboarding_step
FROM profiles
WHERE full_name LIKE '%規鎭%' OR full_name LIKE '%ギュジン%' OR email ILIKE '%gyujin%' OR email ILIKE '%kyujin%' OR email ILIKE '%lee%';
