-- ============================================================
-- JLPT N1 문법 패턴 확장 g_a (역접·조건·시간·정도·범위 계열)
-- 약 30개. 기존 batch1~5(sort 101~235)와 중복 제거(NOT EXISTS 가드).
-- sort_order: 901~930
-- ============================================================

-- 1. 〜ないまでも
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ないまでも','~할 수는 없더라도','〜するほどではないにせよ、せめて〜してほしい。','動詞ない形 + までも','condition','N1','[{"ja":"完璧でないまでも、最低限の品質は保ってほしい。","ko":"완벽하지는 않더라도 최소한의 품질은 지켜줬으면 한다."}]'::jsonb,901
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ないまでも');

-- 2. 〜ともなると
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ともなると','~쯤 되면 / ~이 되면 (당연히)','ある立場・段階になれば、当然そうなる。','名詞 + ともなると / ともなれば','condition','N1','[{"ja":"部長ともなると、細かい作業より判断力が求められる。","ko":"부장쯤 되면 세세한 작업보다 판단력이 요구된다."}]'::jsonb,902
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ともなると');

-- 3. 〜ようがない
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ようがない','~할 방법이 없다 / ~할 도리가 없다','どうしても〜することができない。','動詞ます形 + ようがない','ability','N1','[{"ja":"仕様書がなければ、確認のしようがない。","ko":"사양서가 없으면 확인할 방법이 없다."}]'::jsonb,903
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ようがない');

-- 4. 〜であれ
-- ※ batch4에 '〜であれ'(sort 220) 존재 → 이미 NOT EXISTS로 스킵됨. 여기서는 생략하고 다음 패턴.

-- 4. 〜かと思うと
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜かと思うと','~했나 싶더니 (바로)','〜したと思ったらすぐに次のことが起きる。','動詞た形 + かと思うと / かと思ったら','time','N1','[{"ja":"雨が止んだかと思うと、また降り出した。","ko":"비가 그쳤나 싶더니 다시 내리기 시작했다."}]'::jsonb,904
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜かと思うと');

-- 5. 〜なしに(は)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜なしに(は)','~없이(는)','〜がなければ、〜せずに。','名詞 + なしに(は) / 動詞辞書形 + ことなしに(は)','condition','N1','[{"ja":"許可なしに、個人情報にアクセスすることはできない。","ko":"허가 없이 개인정보에 접근할 수 없다."}]'::jsonb,905
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜なしに(は)');

-- 6. 〜を余儀なくされる
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜を余儀なくされる','~을 하지 않을 수 없게 되다 / 부득이 ~하게 되다','外部の事情により〜せざるを得なくなる。','名詞 + を余儀なくされる','condition','N1','[{"ja":"システム障害により、サービスの停止を余儀なくされた。","ko":"시스템 장애로 인해 서비스 중단을 하지 않을 수 없게 되었다."}]'::jsonb,906
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜を余儀なくされる');

-- 7. 〜もかまわず
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜もかまわず','~도 아랑곳하지 않고','〜を気にせず、かまわないで。','名詞 + もかまわず / 動詞辞書形 + のもかまわず','manner','N1','[{"ja":"人目もかまわず、その場で泣き出した。","ko":"남의 눈도 아랑곳하지 않고 그 자리에서 울기 시작했다."}]'::jsonb,907
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜もかまわず');

-- 8. 〜に先立って
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜に先立って','~에 앞서','〜の前に、事前に。','名詞 + に先立って / に先立ち','time','N1','[{"ja":"リリースに先立って、十分なテストを実施する。","ko":"출시에 앞서 충분한 테스트를 실시한다."}]'::jsonb,908
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜に先立って');

-- 9. 〜をもって
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜をもって','~로써 / ~을 가지고 (수단·시점)','①手段・資格を表す格式表現。②期限・終了時点を示す。','名詞 + をもって','formal','N1','[{"ja":"本日をもって、当プロジェクトを終了いたします。","ko":"오늘로써 해당 프로젝트를 종료합니다."}]'::jsonb,909
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜をもって');

-- 10. 〜たとて
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜たとて','~했다 한들','たとえ〜したとしても(無駄・変化なし)。','動詞た形 + とて','contrast','N1','[{"ja":"今さら後悔したとて、取り返しはつかない。","ko":"이제 와서 후회한들 되돌릴 수 없다."}]'::jsonb,910
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜たとて');

-- 11. 〜いかんにかかわらず
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜いかんにかかわらず','~여하에 관계없이','〜の内容・結果に関係なく。','名詞(の) + いかんにかかわらず','condition','N1','[{"ja":"結果のいかんにかかわらず、全力を尽くすことが大切だ。","ko":"결과 여하에 관계없이 최선을 다하는 것이 중요하다."}]'::jsonb,911
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜いかんにかかわらず');

-- 12. 〜ことと思う
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ことと思う','~하실 것으로 생각합니다 (격식 추측)','相手の状態・心情を丁寧に推し量る格式表現。','普通形 + ことと思います','formal','N1','[{"ja":"ご多忙のことと思いますが、よろしくお願いいたします。","ko":"바쁘실 것으로 생각합니다만 잘 부탁드립니다."}]'::jsonb,912
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ことと思う');

-- 13. 〜をものともせず
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜をものともせず','~을 아랑곳하지 않고 / ~을 개의치 않고','困難・障害を意に介せず。','名詞 + をものともせず(に)','contrast','N1','[{"ja":"激しい批判をものともせず、計画を進めた。","ko":"거센 비판을 아랑곳하지 않고 계획을 진행했다."}]'::jsonb,913
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜をものともせず');

-- 14. 〜に反して
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜に反して','~에 반하여 / ~와 달리','予想・期待・規則などに反する。','名詞 + に反して / に反し','contrast','N1','[{"ja":"予想に反して、テストは一発で通過した。","ko":"예상과 달리 테스트가 단번에 통과되었다."}]'::jsonb,914
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜に反して');

-- 15. 〜はいざ知らず
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜はいざ知らず','~는 몰라도 / ~는 별개로','〜はともかくとして、それ以外は。','名詞 + はいざ知らず','contrast','N1','[{"ja":"初期モデルはいざ知らず、最新版でその不具合は起きないはずだ。","ko":"초기 모델은 몰라도 최신 버전에서는 그 결함이 생기지 않을 것이다."}]'::jsonb,915
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜はいざ知らず');

-- 16. 〜のもとで
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜のもとで','~하에서 / ~의 아래에서','〜という条件・環境・指導下で。','名詞 + のもとで / のもとに','condition','N1','[{"ja":"厳しい条件のもとで、チームは結束を強めた。","ko":"엄격한 조건하에서 팀은 결속을 강화했다."}]'::jsonb,916
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜のもとで');

-- 17. 〜を踏まえて
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜を踏まえて','~을 토대로 / ~을 감안하여','〜を基礎・根拠として考慮し。','名詞 + を踏まえて / を踏まえた上で','reason','N1','[{"ja":"前回の反省を踏まえて、設計を見直した。","ko":"지난번의 반성을 토대로 설계를 재검토했다."}]'::jsonb,917
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜を踏まえて');

-- 18. 〜にかかわらず
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜にかかわらず','~에 관계없이','〜の違いに関係なく、どちらでも。','名詞 + にかかわらず / にかかわりなく','condition','N1','[{"ja":"経験の有無にかかわらず、応募できる。","ko":"경험 유무에 관계없이 지원할 수 있다."}]'::jsonb,918
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜にかかわらず');

-- 19. 〜に即して
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜に即して','~에 입각하여 / ~에 맞추어','〜に合わせて、〜に沿って(格式)。','名詞 + に即して / に即した','manner','N1','[{"ja":"実態に即した規則を整備する必要がある。","ko":"실태에 입각한 규칙을 정비할 필요가 있다."}]'::jsonb,919
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜に即して');

-- 20. 〜と同時に
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜と同時に','~와 동시에 / ~하자마자 / ~이기도 하다','①時間的同時性 ②二つの性質を同時に持つ。','動詞辞書形 / 名詞 + と同時に','time','N1','[{"ja":"ドアが開くと同時に、警報が鳴った。","ko":"문이 열리자마자 경보가 울렸다."}]'::jsonb,920
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜と同時に');

