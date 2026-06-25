-- encoding: UTF-8
-- N2 語彙シード batch 5 (120語)
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- テーマ: 科学・技術・IT・情報・研究・交通
-- 除外済み(既存語): 技術, 情報, 研究, 産業, 機能, 普及, 画期的, 導入する, 拡大する,
--   発展する, 発表する, 改善する, 処理する, 管理, 活用する, 浸透, 浸透する, 知識,
--   基準, 構造, 概念, 概要, 効果, 効果的, 有効, 明確, 正確, 段階, 過程, 手段, 手順,
--   仕組み, 維持する, 削減, 増加する, 減少する, 比較する, 確認する, 把握, 基づく 等
-- 読み確認: 標準辞書準拠

-- ============================================================
-- 名詞 — 科学・研究 (30語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実験', 'じっけん', '실험', 'N2', '명사', '新しい薬の実験を行う。', '새로운 약의 실험을 실시한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実験' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '観測', 'かんそく', '관측', 'N2', '명사', '気象衛星で観測したデータを分析する。', '기상위성으로 관측한 데이터를 분석한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='観測' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '分析', 'ぶんせき', '분석', 'N2', '명사', 'データの分析結果を報告する。', '데이터 분석 결과를 보고한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分析' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仮説', 'かせつ', '가설', 'N2', '명사', '仮説を立てて実験で検証する。', '가설을 세워 실험으로 검증한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仮説' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '検証', 'けんしょう', '검증', 'N2', '명사', '理論の検証に時間がかかる。', '이론의 검증에 시간이 걸린다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='検証' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '測定', 'そくてい', '측정', 'N2', '명사', '温度の測定を定期的に行う。', '온도 측정을 정기적으로 실시한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='測定' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '試料', 'しりょう', '시료, 샘플', 'N2', '명사', '試料を顕微鏡で観察する。', '시료를 현미경으로 관찰한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='試料' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物質', 'ぶっしつ', '물질', 'N2', '명사', '有害物質が検出された。', '유해물질이 검출되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物質' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '成分', 'せいぶん', '성분', 'N2', '명사', '食品の成分を表示する。', '식품의 성분을 표시한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='成分' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '反応', 'はんのう', '반응', 'N2', '명사', '化学反応が激しく起きた。', '화학반응이 격렬하게 일어났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='反応' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '合成', 'ごうせい', '합성', 'N2', '명사', '化学合成によって新物質を作る。', '화학 합성으로 새로운 물질을 만든다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='合成' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '原理', 'げんり', '원리', 'N2', '명사', '物理の基本原理を学ぶ。', '물리의 기본원리를 배운다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='原理' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '法則', 'ほうそく', '법칙', 'N2', '명사', '自然の法則に従って動く。', '자연의 법칙에 따라 움직인다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='法則' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '理論', 'りろん', '이론', 'N2', '명사', '新しい理論を提唱する。', '새로운 이론을 제창한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='理論' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '論文', 'ろんぶん', '논문', 'N2', '명사', '学術論文を投稿する。', '학술 논문을 투고한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論文' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '寄与', 'きよ', '기여', 'N2', '명사', '新技術の発展に寄与する。', '신기술의 발전에 기여한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寄与' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発見', 'はっけん', '발견', 'N2', '명사', '新種の生物を発見した。', '새로운 종의 생물을 발견했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発見' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '解明', 'かいめい', '규명, 해명', 'N2', '명사', '原因の解明に取り組む。', '원인 규명에 힘쓴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解明' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '学術', 'がくじゅつ', '학술', 'N2', '명사', '学術的な観点から考察する。', '학술적인 관점에서 고찰한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='学術' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '考察', 'こうさつ', '고찰', 'N2', '명사', '実験結果を詳しく考察する。', '실험 결과를 자세히 고찰한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='考察' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '応用', 'おうよう', '응용', 'N2', '명사', '基礎研究を応用に結びつける。', '기초연구를 응용으로 연결한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='応用' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '開発', 'かいはつ', '개발', 'N2', '명사', '新製品の開発に着手する。', '신제품 개발에 착수한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='開発' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '革新', 'かくしん', '혁신', 'N2', '명사', '技術革新が産業を変える。', '기술혁신이 산업을 바꾼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='革新' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '改良', 'かいりょう', '개량', 'N2', '명사', '製品の改良を重ねる。', '제품의 개량을 거듭한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='改良' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '特許', 'とっきょ', '특허', 'N2', '명사', '発明した技術の特許を取得する。', '발명한 기술의 특허를 취득한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='特許' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '精度', 'せいど', '정밀도, 정확도', 'N2', '명사', '測定の精度を高める。', '측정의 정밀도를 높인다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '誤差', 'ごさ', '오차', 'N2', '명사', '実験の誤差を最小限に抑える。', '실험의 오차를 최소한으로 억제한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誤差' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '比重', 'ひじゅう', '비중', 'N2', '명사', '研究開発の比重を高める。', '연구개발의 비중을 높인다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='比重' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実用', 'じつよう', '실용', 'N2', '명사', '実用化に向けて研究を進める。', '실용화를 향해 연구를 진행한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実用' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '手法', 'しゅほう', '수법, 방법론', 'N2', '명사', '新しい分析手法を開発する。', '새로운 분석 수법을 개발한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='手法' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — IT・情報・通信 (30語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '通信', 'つうしん', '통신', 'N2', '명사', '高速通信網が整備された。', '고속 통신망이 정비되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通信' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '回線', 'かいせん', '회선', 'N2', '명사', '光回線でインターネットに接続する。', '광회선으로 인터넷에 접속한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='回線' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '接続', 'せつぞく', '접속, 연결', 'N2', '명사', 'ネットワークへの接続が切れた。', '네트워크 접속이 끊어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='接続' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '端末', 'たんまつ', '단말기, 단말', 'N2', '명사', 'スマートフォンは携帯端末の一種だ。', '스마트폰은 휴대단말기의 일종이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='端末' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '装置', 'そうち', '장치, 기기', 'N2', '명사', '安全装置が正常に作動する。', '안전 장치가 정상적으로 작동한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='装置' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '機器', 'きき', '기기, 기계장치', 'N2', '명사', '精密機器を丁寧に扱う。', '정밀기기를 정중히 다룬다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='機器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '操作', 'そうさ', '조작', 'N2', '명사', '機械の操作方法を覚える。', '기계의 조작 방법을 익힌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='操作' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '入力', 'にゅうりょく', '입력', 'N2', '명사', 'キーボードからデータを入力する。', '키보드에서 데이터를 입력한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='入力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出力', 'しゅつりょく', '출력', 'N2', '명사', '結果をプリンターで出力する。', '결과를 프린터로 출력한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '記録', 'きろく', '기록', 'N2', '명사', 'データを記録媒体に保存する。', '데이터를 기록매체에 저장한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='記録' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '保存', 'ほぞん', '보존, 저장', 'N2', '명사', '作業中のファイルを保存する。', '작업 중인 파일을 저장한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='保存' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '送信', 'そうしん', '송신, 전송', 'N2', '명사', 'メールを一斉送信する。', '이메일을 일제히 전송한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='送信' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受信', 'じゅしん', '수신', 'N2', '명사', 'メールの受信を確認する。', '이메일 수신을 확인한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受信' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暗号', 'あんごう', '암호', 'N2', '명사', 'データを暗号化して送信する。', '데이터를 암호화하여 송신한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暗号' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '認証', 'にんしょう', '인증', 'N2', '명사', '二段階認証でセキュリティを強化する。', '2단계 인증으로 보안을 강화한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='認証' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '障害', 'しょうがい', '장애, 고장', 'N2', '명사', 'システム障害が発生した。', '시스템 장애가 발생했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='障害' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '復旧', 'ふっきゅう', '복구', 'N2', '명사', '停電後の復旧作業を急ぐ。', '정전 후 복구 작업을 서두른다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='復旧' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '更新', 'こうしん', '업데이트, 갱신', 'N2', '명사', 'ソフトウェアを最新版に更新する。', '소프트웨어를 최신 버전으로 업데이트한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='更新' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '変換', 'へんかん', '변환', 'N2', '명사', 'データ形式を変換する。', '데이터 형식을 변환한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変換' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '容量', 'ようりょう', '용량', 'N2', '명사', 'ストレージの容量が足りなくなった。', '스토리지 용량이 부족해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='容量' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '速度', 'そくど', '속도', 'N2', '명사', '通信速度が大幅に向上した。', '통신속도가 대폭 향상되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='速度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '効率', 'こうりつ', '효율', 'N2', '명사', '作業効率を上げる方法を考える。', '작업 효율을 높이는 방법을 생각한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='効率' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '自動化', 'じどうか', '자동화', 'N2', '명사', '業務の自動化で人件費を削減する。', '업무의 자동화로 인건비를 절감한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自動化' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '設計', 'せっけい', '설계', 'N2', '명사', 'システムの設計書を作成する。', '시스템의 설계서를 작성한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='設計' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '互換', 'ごかん', '호환', 'N2', '명사', '旧バージョンとの互換性を保つ。', '구버전과의 호환성을 유지한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='互換' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '仕様', 'しよう', '사양, 스펙', 'N2', '명사', '製品の仕様書を確認する。', '제품의 사양서를 확인한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='仕様' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '規格', 'きかく', '규격, 표준', 'N2', '명사', '国際規格に準拠した製品を作る。', '국제규격에 준거한 제품을 만든다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='規格' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '圧縮', 'あっしゅく', '압축', 'N2', '명사', 'ファイルを圧縮して送る。', '파일을 압축해서 보낸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='圧縮' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '複製', 'ふくせい', '복제', 'N2', '명사', 'データの複製を作っておく。', '데이터의 복제를 만들어 둔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='複製' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '媒体', 'ばいたい', '매체', 'N2', '명사', '記録媒体にバックアップを取る。', '기록 매체에 백업을 받는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='媒体' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 交通・輸送 (20語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '路線', 'ろせん', '노선', 'N2', '명사', '新しい路線が開通した。', '새로운 노선이 개통되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='路線' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '運行', 'うんこう', '운행', 'N2', '명사', '電車の運行状況を確認する。', '전철 운행 상황을 확인한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='運行' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '渋滞', 'じゅうたい', '정체, 교통 혼잡', 'N2', '명사', '道路が渋滞していて遅刻した。', '도로가 정체되어 지각했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='渋滞' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乗車', 'じょうしゃ', '승차', 'N2', '명사', '乗車口から順番に乗る。', '승차구에서 순서대로 탄다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗車' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '降車', 'こうしゃ', '하차', 'N2', '명사', '次の停留所で降車する。', '다음 정류장에서 하차한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='降車' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輸送', 'ゆそう', '수송, 운송', 'N2', '명사', '物資の輸送手段を確保する。', '물자의 수송 수단을 확보한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輸送' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物流', 'ぶつりゅう', '물류', 'N2', '명사', '効率的な物流システムを構築する。', '효율적인 물류 시스템을 구축한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物流' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '航路', 'こうろ', '항로', 'N2', '명사', '定期航路の運航スケジュールを確認する。', '정기항로의 운항 스케줄을 확인한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='航路' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '航空', 'こうくう', '항공', 'N2', '명사', '航空機の運航が再開された。', '항공기 운항이 재개되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='航空' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '燃料', 'ねんりょう', '연료', 'N2', '명사', '燃料の消費を抑える技術を開発する。', '연료 소비를 억제하는 기술을 개발한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='燃料' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '排気', 'はいき', '배기', 'N2', '명사', '排気ガスの規制が強化された。', '배기가스 규제가 강화되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='排気' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '整備', 'せいび', '정비', 'N2', '명사', '車の定期整備を怠らない。', '차의 정기정비를 게을리하지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='整備' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乗り換え', 'のりかえ', '환승', 'N2', '명사', '新宿で乗り換えが必要だ。', '신주쿠에서 환승이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乗り換え' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発着', 'はっちゃく', '발착', 'N2', '명사', '飛行機の発着時刻を確認する。', '비행기 발착 시각을 확인한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発着' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '延着', 'えんちゃく', '지연 도착, 연착', 'N2', '명사', '悪天候で列車が延着した。', '악천후로 열차가 연착했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='延着' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '迂回', 'うかい', '우회', 'N2', '명사', '工事のため迂回路を通る。', '공사로 인해 우회로를 통한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='迂回' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '架橋', 'かきょう', '가교, 교량 건설', 'N2', '명사', '河川に架橋工事が始まった。', '하천에 교량 공사가 시작되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='架橋' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '建設', 'けんせつ', '건설', 'N2', '명사', '新幹線の建設計画が発表された。', '신칸센 건설 계획이 발표되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='建設' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '設備', 'せつび', '설비', 'N2', '명사', '最新設備を導入した工場だ。', '최신 설비를 도입한 공장이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='設備' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '運賃', 'うんちん', '운임, 요금', 'N2', '명사', '電車の運賃が値上がりした。', '전철 운임이 올랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='運賃' AND jlpt_level='N2');

-- ============================================================
-- 動詞 (Verbs) — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '分析する', 'ぶんせきする', '분석하다', 'N2', '동사', 'データを詳細に分析する。', '데이터를 상세히 분석한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='分析する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '観察する', 'かんさつする', '관찰하다', 'N2', '동사', '細胞の変化を観察する。', '세포의 변화를 관찰한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='観察する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '測定する', 'そくていする', '측정하다', 'N2', '동사', '気温を正確に測定する。', '기온을 정확하게 측정한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='測定する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '設計する', 'せっけいする', '설계하다', 'N2', '동사', '効率的なシステムを設計する。', '효율적인 시스템을 설계한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='設計する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '構築する', 'こうちくする', '구축하다', 'N2', '동사', 'セキュリティ体制を構築する。', '보안 체제를 구축한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='構築する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '搭載する', 'とうさいする', '탑재하다', 'N2', '동사', '最新のAIを搭載したスマートフォン。', '최신 AI를 탑재한 스마트폰.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='搭載する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '接続する', 'せつぞくする', '접속하다, 연결하다', 'N2', '동사', 'サーバーにリモートで接続する。', '서버에 원격으로 접속한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='接続する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '操作する', 'そうさする', '조작하다', 'N2', '동사', 'ドローンを遠隔操作する。', '드론을 원격조작한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='操作する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '更新する', 'こうしんする', '업데이트하다, 갱신하다', 'N2', '동사', 'アプリを定期的に更新する。', '앱을 정기적으로 업데이트한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='更新する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '開発する', 'かいはつする', '개발하다', 'N2', '동사', '新技術を開発して事業化する。', '신기술을 개발하여 사업화한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='開発する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '実装する', 'じっそうする', '구현하다, 탑재하다', 'N2', '동사', '新機能をシステムに実装する。', '새 기능을 시스템에 구현한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='実装する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '統合する', 'とうごうする', '통합하다', 'N2', '동사', '複数のシステムを一つに統合する。', '여러 시스템을 하나로 통합한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='統合する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '検出する', 'けんしゅつする', '검출하다', 'N2', '동사', 'ウイルスを早期に検出する。', '바이러스를 조기에 검출한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='検出する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '変換する', 'へんかんする', '변환하다', 'N2', '동사', '音声をテキストに変換する。', '음성을 텍스트로 변환한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='変換する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '解析する', 'かいせきする', '해석하다, 분석하다', 'N2', '동사', 'ログデータを解析する。', '로그 데이터를 해석한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='解析する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '運搬する', 'うんぱんする', '운반하다', 'N2', '동사', '重い荷物をトラックで運搬する。', '무거운 짐을 트럭으로 운반한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='運搬する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輸出する', 'ゆしゅつする', '수출하다', 'N2', '동사', '製品を海外に輸出する。', '제품을 해외에 수출한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輸出する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '輸入する', 'ゆにゅうする', '수입하다', 'N2', '동사', '原材料を海外から輸入する。', '원재료를 해외에서 수입한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='輸入する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発信する', 'はっしんする', '발신하다, 발송하다', 'N2', '동사', '世界に向けて情報を発信する。', '세계를 향해 정보를 발신한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発信する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '整備する', 'せいびする', '정비하다', 'N2', '동사', 'インフラを整備する。', '인프라를 정비한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='整備する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '保護する', 'ほごする', '보호하다', 'N2', '동사', '個人情報を適切に保護する。', '개인정보를 적절히 보호한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='保護する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '暗号化する', 'あんごうかする', '암호화하다', 'N2', '동사', '通信データを暗号化する。', '통신 데이터를 암호화한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='暗号化する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '省エネする', 'しょうえねする', '에너지를 절약하다', 'N2', '동사', '家電を省エネ化して電気代を減らす。', '가전을 에너지 절약형으로 바꿔 전기요금을 줄인다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='省エネする' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '充電する', 'じゅうでんする', '충전하다', 'N2', '동사', 'スマートフォンを夜間に充電する。', '스마트폰을 야간에 충전한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='充電する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '走行する', 'そうこうする', '주행하다', 'N2', '동사', '自動運転車が安全に走行する。', '자율주행차가 안전하게 주행한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='走行する' AND jlpt_level='N2');

-- ============================================================
-- い형용사・な형용사・副詞 (15語)
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '高度', 'こうど', '고도, 고차원', 'N2', 'な형용사', '高度な技術力が求められる。', '고도의 기술력이 요구된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='高度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '精密', 'せいみつ', '정밀', 'N2', 'な형용사', '精密な計算が必要な作業だ。', '정밀한 계산이 필요한 작업이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='精密' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '迅速', 'じんそく', '신속', 'N2', 'な형용사', '迅速な対応が求められる。', '신속한 대응이 요구된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='迅速' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '安定', 'あんてい', '안정', 'N2', 'な형용사', '電力供給を安定させる。', '전력 공급을 안정시킨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安定' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '先端', 'せんたん', '첨단', 'N2', 'な형용사', '先端技術を駆使した製品だ。', '첨단 기술을 구사한 제품이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='先端' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '大幅', 'おおはば', '대폭', 'N2', 'な형용사', 'コストを大幅に削減できた。', '비용을 대폭 절감할 수 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='大幅' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '急速', 'きゅうそく', '급속', 'N2', 'な형용사', 'AI技術が急速に発展している。', 'AI 기술이 급속하게 발전하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急速' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '均一', 'きんいつ', '균일', 'N2', 'な형용사', '製品の品質を均一に保つ。', '제품의 품질을 균일하게 유지한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='均一' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '省エネ', 'しょうえね', '에너지 절약', 'N2', 'な형용사', '省エネ型の家電を選ぶ。', '에너지 절약형 가전을 선택한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='省エネ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '急激', 'きゅうげき', '급격', 'N2', 'な형용사', '気温が急激に低下した。', '기온이 급격하게 하강했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='急激' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逐次', 'ちくじ', '순차적으로, 차례로', 'N2', '부사', '情報を逐次更新する。', '정보를 순차적으로 업데이트한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='逐次' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '自動的', 'じどうてき', '자동적으로', 'N2', '부사', 'システムが自動的にバックアップを取る。', '시스템이 자동적으로 백업을 받는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='自動的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '定期的', 'ていきてき', '정기적으로', 'N2', '부사', 'ソフトウェアを定期的に更新する。', '소프트웨어를 정기적으로 업데이트한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='定期的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '段階的', 'だんかいてき', '단계적으로', 'N2', '부사', '計画を段階的に実行する。', '계획을 단계적으로 실행한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='段階的' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '継続的', 'けいぞくてき', '지속적으로', 'N2', '부사', '継続的にモニタリングする。', '지속적으로 모니터링한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='継続的' AND jlpt_level='N2');
