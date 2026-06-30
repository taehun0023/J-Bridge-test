-- encoding: UTF-8 (BOM-free)
-- N1 語彙シード ext2 (130語)
-- テーマ: 専門・政治経済・社会・学術の高度語彙
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- 読み確認: 標準辞書準拠
-- 修正日: 2026-06-26 (重複28語除去・新語28語追加・品詞区分修正)

-- ============================================================
-- 名詞 (Nouns) — 75語
-- ============================================================

-- 政治・行政
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '施政', 'しせい', '시정, 정치 실시', 'N1', '명사', '首相が施政方針演説を行った。', '총리가 시정방침 연설을 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='施政' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '国政', 'こくせい', '국정', 'N1', '명사', '国政に民意を反映させる。', '국정에 민의를 반영시키다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='国政' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '帝政', 'ていせい', '제정, 제국 정치', 'N1', '명사', '帝政が崩壊して共和制に移行した。', '제정이 붕괴하여 공화제로 이행했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帝政' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '圧政', 'あっせい', '압정, 폭정', 'N1', '명사', '圧政に苦しむ民衆が立ち上がった。', '압정에 시달리는 민중이 들고일어났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='圧政' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '善政', 'ぜんせい', '선정, 훌륭한 정치', 'N1', '명사', '善政を敷いた君主は民に慕われた。', '선정을 베푼 군주는 백성들에게 사랑받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='善政' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '代議制', 'だいぎせい', '대의제', 'N1', '명사', '代議制民主主義の限界が議論されている。', '대의제 민주주의의 한계가 논의되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='代議制' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '共和制', 'きょうわせい', '공화제', 'N1', '명사', '共和制国家では大統領が元首となる。', '공화제 국가에서는 대통령이 국가원수가 된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='共和制' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '君主制', 'くんしゅせい', '군주제', 'N1', '명사', '立憲君主制は議会と君主が並立する体制だ。', '입헌군주제는 의회와 군주가 공존하는 체제이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='君主制' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '寡頭制', 'かとうせい', '과두제', 'N1', '명사', '寡頭制のもとでは少数の権力者が支配する。', '과두제 아래에서는 소수의 권력자가 지배한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寡頭制' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '弾劾', 'だんがい', '탄핵', 'N1', '명사', '大統領の弾劾訴追案が可決された。', '대통령 탄핵소추안이 가결되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弾劾' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '三権分立', 'さんけんぶんりつ', '삼권분립', 'N1', '명사', '三権分立は権力の濫用を防ぐ仕組みだ。', '삼권분립은 권력 남용을 막는 장치이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='三権分立' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '立憲主義', 'りっけんしゅぎ', '입헌주의', 'N1', '명사', '立憲主義は憲法による権力の制限を求める。', '입헌주義는 헌법에 의한 권력의 제한을 요구한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='立憲主義' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '文民統制', 'ぶんみんとうせい', '문민통제', 'N1', '명사', '文民統制は軍の政治介入を防ぐ原則だ。', '문민통제는 군의 정치 개입을 막는 원칙이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='文民統制' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '専権', 'せんけん', '전권, 독점적 권한', 'N1', '명사', '首相の専権事項として外交政策がある。', '총리의 전권 사항으로서 외교정책이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='専権' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '地方自治', 'ちほうじち', '지방자치', 'N1', '명사', '地方自治の充実が民主主義の基盤となる。', '지방자치의 충실화가 민주주의의 기반이 된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='地方自治' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '官僚制', 'かんりょうせい', '관료제', 'N1', '명사', '官僚制の硬直性が改革を妨げている。', '관료제의 경직성이 개혁을 방해하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='官僚制' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '徴兵', 'ちょうへい', '징병', 'N1', '명사', '徴兵制度を廃止して志願制に移行した。', '징병제도를 폐지하고 지원제로 이행했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='徴兵' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '国際法', 'こくさいほう', '국제법', 'N1', '명사', '国際法に基づいて紛争を解決する。', '국제법에 근거하여 분쟁을 해결하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='国際法' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '覇道', 'はどう', '패도, 힘에 의한 지배', 'N1', '명사', '覇道によらず王道で国を治めるべきだ。', '패도가 아닌 왕도로 나라를 다스려야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='覇道' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '王道', 'おうどう', '왕도, 정도', 'N1', '명사', '成功への王道は地道な努力しかない。', '성공으로 가는 왕도는 꾸준한 노력뿐이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='王道' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '議院内閣制', 'ぎいんないかくせい', '의원내각제', 'N1', '명사', '議院内閣制では内閣が議会に対して責任を負う。', '의원내각제에서는 내각이 의회에 대해 책임을 진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='議院内閣制' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大統領制', 'だいとうりょうせい', '대통령제', 'N1', '명사', '大統領制では行政と立法が分離されている。', '대통령제에서는 행정과 입법이 분리되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大統領制' AND jlpt_level='N1');