-- 21. 〜もなく
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜もなく','~도 없이','〜もせずに。中間状態がなく直ちに。','名詞 + もなく','manner','N1','[{"ja":"挨拶もなく席を立つのは失礼だ。","ko":"인사도 없이 자리를 뜨는 것은 실례다."}]'::jsonb,921
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜もなく');

-- 22. 〜をよそに
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜をよそに','~는 아랑곳하지 않고 / ~를 무시하고','他者の状況・気持ちを無視して行動する。','名詞 + をよそに','contrast','N1','[{"ja":"周囲の心配をよそに、彼は平然と仕事を続けた。","ko":"주변의 걱정은 아랑곳하지 않고 그는 태연하게 일을 계속했다."}]'::jsonb,922
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜をよそに');

-- 23. 〜ばかりか
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ばかりか','~뿐만 아니라 (더욱이)','〜だけでなく、さらにそれ以上のことも。','普通形 / 名詞 + ばかりか','listing','N1','[{"ja":"コストが削減できたばかりか、品質も向上した。","ko":"비용이 절감되었을 뿐만 아니라 품질도 향상되었다."}]'::jsonb,923
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ばかりか');

-- 24. 〜かのように
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜かのように','마치 ~인 듯이','まるで〜であるかのように(比喩・様子)。','普通形 + かのように / かのような','manner','N1','[{"ja":"まるで何事もなかったかのように、彼は笑っていた。","ko":"마치 아무 일도 없었던 것처럼 그는 웃고 있었다."}]'::jsonb,924
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜かのように');

-- 25. 〜のを皮切りとして
-- ※ '〜を皮切りに'는 batch2(sort 154)에 존재. '〜のを皮切りとして'는 별도 표기이나 실질 중복.
-- 대신 미사용 패턴으로 교체:

-- 25. 〜に至るや
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜に至るや','~에 이르자마자','〜という段階・状況になったとたんに。','名詞 / 動詞辞書形 + に至るや','time','N1','[{"ja":"最終局面に至るや、交渉は一気に加速した。","ko":"최종 국면에 이르자마자 협상은 단숨에 가속되었다."}]'::jsonb,925
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜に至るや');

-- 26. 〜を経て
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜を経て','~을 거쳐','〜というプロセス・時間を通過して。','名詞 + を経て / を経た','time','N1','[{"ja":"長期の開発期間を経て、製品がついに完成した。","ko":"장기간의 개발 기간을 거쳐 제품이 드디어 완성되었다."}]'::jsonb,926
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜を経て');

-- 27. 〜のみか
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜のみか','~뿐만 아니라 (문어)','〜だけでなく、さらに(文語・格式)。','普通形 / 名詞 + のみか','listing','N1','[{"ja":"このシステムは処理速度が向上したのみか、消費電力も減少した。","ko":"이 시스템은 처리 속도가 향상되었을 뿐만 아니라 소비 전력도 감소했다."}]'::jsonb,927
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜のみか');

-- 28. 〜に比例して
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜に比例して','~에 비례하여','〜の増減に合わせて同じ方向に変化する。','名詞 + に比例して / に比例した','degree','N1','[{"ja":"経験年数に比例して、問題解決の速度も上がった。","ko":"경력 연수에 비례하여 문제 해결 속도도 올라갔다."}]'::jsonb,928
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜に比例して');

-- 29. 〜にしては
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜にしては','~치고는 (의외)','〜という立場・条件のわりに(期待と異なる)。','名詞 / 動詞辞書形 + にしては','contrast','N1','[{"ja":"新人にしては、落ち着いた対応ができている。","ko":"신입치고는 침착하게 대응하고 있다."}]'::jsonb,929
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜にしては');

-- 30. 〜といったところだ
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜といったところだ','고작 ~정도다 / 기껏해야 ~이다','せいぜい〜程度だ、という控えめな評価。','名詞 / 動詞辞書形 + といったところだ','degree','N1','[{"ja":"今月の進捗は六割といったところだ。","ko":"이번 달 진척은 고작 60% 정도다."}]'::jsonb,930
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜といったところだ');
