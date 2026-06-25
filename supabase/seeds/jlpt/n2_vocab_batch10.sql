-- encoding: UTF-8
-- N2 語彙シード batch 10 (131語)
-- テーマ: メディア・報道・出版・広告・通信・芸能
-- 対象テーブル: jlpt_vocabulary
-- 作成日: 2026-06-25
-- 除外済み(既存1007語と重複なし): 通信, 媒体, 情報, 発信する, 世論, 発表する 等
-- 読み確認: 標準辞書準拠

-- ============================================================
-- 名詞 — メディア・報道 (Media & News) — 35語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '報道', 'ほうどう', '보도', 'N2', '명사', 'テレビで事件の報道を見た。', '텔레비전에서 사건 보도를 봤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='報道' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取材', 'しゅざい', '취재', 'N2', '명사', '記者が現場に取材に行った。', '기자가 현장에 취재하러 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取材' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '記事', 'きじ', '기사', 'N2', '명사', '新聞に大きな記事が載った。', '신문에 큰 기사가 실렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='記事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '見出し', 'みだし', '제목, 헤드라인', 'N2', '명사', '新聞の見出しが目を引いた。', '신문 헤드라인이 눈길을 끌었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='見出し' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '速報', 'そくほう', '속보', 'N2', '명사', '地震の速報が流れた。', '지진 속보가 나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='速報' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '号外', 'ごうがい', '호외', 'N2', '명사', '選挙結果を伝える号外が出た。', '선거 결과를 전하는 호외가 나왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='号外' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '紙面', 'しめん', '지면, 신문 면', 'N2', '명사', '紙面の半分を広告が占めている。', '지면의 절반을 광고가 차지하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='紙面' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '掲載', 'けいさい', '게재', 'N2', '명사', '論文が学術誌に掲載された。', '논문이 학술지에 게재되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='掲載' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '投稿', 'とうこう', '투고, 게시', 'N2', '명사', 'SNSへの投稿が話題になった。', 'SNS 게시물이 화제가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='投稿' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '論評', 'ろんひょう', '논평', 'N2', '명사', '専門家が政策に論評を加えた。', '전문가가 정책에 논평을 덧붙였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論評' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '論説', 'ろんせつ', '논설', 'N2', '명사', '新聞の論説を読んで考えた。', '신문 논설을 읽고 생각했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='論説' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'コラム', 'コラム', '칼럼', 'N2', '명사', '週刊誌のコラムを毎週読む。', '주간지 칼럼을 매주 읽는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コラム' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'インタビュー', 'インタビュー', '인터뷰', 'N2', '명사', '有名人のインタビューを読んだ。', '유명인 인터뷰를 읽었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='インタビュー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '特集', 'とくしゅう', '특집', 'N2', '명사', '雑誌が環境問題の特集を組んだ。', '잡지가 환경 문제 특집을 꾸몄다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='特集' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '放送', 'ほうそう', '방송', 'N2', '명사', '番組は夜8時に放送される。', '프로그램은 밤 8시에 방송된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='放送' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生放送', 'なまほうそう', '생방송', 'N2', '명사', 'オリンピックを生放送で観た。', '올림픽을 생방송으로 봤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生放送' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '視聴率', 'しちょうりつ', '시청률', 'N2', '명사', 'このドラマは視聴率が高い。', '이 드라마는 시청률이 높다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='視聴率' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '番組', 'ばんぐみ', '프로그램', 'N2', '명사', '好きな番組を録画して見る。', '좋아하는 프로그램을 녹화해서 본다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='番組' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ニュース', 'ニュース', '뉴스', 'N2', '명사', '朝のニュースで知った。', '아침 뉴스에서 알았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ニュース' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'キャスター', 'キャスター', '앵커, 캐스터', 'N2', '명사', 'キャスターが事件を報じた。', '앵커가 사건을 보도했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='キャスター' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'アナウンサー', 'アナウンサー', '아나운서', 'N2', '명사', 'アナウンサーが試合の結果を伝えた。', '아나운서가 경기 결과를 전했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アナウンサー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '記者', 'きしゃ', '기자', 'N2', '명사', '記者が首相に質問した。', '기자가 총리에게 질문했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='記者' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '編集長', 'へんしゅうちょう', '편집장', 'N2', '명사', '編集長が記事の内容を確認した。', '편집장이 기사 내용을 확인했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='編集長' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '社説', 'しゃせつ', '사설', 'N2', '명사', '新聞の社説を読んで意見を考えた。', '신문 사설을 읽고 의견을 생각했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='社説' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '報道機関', 'ほうどうきかん', '보도기관, 언론사', 'N2', '명사', '複数の報道機関が情報を確認した。', '여러 보도기관이 정보를 확인했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='報道機関' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'スクープ', 'スクープ', '특종, 스쿠프', 'N2', '명사', '記者がスクープを取った。', '기자가 특종을 잡았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='スクープ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '情報源', 'じょうほうげん', '정보원, 소식통', 'N2', '명사', '情報源を明かすことはできない。', '정보원을 밝힐 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='情報源' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '誤報', 'ごほう', '오보', 'N2', '명사', '誤報が流れて混乱した。', '오보가 퍼져 혼란이 생겼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='誤報' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訂正', 'ていせい', '정정', 'N2', '명사', '誤りを認めて訂正した。', '오류를 인정하고 정정했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訂正' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '表現の自由', 'ひょうげんのじゆう', '표현의 자유', 'N2', '명사', '表現の自由は守られるべきだ。', '표현의 자유는 지켜져야 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='表現の自由' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '検閲', 'けんえつ', '검열', 'N2', '명사', 'インターネットの検閲が問題だ。', '인터넷 검열이 문제다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='検閲' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'プレスリリース', 'プレスリリース', '보도자료', 'N2', '명사', '会社がプレスリリースを配布した。', '회사가 보도자료를 배포했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='プレスリリース' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '会見', 'かいけん', '기자회견, 회견', 'N2', '명사', '大臣が記者会見を開いた。', '장관이 기자회견을 열었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='会見' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'メディア', 'メディア', '미디어, 매체', 'N2', '명사', 'SNSが新たなメディアとなった。', 'SNS가 새로운 미디어가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='メディア' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 出版 (Publishing) — 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出版', 'しゅっぱん', '출판', 'N2', '명사', '小説を出版した作家が話題だ。', '소설을 출판한 작가가 화제다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出版' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '刊行', 'かんこう', '간행, 출판', 'N2', '명사', '月刊誌が毎月刊行されている。', '월간지가 매달 간행되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刊行' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '増刷', 'ぞうさつ', '증쇄, 추가 인쇄', 'N2', '명사', '人気作が増刷された。', '인기작이 증쇄되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='増刷' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絶版', 'ぜっぱん', '절판', 'N2', '명사', '名作だが絶版になっている。', '명작이지만 절판되어 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絶版' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '編集', 'へんしゅう', '편집', 'N2', '명사', '雑誌の編集に携わっている。', '잡지 편집에 종사하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='編集' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '著者', 'ちょしゃ', '저자', 'N2', '명사', '著者がサイン会を行った。', '저자가 사인회를 열었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='著者' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '著作', 'ちょさく', '저작, 저서', 'N2', '명사', '彼の著作は世界で読まれている。', '그의 저서는 세계에서 읽히고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='著作' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '著作権', 'ちょさくけん', '저작권', 'N2', '명사', '著作権を侵害してはいけない。', '저작권을 침해해서는 안 된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='著作権' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '翻訳', 'ほんやく', '번역', 'N2', '명사', '外国の小説を日本語に翻訳した。', '외국 소설을 일본어로 번역했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='翻訳' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '原稿', 'げんこう', '원고', 'N2', '명사', '締め切りまでに原稿を仕上げた。', '마감까지 원고를 완성했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='原稿' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '校正', 'こうせい', '교정', 'N2', '명사', '印刷前に校正を行う。', '인쇄 전에 교정을 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='校正' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '初版', 'しょはん', '초판', 'N2', '명사', '初版が1週間で完売した。', '초판이 1주일 만에 완판되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='初版' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ベストセラー', 'ベストセラー', '베스트셀러', 'N2', '명사', 'その本はベストセラーになった。', '그 책은 베스트셀러가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ベストセラー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '電子書籍', 'でんししょせき', '전자책', 'N2', '명사', '電子書籍で読むのが便利だ。', '전자책으로 읽는 것이 편리하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='電子書籍' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '連載', 'れんさい', '연재', 'N2', '명사', '人気漫画が雑誌で連載中だ。', '인기 만화가 잡지에 연재 중이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='連載' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '週刊誌', 'しゅうかんし', '주간지', 'N2', '명사', '週刊誌にスキャンダルが載った。', '주간지에 스캔들이 실렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='週刊誌' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '月刊誌', 'げっかんし', '월간지', 'N2', '명사', '月刊誌の定期購読を申し込んだ。', '월간지 정기 구독을 신청했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='月刊誌' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発行部数', 'はっこうぶすう', '발행 부수', 'N2', '명사', 'この新聞は発行部数が多い。', '이 신문은 발행 부수가 많다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発行部数' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'コンテンツ', 'コンテンツ', '콘텐츠', 'N2', '명사', 'オンラインコンテンツが増えている。', '온라인 콘텐츠가 늘어나고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コンテンツ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '印刷', 'いんさつ', '인쇄', 'N2', '명사', '資料を印刷して配った。', '자료를 인쇄해서 나눠줬다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='印刷' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 広告 (Advertising) — 15語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '広告', 'こうこく', '광고', 'N2', '명사', 'テレビ広告の効果を測定する。', '텔레비전 광고 효과를 측정한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='広告' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宣伝', 'せんでん', '선전, 홍보', 'N2', '명사', '新商品の宣伝に力を入れる。', '신상품 홍보에 힘을 쏟다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宣伝' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'キャンペーン', 'キャンペーン', '캠페인', 'N2', '명사', '割引キャンペーンを実施した。', '할인 캠페인을 실시했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='キャンペーン' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'コマーシャル', 'コマーシャル', 'CF, 광고 (방송)', 'N2', '명사', 'このコマーシャルは印象に残る。', '이 광고는 인상에 남는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コマーシャル' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'コピー', 'コピー', '카피, 광고 문구', 'N2', '명사', '商品のキャッチコピーを考えた。', '상품의 광고 카피를 생각했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コピー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'スポンサー', 'スポンサー', '스폰서', 'N2', '명사', '番組のスポンサーになった企業。', '프로그램 스폰서가 된 기업.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='スポンサー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ブランド', 'ブランド', '브랜드', 'N2', '명사', 'このブランドは若者に人気だ。', '이 브랜드는 젊은이에게 인기다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ブランド' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'イメージ', 'イメージ', '이미지', 'N2', '명사', '企業イメージを向上させる。', '기업 이미지를 향상시키다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='イメージ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ポスター', 'ポスター', '포스터', 'N2', '명사', '街中にポスターが貼られた。', '거리에 포스터가 붙었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ポスター' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'チラシ', 'チラシ', '전단지, 찌라시', 'N2', '명사', 'スーパーのチラシを見て買い物した。', '슈퍼 전단지를 보고 쇼핑했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='チラシ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'プロモーション', 'プロモーション', '프로모션, 판촉', 'N2', '명사', '新曲のプロモーションを行う。', '신곡 프로모션을 실시하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='プロモーション' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ターゲット', 'ターゲット', '타겟, 목표 대상', 'N2', '명사', '広告のターゲットを絞り込む。', '광고 타겟을 좁힌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ターゲット' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'クリエイター', 'クリエイター', '크리에이터, 창작자', 'N2', '명사', '人気クリエイターが動画を投稿した。', '인기 크리에이터가 동영상을 투고했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='クリエイター' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訴求', 'そきゅう', '소구, 어필', 'N2', '명사', '若者への訴求力を高める。', '젊은층에 대한 어필력을 높이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='訴求' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'リリース', 'リリース', '릴리스, 발매, 발표', 'N2', '명사', '新曲のリリースが発表された。', '신곡 릴리스가 발표되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='リリース' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 通信・ネット (Communications & Internet) — 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '通信網', 'つうしんもう', '통신망', 'N2', '명사', '高速通信網の整備が進む。', '고속 통신망 정비가 진행되다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='通信網' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '配信', 'はいしん', '배신, 스트리밍, 배포', 'N2', '명사', '動画をオンラインで配信する。', '동영상을 온라인으로 배신한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='配信' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受信', 'じゅしん', '수신', 'N2', '명사', '電波が弱くて受信できない。', '전파가 약해서 수신할 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受信' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '発信', 'はっしん', '발신, 발신하기', 'N2', '명사', '情報の発信に努める。', '정보 발신에 힘쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='発信' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '電波', 'でんぱ', '전파', 'N2', '명사', '電波が届かない場所にいる。', '전파가 닿지 않는 장소에 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='電波' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '衛星', 'えいせい', '위성', 'N2', '명사', '衛星放送を契約している。', '위성방송을 계약하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='衛星' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'アンテナ', 'アンテナ', '안테나', 'N2', '명사', 'アンテナを設置して受信する。', '안테나를 설치하여 수신한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アンテナ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'インターネット', 'インターネット', '인터넷', 'N2', '명사', 'インターネットで情報を調べる。', '인터넷으로 정보를 조사한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='インターネット' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ウェブサイト', 'ウェブサイト', '웹사이트', 'N2', '명사', 'ウェブサイトを更新した。', '웹사이트를 업데이트했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ウェブサイト' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ソーシャルメディア', 'ソーシャルメディア', '소셜 미디어', 'N2', '명사', 'ソーシャルメディアで拡散した。', '소셜 미디어에서 확산되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ソーシャルメディア' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'フォロワー', 'フォロワー', '팔로워', 'N2', '명사', 'フォロワーが100万人を超えた。', '팔로워가 100만 명을 넘었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='フォロワー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'アクセス', 'アクセス', '액세스, 접속', 'N2', '명사', 'サイトへのアクセスが急増した。', '사이트 접속이 급증했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アクセス' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ダウンロード', 'ダウンロード', '다운로드', 'N2', '명사', 'アプリのダウンロード数が多い。', '앱 다운로드 수가 많다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ダウンロード' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'アップロード', 'アップロード', '업로드', 'N2', '명사', '動画をアップロードした。', '동영상을 업로드했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アップロード' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ストリーミング', 'ストリーミング', '스트리밍', 'N2', '명사', 'ストリーミングで音楽を聴く。', '스트리밍으로 음악을 듣는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ストリーミング' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'プラットフォーム', 'プラットフォーム', '플랫폼', 'N2', '명사', '動画プラットフォームに投稿する。', '동영상 플랫폼에 투고한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='プラットフォーム' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'デジタル', 'デジタル', '디지털', 'N2', '명사', 'デジタル化が急速に進んだ。', '디지털화가 빠르게 진행되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='デジタル' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'フェイクニュース', 'フェイクニュース', '가짜 뉴스', 'N2', '명사', 'フェイクニュースを見分ける力が必要だ。', '가짜 뉴스를 가려내는 능력이 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='フェイクニュース' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'バイラル', 'バイラル', '바이럴', 'N2', '명사', 'その動画はバイラルになった。', '그 동영상은 바이럴이 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='バイラル' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'リンク', 'リンク', '링크', 'N2', '명사', '記事のリンクをシェアした。', '기사 링크를 공유했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='リンク' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 芸能・エンタメ (Entertainment & Show Business) — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '芸能', 'げいのう', '연예, 예능', 'N2', '명사', '芸能界への入り方を調べた。', '연예계 입문 방법을 조사했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='芸能' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '芸能人', 'げいのうじん', '연예인', 'N2', '명사', '芸能人のファンになった。', '연예인의 팬이 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='芸能人' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '俳優', 'はいゆう', '배우', 'N2', '명사', '有名な俳優が映画に出演した。', '유명한 배우가 영화에 출연했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='俳優' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '女優', 'じょゆう', '여배우', 'N2', '명사', '人気女優がドラマに主演した。', '인기 여배우가 드라마에 주연했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='女優' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '歌手', 'かしゅ', '가수', 'N2', '명사', '人気歌手のコンサートに行った。', '인기 가수의 콘서트에 갔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='歌手' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'アイドル', 'アイドル', '아이돌', 'N2', '명사', 'アイドルグループがデビューした。', '아이돌 그룹이 데뷔했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アイドル' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'タレント', 'タレント', '탤런트, 예능인', 'N2', '명사', 'タレントがバラエティに出た。', '탤런트가 버라이어티에 출연했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='タレント' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'デビュー', 'デビュー', '데뷔', 'N2', '명사', '新人歌手がデビューした。', '신인 가수가 데뷔했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='デビュー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '引退', 'いんたい', '은퇴', 'N2', '명사', '人気俳優が引退を発表した。', '인기 배우가 은퇴를 발표했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='引退' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '復帰', 'ふっき', '복귀', 'N2', '명사', '休業後の復帰を果たした。', '활동 중단 후 복귀를 이루었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='復帰' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出演', 'しゅつえん', '출연', 'N2', '명사', '人気番組への出演が決まった。', '인기 프로그램 출연이 확정되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出演' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '主演', 'しゅえん', '주연', 'N2', '명사', '若手俳優が映画の主演を務めた。', '신진 배우가 영화 주연을 맡았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='主演' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '共演', 'きょうえん', '공연, 공동 출연', 'N2', '명사', '二人の俳優が共演した映画。', '두 배우가 공동 출연한 영화.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='共演' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ファン', 'ファン', '팬', 'N2', '명사', 'ファンからの手紙に感動した。', '팬에게서 온 편지에 감동받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ファン' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'コンサート', 'コンサート', '콘서트', 'N2', '명사', '野外コンサートで雨に降られた。', '야외 콘서트에서 비를 맞았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='コンサート' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ライブ', 'ライブ', '라이브', 'N2', '명사', 'ライブ会場で盛り上がった。', '라이브 공연장에서 흥이 났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ライブ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ドラマ', 'ドラマ', '드라마', 'N2', '명사', '人気ドラマが話題になっている。', '인기 드라마가 화제가 되고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ドラマ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'バラエティ', 'バラエティ', '버라이어티', 'N2', '명사', 'バラエティ番組で笑った。', '버라이어티 프로그램에서 웃었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='バラエティ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'スキャンダル', 'スキャンダル', '스캔들', 'N2', '명사', '芸能人のスキャンダルが報じられた。', '연예인의 스캔들이 보도되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='スキャンダル' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '事務所', 'じむしょ', '사무소, 소속사', 'N2', '명사', '大手事務所に所属している。', '대형 소속사에 속해 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='事務所' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'マネージャー', 'マネージャー', '매니저', 'N2', '명사', '専属マネージャーが付く。', '전속 매니저가 붙는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='マネージャー' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '人気', 'にんき', '인기', 'N2', '명사', 'このグループの人気が急上昇した。', '이 그룹의 인기가 급상승했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人気' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '知名度', 'ちめいど', '인지도', 'N2', '명사', '知名度を上げるために宣伝する。', '인지도를 높이기 위해 홍보한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='知名度' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'アワード', 'アワード', '어워드, 시상식', 'N2', '명사', '映画アワードで最優秀賞を受賞した。', '영화 어워드에서 최우수상을 수상했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='アワード' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '受賞', 'じゅしょう', '수상', 'N2', '명사', '映画賞で最優秀作品賞を受賞した。', '영화상에서 최우수작품상을 수상했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='受賞' AND jlpt_level='N2');

-- ============================================================
-- 動詞 (Verbs) — 10語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '報じる', 'ほうじる', '보도하다', 'N2', '동사', 'テレビが事件を報じた。', '텔레비전이 사건을 보도했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='報じる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '掲載する', 'けいさいする', '게재하다', 'N2', '동사', '写真を雑誌に掲載する。', '사진을 잡지에 게재하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='掲載する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出版する', 'しゅっぱんする', '출판하다', 'N2', '동사', '自伝を出版する計画がある。', '자서전을 출판할 계획이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出版する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '翻訳する', 'ほんやくする', '번역하다', 'N2', '동사', '小説を英語に翻訳する。', '소설을 영어로 번역하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='翻訳する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '放送する', 'ほうそうする', '방송하다', 'N2', '동사', 'ニュースを全国に放送する。', '뉴스를 전국에 방송하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='放送する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '配信する', 'はいしんする', '배신하다, 스트리밍하다', 'N2', '동사', '音楽をオンラインで配信する。', '음악을 온라인으로 배신하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='配信する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '取材する', 'しゅざいする', '취재하다', 'N2', '동사', '現地に出向いて取材する。', '현지에 직접 가서 취재하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='取材する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '宣伝する', 'せんでんする', '선전하다, 홍보하다', 'N2', '동사', '新商品をSNSで宣伝する。', '신상품을 SNS로 홍보하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='宣伝する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出演する', 'しゅつえんする', '출연하다', 'N2', '동사', 'ドラマに出演することが決まった。', '드라마에 출연하기로 결정되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出演する' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '拡散する', 'かくさんする', '확산하다', 'N2', '동사', 'うわさがSNSで拡散した。', '소문이 SNS에서 확산되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拡散する' AND jlpt_level='N2');

-- ============================================================
-- な형용사 / い형용사 / 副詞 — 6語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '著名', 'ちょめい', '저명함', 'N2', 'な형용사', '著名な評論家が意見を述べた。', '저명한 평론가가 의견을 밝혔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='著名' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '話題', 'わだい', '화제', 'N2', '명사', 'その映画は大きな話題を呼んだ。', '그 영화는 큰 화제를 불러일으켰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='話題' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '注目', 'ちゅうもく', '주목', 'N2', '명사', '世界中から注目を集めた。', '전 세계의 주목을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='注目' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '批評', 'ひひょう', '비평', 'N2', '명사', '映画評論家が辛口の批評をした。', '영화 평론가가 신랄한 비평을 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='批評' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '人気者', 'にんきもの', '인기인, 인기스타', 'N2', '명사', 'クラスの人気者は明るい性格だ。', '학급 인기인은 밝은 성격이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='人気者' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '娯楽', 'ごらく', '오락, 엔터테인먼트', 'N2', '명사', '映画は人気の高い娯楽だ。', '영화는 인기 있는 오락이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='娯楽' AND jlpt_level='N2');
