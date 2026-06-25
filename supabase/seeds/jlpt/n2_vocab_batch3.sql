-- encoding: UTF-8
-- N2 語彙シード batch 3 (121語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: ビジネス・経済・仕事・金融・産業
-- 除外済み(既存474語): n2_vocab_words.txt + batch1 + batch2 全語
-- 品詞: 名詞69語・動詞33語・な형용사11語・副詞8語
-- 読み確認: 標準辞書(大辞泉・明鏡)準拠
-- 中複チェック済み: 予算/利益/損害/方針/体制/見込む/妥当/明確/柔軟/正確/慎重/有効/重大/貴重/概ね は除外

-- ============================================================
-- 名詞 (Nouns) — 67語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取引', 'とりひき', '거래', 'N2', '명사', '海外との取引が増えている。', '해외와의 거래가 늘고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取引' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '交渉', 'こうしょう', '교섭, 협상', 'N2', '명사', '価格交渉がうまくいった。', '가격 협상이 잘 됐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='交渉' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '契約', 'けいやく', '계약', 'N2', '명사', '契約書にサインした。', '계약서에 서명했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='契約' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '納期', 'のうき', '납기, 납품 기한', 'N2', '명사', '納期を守ることが信頼につながる。', '납기를 지키는 것이 신뢰로 이어진다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='納期' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発注', 'はっちゅう', '발주, 주문', 'N2', '명사', '部品の発注が遅れた。', '부품 발주가 늦어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発注' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受注', 'じゅちゅう', '수주, 주문 받음', 'N2', '명사', '受注件数が前月比で増えた。', '수주 건수가 전월 대비 늘었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受注' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕入れ', 'しいれ', '매입, 구매(재고용)', 'N2', '명사', '材料の仕入れ価格が上がった。', '재료 매입 가격이 올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕入れ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '在庫', 'ざいこ', '재고', 'N2', '명사', '在庫を確認してから発送する。', '재고를 확인하고 나서 발송한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='在庫' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '流通', 'りゅうつう', '유통', 'N2', '명사', '流通コストを見直した。', '유통 비용을 재검토했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='流通' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '販売', 'はんばい', '판매', 'N2', '명사', '新商品の販売を開始した。', '신상품 판매를 시작했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='販売' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '営業', 'えいぎょう', '영업', 'N2', '명사', '営業成績が目標を超えた。', '영업 실적이 목표를 초과했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='営業' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '顧客', 'こきゃく', '고객', 'N2', '명사', '顧客満足度を向上させる。', '고객 만족도를 향상시키다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='顧客' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '得意先', 'とくいさき', '거래처, 단골', 'N2', '명사', '得意先への訪問を優先する。', '거래처 방문을 우선시하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='得意先' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取引先', 'とりひきさき', '거래처', 'N2', '명사', '取引先との関係を大切にする。', '거래처와의 관계를 소중히 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取引先' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '入札', 'にゅうさつ', '입찰', 'N2', '명사', '公共工事の入札に参加した。', '공공 공사 입찰에 참가했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='入札' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '請求', 'せいきゅう', '청구', 'N2', '명사', '請求書を送付した。', '청구서를 발송했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='請求' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '支払い', 'しはらい', '지불, 납부', 'N2', '명사', '支払いは月末までにお願いします。', '지불은 월말까지 부탁드립니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='支払い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '報酬', 'ほうしゅう', '보수, 사례금', 'N2', '명사', '成果に応じた報酬を支払う。', '성과에 따른 보수를 지불하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='報酬' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '給与', 'きゅうよ', '급여', 'N2', '명사', '給与明細を確認する。', '급여 명세서를 확인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='給与' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '賃金', 'ちんぎん', '임금', 'N2', '명사', '最低賃金が引き上げられた。', '최저 임금이 인상되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='賃金' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '昇給', 'しょうきゅう', '임금 인상, 승급', 'N2', '명사', '今年の昇給率は三パーセントだ。', '올해 임금 인상률은 3퍼센트이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='昇給' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '昇進', 'しょうしん', '승진', 'N2', '명사', '昇進の知らせを受けた。', '승진 소식을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='昇進' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '異動', 'いどう', '이동, 전근, 전배', 'N2', '명사', '来月から別の部署に異動になった。', '다음 달부터 다른 부서로 전배되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='異動' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '採用', 'さいよう', '채용', 'N2', '명사', '新卒採用を積極的に行う。', '신입 채용을 적극적으로 실시하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='採用' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '解雇', 'かいこ', '해고', 'N2', '명사', '不当解雇として訴えた。', '부당 해고로 소송을 제기했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解雇' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '退職', 'たいしょく', '퇴직', 'N2', '명사', '退職金の計算をしてもらった。', '퇴직금 계산을 해달라고 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='退職' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出張', 'しゅっちょう', '출장', 'N2', '명사', '来週は大阪へ出張がある。', '다음 주에는 오사카로 출장이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出張' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '残業', 'ざんぎょう', '잔업, 야근', 'N2', '명사', '残業が続いて疲れた。', '야근이 계속되어 피곤하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='残業' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '有給', 'ゆうきゅう', '유급(휴가)', 'N2', '명사', '有給休暇を取得した。', '유급 휴가를 취득했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='有給' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '会計', 'かいけい', '회계', 'N2', '명사', '会計処理を担当している。', '회계 처리를 담당하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='会計' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '決算', 'けっさん', '결산', 'N2', '명사', '期末決算の準備が始まった。', '기말 결산 준비가 시작되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='決算' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '融資', 'ゆうし', '융자, 대출', 'N2', '명사', '銀行から融資を受けた。', '은행으로부터 융자를 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='融資' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '借入', 'かりいれ', '차입, 대출', 'N2', '명사', '借入金の返済計画を立てた。', '차입금 상환 계획을 세웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='借入' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '利子', 'りし', '이자', 'N2', '명사', '利子が発生するので注意する。', '이자가 발생하므로 주의한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='利子' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '金利', 'きんり', '금리', 'N2', '명사', '金利が上昇すると住宅ローンに影響する。', '금리가 상승하면 주택 대출에 영향을 미친다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='金利' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '株式', 'かぶしき', '주식', 'N2', '명사', '株式を取得して株主になった。', '주식을 취득하여 주주가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='株式' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '投資', 'とうし', '투자', 'N2', '명사', '不動産への投資を検討している。', '부동산 투자를 검토하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='投資' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '損益', 'そんえき', '손익', 'N2', '명사', '損益計算書を作成した。', '손익계산서를 작성했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='損益' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '赤字', 'あかじ', '적자', 'N2', '명사', '赤字続きで経営が苦しい。', '적자가 이어져 경영이 어렵다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='赤字' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '黒字', 'くろじ', '흑자', 'N2', '명사', '三年ぶりに黒字を達成した。', '3년 만에 흑자를 달성했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='黒字' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不況', 'ふきょう', '불황', 'N2', '명사', '不況が長引いて企業の倒産が増えた。', '불황이 장기화되어 기업 도산이 늘었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不況' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '好況', 'こうきょう', '호황', 'N2', '명사', '好況期に積極的な設備投資をした。', '호황기에 적극적인 설비 투자를 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='好況' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '景気', 'けいき', '경기', 'N2', '명사', '景気が回復してきた。', '경기가 회복되어 왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='景気' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物価', 'ぶっか', '물가', 'N2', '명사', '物価の上昇が家計を圧迫している。', '물가 상승이 가계를 압박하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物価' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '市場', 'しじょう', '시장(경제)', 'N2', '명사', '市場の動向を調査する。', '시장 동향을 조사하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='市場' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '競合', 'きょうごう', '경쟁, 경합', 'N2', '명사', '競合他社との差別化が課題だ。', '경쟁사와의 차별화가 과제이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='競合' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'シェア', 'シェア', '시장 점유율, 공유', 'N2', '명사', '市場シェアを拡大する戦略だ。', '시장 점유율을 확대하는 전략이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='シェア' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '合併', 'がっぺい', '합병', 'N2', '명사', '二社が合併して新会社を設立した。', '두 회사가 합병하여 신회사를 설립했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合併' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '倒産', 'とうさん', '도산, 파산', 'N2', '명사', '取引先が倒産して困った。', '거래처가 도산하여 곤란했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='倒産' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '設備', 'せつび', '설비, 시설', 'N2', '명사', '工場の設備を更新した。', '공장 설비를 갱신했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='設備' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生産', 'せいさん', '생산', 'N2', '명사', '生産効率を高める取り組みをした。', '생산 효율을 높이는 활동을 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生産' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '製造', 'せいぞう', '제조', 'N2', '명사', '自動車製造の工程を見学した。', '자동차 제조 공정을 견학했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='製造' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輸出', 'ゆしゅつ', '수출', 'N2', '명사', '輸出額が過去最高を記録した。', '수출액이 역대 최고를 기록했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輸出' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輸入', 'ゆにゅう', '수입(물품)', 'N2', '명사', '食料の輸入依存度が高い。', '식료품 수입 의존도가 높다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輸入' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '貿易', 'ぼうえき', '무역', 'N2', '명사', '自由貿易の推進を議論した。', '자유 무역 추진을 논의했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='貿易' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '為替', 'かわせ', '환율, 외환', 'N2', '명사', '為替レートの変動に注意する。', '환율 변동에 주의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='為替' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '規制', 'きせい', '규제', 'N2', '명사', '環境規制が強化された。', '환경 규제가 강화되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規制' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '許可', 'きょか', '허가', 'N2', '명사', '建設の許可が下りた。', '건설 허가가 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='許可' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '部門', 'ぶもん', '부문, 부서', 'N2', '명사', '技術部門と営業部門が連携する。', '기술 부문과 영업 부문이 연계하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='部門' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '組織', 'そしき', '조직', 'N2', '명사', '組織の改革を進めている。', '조직 개혁을 추진하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='組織' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '株主', 'かぶぬし', '주주', 'N2', '명사', '株主総会が来月開催される。', '주주총회가 다음 달 개최된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='株主' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '資本', 'しほん', '자본', 'N2', '명사', '資本を増強して事業を拡大する。', '자본을 강화하여 사업을 확대하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='資本' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '税金', 'ぜいきん', '세금', 'N2', '명사', '税金の申告を忘れずに行う。', '세금 신고를 잊지 않고 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='税金' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '補助金', 'ほじょきん', '보조금', 'N2', '명사', '政府から補助金を受け取った。', '정부로부터 보조금을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='補助金' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '経費', 'けいひ', '경비, 비용', 'N2', '명사', '経費の精算書を提出した。', '경비 정산서를 제출했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='経費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '派遣', 'はけん', '파견', 'N2', '명사', '派遣社員として働いている。', '파견 사원으로 일하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='派遣' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '業績', 'ぎょうせき', '업적, 실적', 'N2', '명사', '会社の業績が向上した。', '회사 실적이 향상되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='業績' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '原価', 'げんか', '원가', 'N2', '명사', '原価を下げて利益を増やす。', '원가를 낮춰 이익을 늘리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='原価' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '納税', 'のうぜい', '납세', 'N2', '명사', '納税の義務を果たす。', '납세의 의무를 다하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='納税' AND jlpt_level='N2');

-- ============================================================
-- 동사 (Verbs) — 34語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '交渉する', 'こうしょうする', '협상하다, 교섭하다', 'N2', '동사', '条件について交渉する。', '조건에 대해 협상하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='交渉する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '契約する', 'けいやくする', '계약하다', 'N2', '동사', '正式に契約することになった。', '정식으로 계약하게 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='契約する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '採用する', 'さいようする', '채용하다', 'N2', '동사', '優秀な人材を採用する。', '우수한 인재를 채용하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='採用する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '販売する', 'はんばいする', '판매하다', 'N2', '동사', '新製品を全国で販売する。', '신제품을 전국에서 판매하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='販売する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '投資する', 'とうしする', '투자하다', 'N2', '동사', '将来のために投資する。', '미래를 위해 투자하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='投資する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '倒産する', 'とうさんする', '도산하다', 'N2', '동사', '資金難で会社が倒産した。', '자금난으로 회사가 도산했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='倒産する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '合併する', 'がっぺいする', '합병하다', 'N2', '동사', '二社が合併することになった。', '두 회사가 합병하게 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合併する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '規制する', 'きせいする', '규제하다', 'N2', '동사', '排気ガスを規制する法律が施行された。', '배기가스를 규제하는 법률이 시행되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規制する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輸出する', 'ゆしゅつする', '수출하다', 'N2', '동사', '自動車を海外に輸出する。', '자동차를 해외에 수출하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輸出する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輸入する', 'ゆにゅうする', '수입하다(물품)', 'N2', '동사', '石油を中東から輸入する。', '석유를 중동에서 수입하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輸入する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '製造する', 'せいぞうする', '제조하다', 'N2', '동사', '部品を国内で製造する。', '부품을 국내에서 제조하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='製造する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生産する', 'せいさんする', '생산하다', 'N2', '동사', '工場でロボットが部品を生産する。', '공장에서 로봇이 부품을 생산하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生産する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '負担する', 'ふたんする', '부담하다', 'N2', '동사', '費用は会社が負担する。', '비용은 회사가 부담하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='負担する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '請求する', 'せいきゅうする', '청구하다', 'N2', '동사', '修理費を請求する。', '수리비를 청구하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='請求する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '承認する', 'しょうにんする', '승인하다', 'N2', '동사', '上司が計画を承認した。', '상사가 계획을 승인했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='承認する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '許可する', 'きょかする', '허가하다', 'N2', '동사', '申請を審査して許可する。', '신청을 심사하여 허가하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='許可する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '派遣する', 'はけんする', '파견하다', 'N2', '동사', '現地に担当者を派遣する。', '현지에 담당자를 파견하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='派遣する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '設立する', 'せつりつする', '설립하다', 'N2', '동사', '新会社を設立した。', '신회사를 설립했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='設立する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '廃止する', 'はいしする', '폐지하다', 'N2', '동사', '古い制度を廃止した。', '낡은 제도를 폐지했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='廃止する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '委託する', 'いたくする', '위탁하다, 맡기다', 'N2', '동사', '経理業務を外部に委託する。', '경리 업무를 외부에 위탁하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='委託する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '雇用する', 'こようする', '고용하다', 'N2', '동사', '新たにスタッフを雇用する。', '새로 스태프를 고용하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='雇用する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '下回る', 'したまわる', '밑돌다, 하회하다', 'N2', '동사', '売上が目標を下回った。', '매출이 목표를 밑돌았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='下回る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '上回る', 'うわまわる', '웃돌다, 상회하다', 'N2', '동사', '予想を上回る結果が出た。', '예상을 웃도는 결과가 나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='上回る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '落ち込む', 'おちこむ', '침체되다, 떨어지다', 'N2', '동사', '景気が落ち込んでいる。', '경기가 침체되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='落ち込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '盛り上がる', 'もりあがる', '고조되다, 활기를 띠다', 'N2', '동사', '会議の議論が盛り上がった。', '회의 논의가 고조되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='盛り上がる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引き下げる', 'ひきさげる', '인하하다, 낮추다', 'N2', '동사', '手数料を引き下げた。', '수수료를 인하했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き下げる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引き上げる', 'ひきあげる', '인상하다, 올리다', 'N2', '동사', '価格を引き上げることになった。', '가격을 인상하게 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引き上げる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '差し引く', 'さしひく', '공제하다, 빼다', 'N2', '동사', '経費を差し引いた金額が手取りだ。', '경비를 공제한 금액이 실수령액이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='差し引く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見積もる', 'みつもる', '견적하다, 산출하다', 'N2', '동사', 'コストを事前に見積もる。', '비용을 사전에 산출하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見積もる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '指示する', 'しじする', '지시하다', 'N2', '동사', '上司から指示を受けた。', '상사로부터 지시를 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='指示する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '報告する', 'ほうこくする', '보고하다', 'N2', '동사', '進捗状況を上司に報告する。', '진행 상황을 상사에게 보고하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='報告する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '相談する', 'そうだんする', '상담하다, 의논하다', 'N2', '동사', '問題が起きたらすぐに相談する。', '문제가 생기면 바로 상담하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='相談する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '節約する', 'せつやくする', '절약하다', 'N2', '동사', '経費を節約する工夫をする。', '경비를 절약하는 방법을 강구하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節約する' AND jlpt_level='N2');

