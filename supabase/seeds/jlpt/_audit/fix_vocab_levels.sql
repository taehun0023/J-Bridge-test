-- fix_vocab_levels.sql
-- encoding: UTF-8
-- 목적: level_check_words.txt(41개) 단어의 JLPT 레벨을 jisho.org 사전 태그로 검증·교정
-- 검증일: 2026-06-26
-- 출처: jisho.org "Common word JLPT Nx" 태그 직접 확인
-- 규칙: 사전 레벨 ≠ 현재 레벨인 경우만 UPDATE. 사전에 JLPT 태그 없으면 건드리지 않음.
--
-- 주의: 일부 단어(乏しい/著しい 등)는 DB에 N2+N3 두 행이 있음.
--       이 파일은 N2 행을 교정 대상으로 함(N2 우선 규칙으로 잘못 배정된 행).

\set ON_ERROR_STOP on
BEGIN;

-- ================================================================
-- [1] N2 → N1 교정 (jisho.org 확인 결과 N1 태그)
-- 출처 URL 형식: https://jisho.org/search/<URL인코딩단어>
-- ================================================================

-- 乏しい (とぼしい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E4%B9%8F%E3%81%97%E3%81%84
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='乏しい' AND jlpt_level='N2';

-- 予め (あらかじめ) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E4%BA%88%E3%82%81
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='予め' AND jlpt_level='N2';

-- 仕組み (しくみ) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E4%BB%95%E7%B5%84%E3%81%BF
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='仕組み' AND jlpt_level='N2';

-- 伴う (ともなう) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E4%BC%B4%E3%81%86
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='伴う' AND jlpt_level='N2';

-- 促進 (そくしん) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E4%BF%83%E9%80%B2
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='促進' AND jlpt_level='N2';

-- 偏見 (へんけん) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E5%81%8F%E8%A6%8B
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='偏見' AND jlpt_level='N2';

-- 前提 (ぜんてい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E5%89%8D%E6%8F%90
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='前提' AND jlpt_level='N2';

-- 動向 (どうこう) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E5%8B%95%E5%90%91
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='動向' AND jlpt_level='N2';

-- 好ましい (このましい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E5%A5%BD%E3%81%BE%E3%81%97%E3%81%84
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='好ましい' AND jlpt_level='N2';

-- 実態 (じったい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E5%AE%9F%E6%85%8B
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='実態' AND jlpt_level='N2';

-- 心強い (こころづよい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E5%BF%83%E5%BC%B7%E3%81%84
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='心強い' AND jlpt_level='N2';

-- 把握 (はあく) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E6%8A%8A%E6%8F%A1
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='把握' AND jlpt_level='N2';

-- 措置 (そち) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E6%8E%AA%E7%BD%AE
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='措置' AND jlpt_level='N2';

-- 望ましい (のぞましい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E6%9C%9B%E3%81%BE%E3%81%97%E3%81%84
-- 주: DB에 N2+N3 두 행 존재. N2 행을 N1로 교정.
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='望ましい' AND jlpt_level='N2';

-- 柔軟 (じゅうなん) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E6%9F%94%E8%BB%9F
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='柔軟' AND jlpt_level='N2';

-- 根拠 (こんきょ) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E6%A0%B9%E6%8B%A0
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='根拠' AND jlpt_level='N2';

-- 格差 (かくさ) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E6%A0%B9%E6%8B%A0
-- 주: DB에 이미 N1+N2 두 행 존재. N2 행을 N1로 변경(중복 N1이 됨 → 이후 dedup 필요).
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='格差' AND jlpt_level='N2';

-- 極めて (きわめて) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E6%A5%B5%E3%82%81%E3%81%A6
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='極めて' AND jlpt_level='N2';

-- 概念 (がいねん) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E6%A6%82%E5%BF%B5
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='概念' AND jlpt_level='N2';

-- 目覚ましい (めざましい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E7%9B%AE%E8%A6%9A%E3%81%BE%E3%81%97%E3%81%84
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='目覚ましい' AND jlpt_level='N2';

-- 空しい (むなしい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E7%A9%BA%E3%81%97%E3%81%84
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='空しい' AND jlpt_level='N2';

-- 紛らわしい (まぎらわしい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E7%B4%9B%E3%82%89%E3%82%8F%E3%81%97%E3%81%84
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='紛らわしい' AND jlpt_level='N2';

-- 著しい (いちじるしい) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E8%91%97%E3%81%97%E3%81%84
-- 주: DB에 N2+N3 두 행 존재. N2 행을 N1로 교정.
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='著しい' AND jlpt_level='N2';

-- 覆す (くつがえす) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E8%A6%86%E3%81%99
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='覆す' AND jlpt_level='N2';

-- 観点 (かんてん) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E8%A6%B3%E7%82%B9
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='観点' AND jlpt_level='N2';

-- 辛うじて (かろうじて) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E8%BE%9B%E3%81%86%E3%81%98%E3%81%A6
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='辛うじて' AND jlpt_level='N2';

-- 遂げる (とげる) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E9%81%82%E3%81%92%E3%82%8B
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='遂げる' AND jlpt_level='N2';

-- 免れる (まぬがれる/まぬかれる) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E5%85%8D%E3%82%8C%E3%82%8B
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='免れる' AND jlpt_level='N2';

-- 促す (うながす) N2→N1
-- jisho: "Common word JLPT N1" https://jisho.org/search/%E4%BF%83%E3%81%99
UPDATE jlpt_vocabulary SET jlpt_level='N1' WHERE word='促す' AND jlpt_level='N2';

-- ================================================================
-- [2] N2 → N3 교정 (jisho.org 확인 결과 N3 태그)
-- ================================================================

-- すなわち N2→N3
-- jisho: "Common word JLPT N3" https://jisho.org/search/%E3%81%99%E3%81%AA%E3%82%8F%E3%81%A1
UPDATE jlpt_vocabulary SET jlpt_level='N3' WHERE word='すなわち' AND jlpt_level='N2';

-- 大いに (おおいに) N2→N3
-- jisho: "Common word JLPT N3" https://jisho.org/search/%E5%A4%A7%E3%81%84%E3%81%AB
UPDATE jlpt_vocabulary SET jlpt_level='N3' WHERE word='大いに' AND jlpt_level='N2';

-- 慎重 (しんちょう) N2→N3
-- jisho: "Common word JLPT N3" https://jisho.org/search/%E6%85%8E%E9%87%8D
UPDATE jlpt_vocabulary SET jlpt_level='N3' WHERE word='慎重' AND jlpt_level='N2';

-- 抱える (かかえる) N2→N3
-- jisho: "Common word JLPT N3" https://jisho.org/search/%E6%8A%B1%E3%81%88%E3%82%8B
UPDATE jlpt_vocabulary SET jlpt_level='N3' WHERE word='抱える' AND jlpt_level='N2';

-- 水準 (すいじゅん) N2→N3
-- jisho: "Common word JLPT N3" https://jisho.org/search/%E6%B0%B4%E6%BA%96
UPDATE jlpt_vocabulary SET jlpt_level='N3' WHERE word='水準' AND jlpt_level='N2';

-- 直ちに (ただちに) N2→N3
-- jisho: "Common word JLPT N3" https://jisho.org/search/%E7%9B%B4%E3%81%A1%E3%81%AB
-- 주의: all_vocab에 N2 단일 행. jisho는 N3. 교정.
UPDATE jlpt_vocabulary SET jlpt_level='N3' WHERE word='直ちに' AND jlpt_level='N2';

-- 見解 (けんかい) N2→N3
-- jisho: "Common word JLPT N3" https://jisho.org/search/%E8%A6%8B%E8%A7%A3
UPDATE jlpt_vocabulary SET jlpt_level='N3' WHERE word='見解' AND jlpt_level='N2';

-- 資源 (しげん) N2→N3
-- jisho: "Common word JLPT N3" https://jisho.org/search/%E8%B3%87%E6%BA%90
UPDATE jlpt_vocabulary SET jlpt_level='N3' WHERE word='資源' AND jlpt_level='N2';

COMMIT;

-- ================================================================
-- 교정 후 확인 쿼리
-- ================================================================
\echo '== 교정 후 레벨 확인 (교정 대상 단어) =='
SELECT word, jlpt_level
FROM jlpt_vocabulary
WHERE word IN (
  '乏しい','予め','仕組み','伴う','促進','偏見','前提','動向','好ましい','実態',
  '心強い','把握','措置','望ましい','柔軟','根拠','格差','極めて','概念','目覚ましい',
  '空しい','紛らわしい','著しい','覆す','観点','辛うじて','遂げる','免れる','促す',
  'すなわち','大いに','慎重','抱える','水準','直ちに','見解','資源'
)
ORDER BY word, jlpt_level;