-- 司法・法律
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '有罪', 'ゆうざい', '유죄', 'N1', '명사', '陪審員は被告を有罪と認定した。', '배심원은 피고를 유죄로 인정했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='有罪' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '無罪', 'むざい', '무죄', 'N1', '명사', '証拠不十分として無罪判決が下された。', '증거 불충분으로 무죄 판결이 내려졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='無罪' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '懲役', 'ちょうえき', '징역', 'N1', '명사', '懲役三年の実刑判決を受けた。', '징역 3년의 실형 판결을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='懲役' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '禁錮', 'きんこ', '금고(자유형)', 'N1', '명사', '禁錮刑は懲役と異なり労役を伴わない。', '금고형은 징역과 달리 노역을 수반하지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='禁錮' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '執行猶予', 'しっこうゆうよ', '집행유예', 'N1', '명사', '初犯のため執行猶予付きの判決となった。', '초범이라 집행유예 판결이 내려졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='執行猶予' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仮釈放', 'かりしゃくほう', '가석방', 'N1', '명사', '模範囚として仮釈放が認められた。', '모범수로서 가석방이 인정되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仮釈放' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実刑', 'じっけい', '실형', 'N1', '명사', '執行猶予なしの実刑判決が確定した。', '집행유예 없는 실형 판결이 확정되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実刑' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '求刑', 'きゅうけい', '구형', 'N1', '명사', '検察は懲役五年を求刑した。', '검찰은 징역 5년을 구형했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='求刑' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恩赦', 'おんしゃ', '사면, 특사', 'N1', '명사', '建国記念日に政治犯への恩赦が発令された。', '건국기념일에 정치범에 대한 사면이 발령되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恩赦' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '被告', 'ひこく', '피고', 'N1', '명사', '被告は法廷で無罪を主張した。', '피고는 법정에서 무죄를 주장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='被告' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '原告', 'げんこく', '원고', 'N1', '명사', '原告は損害賠償を求めて提訴した。', '원고는 손해배상을 요구하며 제소했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='原告' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '加害者', 'かがいしゃ', '가해자', 'N1', '명사', '加害者は被害者に対して謝罪した。', '가해자는 피해자에게 사죄했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='加害者' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '被害者', 'ひがいしゃ', '피해자', 'N1', '명사', '被害者の心情を法廷で陳述した。', '피해자의 심정을 법정에서 진술했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='被害者' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不作為', 'ふさくい', '부작위, 행동하지 않음', 'N1', '명사', '行政の不作為が被害を拡大させた。', '행정의 부작위가 피해를 확대시켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不作為' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '上訴', 'じょうそ', '상소', 'N1', '명사', '一審判決を不服として上訴した。', '1심 판결에 불복하여 상소했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上訴' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '拘留', 'こうりゅう', '구류', 'N1', '명사', '容疑者は拘留期間中に取り調べを受けた。', '용의자는 구류 기간 중에 조사를 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拘留' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '勾留', 'こうりゅう', '(미결)구금, 형사 구금', 'N1', '명사', '起訴前の勾留は原則10日以内だ。', '기소 전 구금은 원칙적으로 10일 이내이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='勾留' AND jlpt_level='N1');

-- 経済・財政
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逓減', 'ていげん', '체감, 점차 감소', 'N1', '명사', '限界効用逓減の法則は経済学の基本だ。', '한계효용 체감의 법칙은 경제학의 기본이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逓減' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逓増', 'ていぞう', '체증, 점차 증가', 'N1', '명사', '逓増する医療費が財政を圧迫している。', '점차 늘어나는 의료비가 재정을 압박하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逓増' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '漸増', 'ぜんぞう', '점증, 서서히 증가', 'N1', '명사', '人口は漸増から減少局面に転じた。', '인구는 점증에서 감소 국면으로 전환되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漸増' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '漸減', 'ぜんげん', '점감, 서서히 감소', 'N1', '명사', '国内生産の漸減傾向が続いている。', '국내 생산의 점감 경향이 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漸減' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '寡占', 'かせん', '과점', 'N1', '명사', '通信業界は数社による寡占状態にある。', '통신 업계는 몇몇 회사에 의한 과점 상태에 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寡占' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '独占', 'どくせん', '독점', 'N1', '명사', '市場の独占は消費者の利益を損なう。', '시장의 독점은 소비자 이익을 해친다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='独占' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '累進課税', 'るいしんかぜい', '누진과세', 'N1', '명사', '累進課税制度は所得格差を縮小する効果がある。', '누진과세 제도는 소득 격차를 줄이는 효과가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='累進課税' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '比較優位', 'ひかくゆうい', '비교우위', 'N1', '명사', '比較優位の理論は自由貿易を支持する根拠だ。', '비교우위 이론은 자유무역을 지지하는 근거이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='比較優位' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '機会費用', 'きかいひよう', '기회비용', 'N1', '명사', '進学を諦めた機会費用を考える必要がある。', '진학을 포기한 기회비용을 생각할 필요가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='機会費用' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '埋没費用', 'まいぼつひよう', '매몰비용', 'N1', '명사', '埋没費用を無視して合理的な判断をすべきだ。', '매몰비용을 무시하고 합리적인 판단을 해야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='埋没費用' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公共財', 'こうきょうざい', '공공재', 'N1', '명사', '国防や道路は典型的な公共財だ。', '국방과 도로는 전형적인 공공재이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公共財' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '外部性', 'がいぶせい', '외부성, 외부효과', 'N1', '명사', '工場の排煙は負の外部性の典型例だ。', '공장의 배연은 부정적 외부성의 전형적인 예이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='外部性' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逆選択', 'ぎゃくせんたく', '역선택', 'N1', '명사', '情報の非対称性は逆選択を引き起こす。', '정보의 비대칭성은 역선택을 일으킨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逆選択' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '弾力性', 'だんりょくせい', '탄력성', 'N1', '명사', '需要の価格弾力性が低い財を必需品という。', '수요의 가격 탄력성이 낮은 재화를 필수품이라 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弾力性' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逆進性', 'ぎゃくしんせい', '역진성', 'N1', '명사', '消費税は低所得者に逆進性が生じる。', '소비세는 저소득자에게 역진성이 발생한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逆進性' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '経常収支', 'けいじょうしゅうし', '경상수지', 'N1', '명사', '経常収支の黒字が続いている。', '경상수지 흑자가 계속되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='経常収支' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '国際収支', 'こくさいしゅうし', '국제수지', 'N1', '명사', '国際収支の統計は経済政策に活用される。', '국제수지 통계는 경제정책에 활용된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='国際収支' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '民営', 'みんえい', '민영', 'N1', '명사', '鉄道の民営化により料金競争が起きた。', '철도 민영화로 요금 경쟁이 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='民営' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '国営', 'こくえい', '국영', 'N1', '명사', '国営企業の民営化は世界的な潮流となった。', '국영기업의 민영화는 세계적인 추세가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='国営' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '収奪', 'しゅうだつ', '수탈', 'N1', '명사', '植民地における資源の収奪が問題視された。', '식민지에서의 자원 수탈이 문제시되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収奪' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '格差', 'かくさ', '격차', 'N1', '명사', '所得格差が社会問題として注目されている。', '소득 격차가 사회 문제로 주목받고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='格差' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '所得再分配', 'しょとくさいぶんぱい', '소득 재분배', 'N1', '명사', '税と社会保障による所得再分配が機能している。', '세금과 사회보장에 의한 소득 재분배가 기능하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='所得再分配' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '内需', 'ないじゅ', '내수', 'N1', '명사', '内需を拡大して景気を回復させる。', '내수를 확대하여 경기를 회복시키다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='内需' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '外需', 'がいじゅ', '외수, 해외 수요', 'N1', '명사', '外需依存型の経済は為替変動に脆弱だ。', '외수 의존형 경제는 환율 변동에 취약하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='外需' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '財政赤字', 'ざいせいあかじ', '재정적자', 'N1', '명사', '財政赤字の拡大が将来世代に負担を残す。', '재정적자 확대가 미래 세대에 부담을 남긴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='財政赤字' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '通貨危機', 'つうかきき', '통화위기', 'N1', '명사', '急激な資本流出が通貨危機を引き起こした。', '급격한 자본 유출이 통화위기를 일으켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通貨危機' AND jlpt_level='N1');