-- ============================================================
-- な형용사 (な-Adjectives) — 11語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '迅速', 'じんそく', '신속함', 'N2', 'な형용사', '迅速な対応が評価された。', '신속한 대응이 평가받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='迅速' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '円満', 'えんまん', '원만함', 'N2', 'な형용사', '円満な解決を目指す。', '원만한 해결을 목표로 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='円満' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '緊急', 'きんきゅう', '긴급함', 'N2', 'な형용사', '緊急の案件が入った。', '긴급한 안건이 들어왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緊急' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不可欠', 'ふかけつ', '불가결함, 필수적임', 'N2', 'な형용사', '信頼は取引に不可欠だ。', '신뢰는 거래에 불가결하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不可欠' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '合理的', 'ごうりてき', '합리적', 'N2', 'な형용사', '合理的な判断を下した。', '합리적인 판단을 내렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合理的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '抜本的', 'ばっぽんてき', '근본적, 발본적', 'N2', 'な형용사', '抜本的な改革が必要だ。', '근본적인 개혁이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='抜本的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '持続的', 'じぞくてき', '지속적', 'N2', 'な형용사', '持続的な成長を目指す。', '지속적인 성장을 목표로 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='持続的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '包括的', 'ほうかつてき', '포괄적', 'N2', 'な형용사', '包括的な支援策を打ち出した。', '포괄적인 지원책을 내놓았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='包括的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '安定的', 'あんていてき', '안정적', 'N2', 'な형용사', '安定的な収入を得る。', '안정적인 수입을 얻다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安定的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '戦略的', 'せんりゃくてき', '전략적', 'N2', 'な형용사', '戦略的に事業を展開する。', '전략적으로 사업을 전개하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='戦略的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '優先的', 'ゆうせんてき', '우선적', 'N2', 'な형용사', '重要な案件を優先的に処理する。', '중요한 안건을 우선적으로 처리하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='優先的' AND jlpt_level='N2');

