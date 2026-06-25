-- encoding: UTF-8
-- N2 語彙シード batch 4 (120語)
-- テーマ: 社会・政治・制度・法律・行政・教育
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- 中複チェック: 既存リスト (batch1~3 + 初期298語) との重複なし確認済み
-- 読み: 標準国語辞典準拠

-- ============================================================
-- 名詞 — 社会・政治・行政 (60語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '選挙', 'せんきょ', '선거', 'N2', '명사', '来月、市長選挙が行われる。', '다음 달 시장 선거가 치러진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='選挙' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '投票', 'とうひょう', '투표', 'N2', '명사', '国民が投票によって代表を選ぶ。', '국민이 투표로 대표를 선출한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='投票' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '政策', 'せいさく', '정책', 'N2', '명사', '新しい経済政策が発表された。', '새로운 경제 정책이 발표되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='政策' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '政府', 'せいふ', '정부', 'N2', '명사', '政府は緊急対策を発表した。', '정부는 긴급 대책을 발표했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='政府' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '議会', 'ぎかい', '의회', 'N2', '명사', '議会で法案が審議される。', '의회에서 법안이 심의된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='議会' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '議員', 'ぎいん', '의원', 'N2', '명사', '国会議員が演説を行った。', '국회의원이 연설을 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='議員' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '内閣', 'ないかく', '내각', 'N2', '명사', '内閣が総辞職した。', '내각이 총사퇴했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='内閣' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大臣', 'だいじん', '장관, 대신', 'N2', '명사', '外務大臣が記者会見を開いた。', '외무장관이 기자회견을 열었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大臣' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '首相', 'しゅしょう', '수상, 총리', 'N2', '명사', '首相が国会で答弁した。', '총리가 국회에서 답변했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='首相' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '与党', 'よとう', '여당', 'N2', '명사', '与党が過半数を確保した。', '여당이 과반수를 확보했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='与党' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '野党', 'やとう', '야당', 'N2', '명사', '野党が政府案に反対した。', '야당이 정부안에 반대했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='野党' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '法案', 'ほうあん', '법안', 'N2', '명사', '予算委員会で法案が可決された。', '예산위원회에서 법안이 가결되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='法案' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '条例', 'じょうれい', '조례', 'N2', '명사', '市の条例が改正された。', '시 조례가 개정되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='条例' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '規制', 'きせい', '규제', 'N2', '명사', '環境規制が強化された。', '환경 규제가 강화되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規制' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '規則', 'きそく', '규칙', 'N2', '명사', '会社の規則を守る。', '회사 규칙을 지키다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規則' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '憲法', 'けんぽう', '헌법', 'N2', '명사', '憲法の改正について議論される。', '헌법 개정에 대해 논의된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憲法' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '裁判', 'さいばん', '재판', 'N2', '명사', '裁判で無罪が確定した。', '재판에서 무죄가 확정되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='裁判' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '裁判所', 'さいばんしょ', '법원, 재판소', 'N2', '명사', '最高裁判所が判決を下した。', '최고재판소가 판결을 내렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='裁判所' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '判決', 'はんけつ', '판결', 'N2', '명사', '裁判所が有罪の判決を下した。', '법원이 유죄 판결을 내렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='判決' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '違反', 'いはん', '위반', 'N2', '명사', '交通違反で罰金を払った。', '교통위반으로 벌금을 냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='違反' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '罰則', 'ばっそく', '벌칙', 'N2', '명사', '違反した場合は罰則がある。', '위반한 경우 벌칙이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='罰則' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訴訟', 'そしょう', '소송', 'N2', '명사', '企業間で訴訟が起きた。', '기업 간에 소송이 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訴訟' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '契約', 'けいやく', '계약', 'N2', '명사', '契約書に署名した。', '계약서에 서명했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='契約' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '許可', 'きょか', '허가', 'N2', '명사', '建設の許可を申請する。', '건설 허가를 신청하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='許可' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '申請', 'しんせい', '신청', 'N2', '명사', '補助金の申請をする。', '보조금 신청을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='申請' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '届け出', 'とどけで', '신고, 제출', 'N2', '명사', '転居の届け出を役所に提出する。', '이사 신고를 구청에 제출하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='届け出' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '行政', 'ぎょうせい', '행정', 'N2', '명사', '行政の効率化が求められる。', '행정의 효율화가 요구된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='行政' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '市役所', 'しやくしょ', '시청', 'N2', '명사', '市役所で住民票を取った。', '시청에서 주민등록등본을 발급받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='市役所' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '自治体', 'じちたい', '자치단체', 'N2', '명사', '地方自治体が独自の支援策を打ち出した。', '지방자치단체가 독자적인 지원책을 내놓았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自治体' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '地方', 'ちほう', '지방, 지역', 'N2', '명사', '地方の過疎化が進んでいる。', '지방의 과소화가 진행되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='地方' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公務員', 'こうむいん', '공무원', 'N2', '명사', '公務員として市民に奉仕する。', '공무원으로서 시민에게 봉사하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公務員' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '税金', 'ぜいきん', '세금', 'N2', '명사', '消費税が引き上げられた。', '소비세가 인상되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='税金' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '財政', 'ざいせい', '재정', 'N2', '명사', '国の財政が悪化している。', '국가 재정이 악화되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='財政' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '補助金', 'ほじょきん', '보조금', 'N2', '명사', '中小企業向けの補助金が交付された。', '중소기업용 보조금이 교부되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='補助金' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '年金', 'ねんきん', '연금', 'N2', '명사', '老後のために年金を積み立てる。', '노후를 위해 연금을 적립하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='年金' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '保険', 'ほけん', '보험', 'N2', '명사', '健康保険に加入する。', '건강보험에 가입하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='保険' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '社会保障', 'しゃかいほしょう', '사회보장', 'N2', '명사', '社会保障制度の見直しが必要だ。', '사회보장 제도의 재검토가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='社会保障' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '少子化', 'しょうしか', '저출산, 소자화', 'N2', '명사', '少子化対策が急務となっている。', '저출산 대책이 급선무가 되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='少子化' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '高齢化', 'こうれいか', '고령화', 'N2', '명사', '高齢化社会に対応した政策が必要だ。', '고령화 사회에 대응한 정책이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高齢化' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '人口', 'じんこう', '인구', 'N2', '명사', '都市の人口が増加している。', '도시 인구가 증가하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人口' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '移民', 'いみん', '이민', 'N2', '명사', '移民政策が社会問題になっている。', '이민 정책이 사회 문제가 되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='移民' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '外交', 'がいこう', '외교', 'N2', '명사', '両国の外交関係が改善した。', '양국의 외교 관계가 개선되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='外交' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '条約', 'じょうやく', '조약', 'N2', '명사', '両国が平和条約に署名した。', '양국이 평화조약에 서명했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='条約' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '国際', 'こくさい', '국제', 'N2', '명사', '国際社会が協力して問題を解決する。', '국제사회가 협력해 문제를 해결한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='国際' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '人権', 'じんけん', '인권', 'N2', '명사', '人権の保護が国際的に重要だ。', '인권 보호가 국제적으로 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人権' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '平等', 'びょうどう', '평등', 'N2', '명사', '法の下での平等が保障される。', '법 앞의 평등이 보장된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='平等' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '自由', 'じゆう', '자유', 'N2', '명사', '言論の自由が守られている。', '언론의 자유가 지켜지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自由' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '国民', 'こくみん', '국민', 'N2', '명사', '国民の意見を尊重する。', '국민의 의견을 존중하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='国民' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '市民', 'しみん', '시민', 'N2', '명사', '市民が行政に参加する。', '시민이 행정에 참여하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='市民' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '世論', 'せろん', '여론', 'N2', '명사', '世論調査で支持率が上がった。', '여론조사에서 지지율이 올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='世論' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '腐敗', 'ふはい', '부패', 'N2', '명사', '政治腐敗の撲滅を訴える。', '정치 부패 근절을 호소하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='腐敗' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '汚職', 'おしょく', '부정부패, 공직 비리', 'N2', '명사', '汚職事件で議員が逮捕された。', '부정부패 사건으로 의원이 체포되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汚職' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抗議', 'こうぎ', '항의', 'N2', '명사', '市民が政府に抗議した。', '시민이 정부에 항의했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抗議' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '運動', 'うんどう', '운동(사회적)', 'N2', '명사', '環境保護運動が広がっている。', '환경 보호 운동이 확산되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='運動' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '団体', 'だんたい', '단체', 'N2', '명사', 'NPO団体が支援活動を行う。', 'NPO단체가 지원 활동을 실시한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='団体' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '組合', 'くみあい', '조합, 노동조합', 'N2', '명사', '労働組合が賃上げを求めた。', '노동조합이 임금 인상을 요구했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='組合' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '委員会', 'いいんかい', '위원회', 'N2', '명사', '調査委員会が設置された。', '조사위원회가 설치되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='委員会' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '機関', 'きかん', '기관', 'N2', '명사', '国際機関が支援を行う。', '국제기관이 지원을 실시한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='機関' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '省庁', 'しょうちょう', '부처, 성청', 'N2', '명사', '各省庁が連携して対応する。', '각 부처가 연계해 대응한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='省庁' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 法律・制度 (20語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '法律', 'ほうりつ', '법률', 'N2', '명사', '法律の範囲内で行動する。', '법률의 범위 내에서 행동하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='法律' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '立法', 'りっぽう', '입법', 'N2', '명사', '立法府が新しい法律を制定した。', '입법부가 새로운 법률을 제정했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立法' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '改正', 'かいせい', '개정', 'N2', '명사', '法律の改正が議論されている。', '법률 개정이 논의되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改正' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廃止', 'はいし', '폐지', 'N2', '명사', '古い制度が廃止された。', '낡은 제도가 폐지되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃止' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '施行', 'しこう', '시행', 'N2', '명사', '新法が来月から施行される。', '신법이 다음 달부터 시행된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='施行' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '義務化', 'ぎむか', '의무화', 'N2', '명사', 'ヘルメット着用の義務化が決まった。', '헬멧 착용 의무화가 결정되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='義務化' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '罰金', 'ばっきん', '벌금', 'N2', '명사', '違法駐車で罰金を科された。', '불법 주차로 벌금이 부과되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='罰金' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '刑事', 'けいじ', '형사(법)', 'N2', '명사', '刑事事件として捜査が始まった。', '형사 사건으로 수사가 시작되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刑事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '民事', 'みんじ', '민사(법)', 'N2', '명사', '民事訴訟を起こす。', '민사소송을 제기하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='民事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '弁護士', 'べんごし', '변호사', 'N2', '명사', '弁護士に相談して対策を立てた。', '변호사에게 상담해 대책을 세웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弁護士' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '賠償', 'ばいしょう', '배상', 'N2', '명사', '損害賠償を求める訴えを起こした。', '손해배상을 요구하는 소송을 제기했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='賠償' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '告訴', 'こくそ', '고소', 'N2', '명사', '詐欺で告訴状を提出した。', '사기로 고소장을 제출했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='告訴' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '証拠', 'しょうこ', '증거', 'N2', '명사', '明確な証拠が必要だ。', '명확한 증거가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='証拠' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '権限', 'けんげん', '권한', 'N2', '명사', '上司に権限を委任する。', '상사에게 권한을 위임하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='権限' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '規約', 'きやく', '규약', 'N2', '명사', '利用規約に同意してください。', '이용 규약에 동의해 주세요.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規約' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '免許', 'めんきょ', '면허', 'N2', '명사', '運転免許の更新をする。', '운전면허 갱신을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='免許' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '資格', 'しかく', '자격', 'N2', '명사', '国家資格を取得する。', '국가 자격을 취득하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='資格' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '登録', 'とうろく', '등록', 'N2', '명사', '住所変更の登録をする。', '주소 변경 등록을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='登録' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公開', 'こうかい', '공개', 'N2', '명사', '情報の公開を請求する。', '정보 공개를 청구하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公開' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '禁止', 'きんし', '금지', 'N2', '명사', '公共の場での喫煙が禁止された。', '공공장소에서의 흡연이 금지되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='禁止' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 教育 (20語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '義務教育', 'ぎむきょういく', '의무교육', 'N2', '명사', '日本では義務教育は9年間だ。', '일본에서는 의무교육이 9년이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='義務教育' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '学習', 'がくしゅう', '학습', 'N2', '명사', '主体的な学習が重要だ。', '주체적인 학습이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='学習' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '入学', 'にゅうがく', '입학', 'N2', '명사', '大学に入学する試験を受けた。', '대학에 입학하는 시험을 봤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='入学' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '卒業', 'そつぎょう', '졸업', 'N2', '명사', '大学を卒業して就職した。', '대학을 졸업하고 취직했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卒業' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '進学', 'しんがく', '진학', 'N2', '명사', '大学への進学率が上がっている。', '대학 진학률이 높아지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='進学' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受験', 'じゅけん', '수험, 시험 응시', 'N2', '명사', '大学受験のために毎日勉強する。', '대학 수험을 위해 매일 공부하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受験' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '奨学金', 'しょうがくきん', '장학금', 'N2', '명사', '奨学金を受けて大学に通う。', '장학금을 받아 대학에 다니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='奨学金' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '授業料', 'じゅぎょうりょう', '수업료', 'N2', '명사', '授業料の無償化が議論されている。', '수업료 무상화가 논의되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='授業料' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '指導', 'しどう', '지도', 'N2', '명사', '教師が生徒を丁寧に指導する。', '교사가 학생을 정중히 지도하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='指導' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '授業', 'じゅぎょう', '수업', 'N2', '명사', '今日の授業は分かりやすかった。', '오늘 수업은 이해하기 쉬웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='授業' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '講義', 'こうぎ', '강의', 'N2', '명사', '大学で専門科目の講義を受ける。', '대학에서 전공 과목 강의를 받는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='講義' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '教師', 'きょうし', '교사', 'N2', '명사', '優秀な教師を育成する。', '우수한 교사를 육성하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='教師' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '教員', 'きょういん', '교원, 교직원', 'N2', '명사', '教員免許を取得した。', '교원 자격증을 취득했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='教員' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '学力', 'がくりょく', '학력(실력)', 'N2', '명사', '学力の格差が広がっている。', '학력 격차가 벌어지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='学力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '学歴', 'がくれき', '학력(학벌)', 'N2', '명사', '学歴よりも実力が重視される。', '학벌보다 실력이 중시된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='学歴' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生涯学習', 'しょうがいがくしゅう', '평생학습', 'N2', '명사', '生涯学習の機会を増やす。', '평생학습의 기회를 늘리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生涯学習' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '校則', 'こうそく', '교칙', 'N2', '명사', '厳しい校則に縛られる。', '엄격한 교칙에 얽매이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='校則' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'カリキュラム', 'カリキュラム', '교육과정, 커리큘럼', 'N2', '명사', '新しいカリキュラムが導入された。', '새로운 교육과정이 도입되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='カリキュラム' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不登校', 'ふとうこう', '불등교, 등교 거부', 'N2', '명사', '不登校の子どもへの支援が必要だ。', '등교 거부 아이에 대한 지원이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不登校' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'いじめ', 'いじめ', '따돌림, 괴롭힘', 'N2', '명사', 'いじめ問題が深刻化している。', '따돌림 문제가 심각해지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='いじめ' AND jlpt_level='N2');

-- ============================================================
-- 동사 — 社会・政治・法律・行政・教育 (13語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '制定する', 'せいていする', '제정하다', 'N2', '동사', '議会が新しい法律を制定した。', '의회가 새로운 법률을 제정했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='制定する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '施策する', 'しさくする', '시책을 강구하다', 'N2', '동사', '政府が新しい政策を施策する。', '정부가 새로운 정책을 시책으로 마련하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='施策する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '審議する', 'しんぎする', '심의하다', 'N2', '동사', '委員会が法案を審議する。', '위원회가 법안을 심의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='審議する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '可決する', 'かけつする', '가결하다', 'N2', '동사', '国会で予算案が可決された。', '국회에서 예산안이 가결되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='可決する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '否決する', 'ひけつする', '부결하다', 'N2', '동사', '議会が法案を否決した。', '의회가 법안을 부결했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='否決する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訴える', 'うったえる', '호소하다, 소송하다', 'N2', '동사', '裁判所に訴えることにした。', '법원에 소송을 제기하기로 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訴える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '規制する', 'きせいする', '규제하다', 'N2', '동사', '有害な商品の販売を規制する。', '유해 상품 판매를 규제하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規制する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '禁止する', 'きんしする', '금지하다', 'N2', '동사', '路上での喫煙を禁止する。', '노상 흡연을 금지하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='禁止する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廃止する', 'はいしする', '폐지하다', 'N2', '동사', '非効率な制度を廃止する。', '비효율적인 제도를 폐지하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃止する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公布する', 'こうふする', '공포하다', 'N2', '동사', '新しい法律が公布された。', '새로운 법률이 공포되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公布する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '徴収する', 'ちょうしゅうする', '징수하다', 'N2', '동사', '税金を徴収する。', '세금을 징수하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='徴収する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '養成する', 'ようせいする', '양성하다', 'N2', '동사', '専門家を養成するプログラムがある。', '전문가를 양성하는 프로그램이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='養成する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '普及する', 'ふきゅうする', '보급하다', 'N2', '동사', 'ICT教育が学校に普及する。', 'ICT 교육이 학교에 보급되다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='普及する' AND jlpt_level='N2');

-- ============================================================
-- な형용사・い형용사 — 社会・制度テーマ (7語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公平', 'こうへい', '공평함', 'N2', 'な형용사', '公平な評価基準を設ける。', '공평한 평가 기준을 마련하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公平' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '中立', 'ちゅうりつ', '중립', 'N2', 'な형용사', '報道機関は中立の立場を保つべきだ。', '보도기관은 중립 입장을 유지해야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='中立' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '合法', 'ごうほう', '합법', 'N2', 'な형용사', '合法的な手段で問題を解決する。', '합법적인 수단으로 문제를 해결하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合法' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '違法', 'いほう', '불법, 위법', 'N2', 'な형용사', '違法なコピーを販売することは禁止だ。', '불법 복제품을 판매하는 것은 금지이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='違法' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '民主的', 'みんしゅてき', '민주적', 'N2', 'な형용사', '民主的な方法で意思決定する。', '민주적인 방법으로 의사결정하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='民主的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '強制的', 'きょうせいてき', '강제적', 'N2', 'な형용사', '強制的な措置はできるだけ避ける。', '강제적 조치는 가능한 한 피하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='強制的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '画一的', 'かくいつてき', '획일적', 'N2', 'な형용사', '画一的な教育では個性が育たない。', '획일적인 교육으로는 개성이 자라지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='画一的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '民間', 'みんかん', '민간', 'N2', '명사', '民間企業と行政が連携して取り組む。', '민간 기업과 행정이 연계해 대처한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='民間' AND jlpt_level='N2');