-- 社会・社会学
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '疎外', 'そがい', '소외', 'N1', '명사', '労働における疎外の問題をマルクスは分析した。', '노동에서의 소외 문제를 마르크스는 분석했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疎外' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '帰属意識', 'きぞくいしき', '귀속 의식, 소속감', 'N1', '명사', '組織への帰属意識が薄れてきている。', '조직에 대한 귀속 의식이 희박해지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰属意識' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '世俗化', 'せぞくか', '세속화', 'N1', '명사', '近代化に伴い宗教の世俗化が進んだ。', '근대화와 함께 종교의 세속화가 진행되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='世俗化' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '帰化', 'きか', '귀화', 'N1', '명사', '長年の居住後、日本に帰化した。', '오랜 거주 후 일본으로 귀화했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰化' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '官製', 'かんせい', '관제, 관에서 만든', 'N1', '명사', '官製談合が摘発されて入札が見直された。', '관제 담합이 적발되어 입찰이 재검토되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='官製' AND jlpt_level='N1');

-- 学術・哲学・論理
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公理', 'こうり', '공리', 'N1', '명사', '数学は公理から演繹的に展開される。', '수학은 공리로부터 연역적으로 전개된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公理' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '公準', 'こうじゅん', '공준(공리)', 'N1', '명사', 'ユークリッド幾何学は五つの公準から成る。', '유클리드 기하학은 다섯 가지 공준으로 이루어진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='公準' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実証主義', 'じっしょうしゅぎ', '실증주의', 'N1', '명사', '実証主義は観察と実験を重視する立場だ。', '실증주의는 관찰과 실험을 중시하는 입장이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実証主義' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '唯名論', 'ゆいめいろん', '유명론', 'N1', '명사', '唯名論は普遍概念の実在を否定する立場だ。', '유명론은 보편 개념의 실재를 부정하는 입장이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='唯名論' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '還元主義', 'かんげんしゅぎ', '환원주의', 'N1', '명사', '還元主義は複雑な現象を要素に分解して説明する。', '환원주의는 복잡한 현상을 요소로 분해하여 설명한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='還元主義' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '形而上学', 'けいじじょうがく', '형이상학', 'N1', '명사', '形而上学は存在・時間・意識の根本を問う。', '형이상학은 존재·시간·의식의 근본을 묻는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='形而上学' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '認識論', 'にんしきろん', '인식론', 'N1', '명사', '認識論は知識の起源と限界を探求する。', '인식론은 지식의 기원과 한계를 탐구한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='認識論' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '存在論', 'そんざいろん', '존재론', 'N1', '명사', '存在論は「あるとはどういうことか」を問う。', '존재론은 "있다는 것은 어떤 것인가"를 묻는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='存在論' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '二項対立', 'にこうたいりつ', '이항대립', 'N1', '명사', '善悪の二項対立では現実は説明できない。', '선악의 이항대립으로는 현실을 설명할 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='二項対立' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '反証可能性', 'はんしょうかのうせい', '반증 가능성', 'N1', '명사', 'ポパーは反証可能性が科学の条件だと主張した。', '포퍼는 반증 가능성이 과학의 조건이라고 주장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反証可能性' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '演繹法', 'えんえきほう', '연역법', 'N1', '명사', '演繹法は一般原則から個別事例を導く推論だ。', '연역법은 일반 원칙에서 개별 사례를 도출하는 추론이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演繹法' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '帰納法', 'きのうほう', '귀납법', 'N1', '명사', '帰納法は個別事例から一般法則を導く推論だ。', '귀납법은 개별 사례에서 일반 법칙을 도출하는 추론이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰納法' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '主観主義', 'しゅかんしゅぎ', '주관주의', 'N1', '명사', '主観主義は認識が主体に依存すると考える。', '주관주의는 인식이 주체에 의존한다고 본다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主観主義' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '客観主義', 'きゃっかんしゅぎ', '객관주의', 'N1', '명사', '客観主義は独立した真理の存在を認める立場だ。', '객관주의는 독립적인 진리의 존재를 인정하는 입장이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='客観主義' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '倫理観', 'りんりかん', '윤리관', 'N1', '명사', '科学者は強い倫理観を持つべきだ。', '과학자는 강한 윤리관을 가져야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='倫理観' AND jlpt_level='N1');

-- ============================================================
-- 동사 (Verbs) — 17語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '弾劾する', 'だんがいする', '탄핵하다', 'N1', '동사', '大統領を弾劾する手続きが始まった。', '대통령을 탄핵하는 절차가 시작되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='弾劾する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '徴兵する', 'ちょうへいする', '징병하다', 'N1', '동사', '国は18歳の若者を徴兵する制度を維持している。', '국가는 18세 청년을 징병하는 제도를 유지하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='徴兵する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '召喚する', 'しょうかんする', '소환하다', 'N1', '동사', '大使を本国に召喚して抗議の意を示した。', '대사를 본국으로 소환하여 항의의 뜻을 표했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='召喚する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '拘留する', 'こうりゅうする', '구류하다', 'N1', '동사', '容疑者を48時間拘留して取り調べた。', '용의자를 48시간 구류하여 조사했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拘留する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逓減する', 'ていげんする', '체감하다, 점차 줄다', 'N1', '동사', '投入量を増やすと限界生産性は逓減する。', '투입량을 늘리면 한계 생산성은 체감한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逓減する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逓増する', 'ていぞうする', '체증하다, 점차 늘다', 'N1', '동사', '固定費に対して変動費が逓増する構造だ。', '고정비에 대해 변동비가 체증하는 구조이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逓増する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '収奪する', 'しゅうだつする', '수탈하다', 'N1', '동사', '権力者が民衆の財産を収奪した。', '권력자가 민중의 재산을 수탈했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='収奪する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乖離する', 'かいりする', '괴리하다', 'N1', '동사', '理論と現実が大きく乖離している。', '이론과 현실이 크게 괴리되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乖離する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '帰納する', 'きのうする', '귀납하다', 'N1', '동사', '事例を帰納して法則を導き出す。', '사례를 귀납하여 법칙을 도출한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='帰納する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '演繹する', 'えんえきする', '연역하다', 'N1', '동사', '原理から個別の事実を演繹する。', '원리에서 개별 사실을 연역한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='演繹する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '瓦解する', 'がかいする', '와해되다', 'N1', '동사', '長年の体制が一夜にして瓦解した。', '오랜 체제가 하룻밤에 와해되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='瓦解する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '粛清する', 'しゅくせいする', '숙청하다', 'N1', '동사', '独裁者は反対派を粛清した。', '독재자는 반대파를 숙청했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粛清する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '失墜する', 'しっついする', '실추되다', 'N1', '동사', '不祥事で信頼が大きく失墜した。', '불상사로 신뢰가 크게 실추되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='失墜する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廃絶する', 'はいぜつする', '폐절하다', 'N1', '동사', '核兵器を廃絶することが国際的な目標だ。', '핵무기를 폐절하는 것이 국제적인 목표이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃絶する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '誹謗する', 'ひぼうする', '비방하다', 'N1', '동사', '根拠なく他人を誹謗することは違法だ。', '근거 없이 타인을 비방하는 것은 위법이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誹謗する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '糾合する', 'きゅうごうする', '규합하다', 'N1', '동사', '反対勢力を糾合して新党を結成した。', '반대 세력을 규합하여 신당을 결성했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='糾合する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '放逐する', 'ほうちくする', '추방하다', 'N1', '동사', '腐敗した官僚を政界から放逐した。', '부패한 관료를 정계에서 추방했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='放逐する' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '跋扈する', 'ばっこする', '발호하다, 횡행하다', 'N1', '동사', '汚職が跋扈する社会では法治が崩れる。', '비리가 횡행하는 사회에서는 법치가 무너진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='跋扈する' AND jlpt_level='N1');