-- ============================================================
-- 副詞 (Adverbs) — 8語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '一括', 'いっかつ', '일괄', 'N2', '부사', '費用を一括で支払う。', '비용을 일괄로 지불하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一括' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '順次', 'じゅんじ', '순차적으로', 'N2', '부사', '順次対応してまいります。', '순차적으로 대응해 나가겠습니다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='順次' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '随時', 'ずいじ', '수시로, 언제든지', 'N2', '부사', '随時ご連絡ください。', '수시로 연락해 주십시오.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='随時' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '当面', 'とうめん', '당분간, 당면', 'N2', '부사', '当面はこの方針で進める。', '당분간은 이 방침으로 진행하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='当面' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '従来', 'じゅうらい', '종래, 기존', 'N2', '부사', '従来の方法を見直す時期だ。', '기존 방법을 재검토할 시기이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='従来' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '早急', 'さっきゅう', '조속히, 서둘러', 'N2', '부사', '早急に対応する必要がある。', '조속히 대응할 필요가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='早急' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '一概に', 'いちがいに', '일괄적으로, 단정적으로', 'N2', '부사', '一概に悪いとは言えない。', '일괄적으로 나쁘다고는 말할 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='一概に' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大幅に', 'おおはばに', '대폭, 크게', 'N2', '부사', '売上が大幅に増加した。', '매출이 대폭 증가했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大幅に' AND jlpt_level='N2');
