-- 品詞(part_of_speech) 한글 → 일본어 표준값 정규화
-- 목적: 어휘 品詞 드롭다운에 한글이 노출되던 문제 근본 수정 + 動詞/名詞 중복 병합 + 불량값(忸怩たる) 정정
-- 적용: psql -f (UTF-8). 데이터 변경(UPDATE)만, DDL 없음.

BEGIN;

UPDATE jlpt_vocabulary SET part_of_speech='代名詞'            WHERE part_of_speech='대명사';
UPDATE jlpt_vocabulary SET part_of_speech='動詞'              WHERE part_of_speech='동사';
UPDATE jlpt_vocabulary SET part_of_speech='名詞'              WHERE part_of_speech='명사';
UPDATE jlpt_vocabulary SET part_of_speech='名詞・四字熟語'    WHERE part_of_speech='명사・사자성어';
UPDATE jlpt_vocabulary SET part_of_speech='名詞・形容動詞'    WHERE part_of_speech='명사・형용동사';
UPDATE jlpt_vocabulary SET part_of_speech='名詞・する動詞'    WHERE part_of_speech='명사・する동사';
UPDATE jlpt_vocabulary SET part_of_speech='名詞・な形容詞'    WHERE part_of_speech='명사・な형용사';
UPDATE jlpt_vocabulary SET part_of_speech='複合語'            WHERE part_of_speech='복합어';
UPDATE jlpt_vocabulary SET part_of_speech='副詞'              WHERE part_of_speech='부사';
UPDATE jlpt_vocabulary SET part_of_speech='副詞・な形容詞'    WHERE part_of_speech='부사・な형용사';
UPDATE jlpt_vocabulary SET part_of_speech='連体詞'            WHERE part_of_speech='연체사';
UPDATE jlpt_vocabulary SET part_of_speech='接頭辞'            WHERE part_of_speech='접두사';
UPDATE jlpt_vocabulary SET part_of_speech='接尾辞'            WHERE part_of_speech='접미사';
UPDATE jlpt_vocabulary SET part_of_speech='接続副詞'          WHERE part_of_speech='접속부사';
UPDATE jlpt_vocabulary SET part_of_speech='接続詞'            WHERE part_of_speech='접속사';
UPDATE jlpt_vocabulary SET part_of_speech='表現'              WHERE part_of_speech='표현';
UPDATE jlpt_vocabulary SET part_of_speech='形容動詞・四字熟語' WHERE part_of_speech='형용동사・사자성어';
UPDATE jlpt_vocabulary SET part_of_speech='形容詞'            WHERE part_of_speech='형용사';
UPDATE jlpt_vocabulary SET part_of_speech='い形容詞'          WHERE part_of_speech='い형용사';
UPDATE jlpt_vocabulary SET part_of_speech='な形容詞'          WHERE part_of_speech='な형용사';
UPDATE jlpt_vocabulary SET part_of_speech='な形容詞・四字熟語' WHERE part_of_speech='な형용사・사자성어';
UPDATE jlpt_vocabulary SET part_of_speech='な形容詞'          WHERE part_of_speech='な형용사(忸怩たる)';

COMMIT;

\echo === 정규화 후 part_of_speech 분포 (한글 0 확인) ===
SELECT part_of_speech, count(*) AS n
FROM jlpt_vocabulary
GROUP BY part_of_speech
ORDER BY part_of_speech;