-- ============================================================
-- な형용사 (な-Adjectives) — 19語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恒常的', 'こうじょうてき', '항상적, 지속적', 'N1', 'な형용사', '恒常的な赤字が財政を悪化させている。', '항상적인 적자가 재정을 악화시키고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恒常的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '漸進的', 'ぜんしんてき', '점진적', 'N1', 'な형용사', '漸進的な改革が現実的な選択肢だ。', '점진적인 개혁이 현실적인 선택지이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漸進的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '画期的', 'かっきてき', '획기적', 'N1', 'な형용사', '画期的な新薬が開発された。', '획기적인 신약이 개발되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='画期的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '欺瞞的', 'ぎまんてき', '기만적', 'N1', 'な형용사', '欺瞞的な広告表示が問題となった。', '기만적인 광고 표시가 문제가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='欺瞞的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '内在的', 'ないざいてき', '내재적', 'N1', 'な형용사', '内在的な矛盾が体制の崩壊を招いた。', '내재적인 모순이 체제의 붕괴를 초래했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='内在的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '外在的', 'がいざいてき', '외재적', 'N1', 'な형용사', '問題は外在的な要因によるものだった。', '문제는 외재적인 요인에 의한 것이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='外在的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '先験的', 'せんけんてき', '선험적, 아프리오리', 'N1', 'な형용사', '先験的な知識の存在をカントは認めた。', '선험적 지식의 존재를 칸트는 인정했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='先験的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恒久的', 'こうきゅうてき', '항구적, 영구적', 'N1', 'な형용사', '恒久的な平和の実現が課題だ。', '항구적인 평화 실현이 과제이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恒久的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暫定的', 'ざんていてき', '잠정적', 'N1', 'な형용사', '暫定的な措置として上限を設けた。', '잠정적인 조치로서 상한을 설정했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暫定的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '甚大', 'じんだい', '심대함, 막대함', 'N1', 'な형용사', '災害による甚大な被害が報告された。', '재해로 인한 심대한 피해가 보고되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='甚大' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '顕著', 'けんちょ', '현저함, 뚜렷함', 'N1', 'な형용사', '政策の効果が顕著な形で現れた。', '정책 효과가 현저한 형태로 나타났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顕著' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '卑俗', 'ひぞく', '저속함', 'N1', 'な형용사', '卑俗な表現は公共の場で避けるべきだ。', '저속한 표현은 공공장소에서 피해야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='卑俗' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '普遍的', 'ふへんてき', '보편적', 'N1', 'な형용사', '普遍的な価値観の共有が平和の基礎だ。', '보편적인 가치관의 공유가 평화의 기초이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='普遍的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '根本的', 'こんぽんてき', '근본적', 'N1', 'な형용사', '根本的な解決策なしに問題は繰り返す。', '근본적인 해결책 없이는 문제가 반복된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='根本的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '覇権的', 'はけんてき', '패권적', 'N1', 'な형용사', '覇権的な外交姿勢が周辺国を刺激した。', '패권적인 외교 자세가 주변국을 자극했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='覇権的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '先進的', 'せんしんてき', '선진적', 'N1', 'な형용사', '先進的な技術を取り入れた教育改革が進む。', '선진적인 기술을 도입한 교육개혁이 진행된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='先進的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '体系的', 'たいけいてき', '체계적', 'N1', 'な형용사', '体系的な知識の習得が専門家への道だ。', '체계적인 지식 습득이 전문가로 가는 길이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体系的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '客観的', 'きゃっかんてき', '객관적', 'N1', 'な형용사', '客観的な視点で事態を分析する必要がある。', '객관적인 시점으로 사태를 분석할 필요가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='客観的' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '主観的', 'しゅかんてき', '주관적', 'N1', 'な형용사', '主観的な判断では公正な評価はできない。', '주관적인 판단으로는 공정한 평가를 할 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主観的' AND jlpt_level='N1');

-- ============================================================
-- 부사 (Adverbs) — 8語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '漸次', 'ぜんじ', '점차, 서서히', 'N1', '부사', '規制は漸次緩和される方針だ。', '규제는 점차 완화될 방침이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='漸次' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '概して', 'がいして', '대체로, 일반적으로', 'N1', '부사', '概して言えば、この施策は成功だった。', '대체로 말하면 이 시책은 성공이었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='概して' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蓋し', 'けだし', '생각건대, 필경', 'N1', '부사', '蓋し、これが最善の選択であろう。', '생각건대 이것이 최선의 선택일 것이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蓋し' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '縷々と', 'るると', '조목조목, 상세히', 'N1', '부사', '経緯を縷々と説明した。', '경위를 조목조목 설명했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縷々と' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逐次', 'ちくじ', '순차적으로, 차례차례', 'N1', '부사', '情報を逐次更新して共有する。', '정보를 순차적으로 업데이트하여 공유한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逐次' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '詳らかに', 'つまびらかに', '상세하게, 명확하게', 'N1', '부사', '事実を詳らかにして説明した。', '사실을 상세하게 설명했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='詳らかに' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '爾来', 'じらい', '그 이후로, 이래', 'N1', '부사', '爾来、彼とは一度も会っていない。', '그 이후로 그와는 한 번도 만나지 않았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='爾来' AND jlpt_level='N1');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '等しく', 'ひとしく', '평등하게, 똑같이', 'N1', '부사', '法の下に等しく扱われる権利がある。', '법 앞에서 평등하게 대우받을 권리가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='等しく' AND jlpt_level='N1');
