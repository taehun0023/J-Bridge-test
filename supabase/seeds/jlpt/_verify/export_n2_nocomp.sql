\a
\t on
\pset footer off

\o C:/Users/dyjun/AppData/Local/Temp/claude/C--workspace-J-Bridge-test/07eb97bd-a1ff-4608-aef9-2b60e236bb62/scratchpad/n2_reading_nocomp.txt
SELECT E'===ID:'||id||E'\n===TITLE:'||title||E'\n'||passage||E'\n===END==='
FROM jlpt_reading_passages
WHERE jlpt_level='N2' AND (comprehension IS NULL OR NOT (comprehension ? 'question'))
ORDER BY seq;

\o C:/Users/dyjun/AppData/Local/Temp/claude/C--workspace-J-Bridge-test/07eb97bd-a1ff-4608-aef9-2b60e236bb62/scratchpad/n2_listening_nocomp.txt
SELECT E'===ID:'||id||E'\n===TITLE:'||title||E'\n===SITUATION:'||coalesce(situation,'')||E'\n'||script||E'\n===END==='
FROM jlpt_listening_scripts
WHERE jlpt_level='N2' AND (comprehension IS NULL OR NOT (comprehension ? 'question'))
ORDER BY seq;

\o
