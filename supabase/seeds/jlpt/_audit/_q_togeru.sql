\echo '== 遂げる 위치 =='
SELECT word, reading, jlpt_level, part_of_speech, seq FROM jlpt_vocabulary WHERE word='遂げる';
\echo '== 교차중복 정리됐던 단어 몇 개 현재 레벨 =='
SELECT word, jlpt_level FROM jlpt_vocabulary WHERE word IN ('覆す','促す','免れる','妨げる','怠る') ORDER BY word;
