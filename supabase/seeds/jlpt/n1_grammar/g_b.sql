-- ============================================================
-- JLPT N1 문법 패턴 g_b (강조·추량·이유·열거·정중/격식 계열 약 30개)
-- 기존 batch1~6 등록 패턴과 중복 없음 (NOT EXISTS 가드)
-- sort_order: 930~959
-- 생성일: 2026-06 / UTF-8
-- ============================================================

-- ─── 강조 계열 (emphasis) ───
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜にほかならない','~에 다름 아니다 / 바로 ~이다','まさに〜だ、と強く断定する。','名詞 / 普通形 + にほかならない','emphasis','N1','[{"ja":"失敗の原因は準備不足にほかならない。","ko":"실패의 원인은 준비 부족에 다름 아니다."}]'::jsonb,930
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜にほかならない');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜こそ','~야말로 (강조)','特定の要素を取り上げて強調する。','名詞 / 動詞て形 + こそ','emphasis','N1','[{"ja":"今こそ本気で取り組む時だ。","ko":"지금이야말로 진지하게 임할 때다."}]'::jsonb,931
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜こそ');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜てこそ','~해야 비로소','〜して初めて、という強調。','動詞て形 + こそ','emphasis','N1','[{"ja":"失敗してこそ、本当の成長がある。","ko":"실패해야 비로소 진정한 성장이 있다."}]'::jsonb,932
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜てこそ');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ならでは','~만의 / ~이기에 가능한','〜だけに特有の、という意。','名詞 + ならでは(の)','emphasis','N1','[{"ja":"これは職人ならではの技だ。","ko":"이것은 장인만의 기술이다."}]'::jsonb,933
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ならでは');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜たりとも','~조차도 (안)','たとえ〜でも、わずかも〜ない。','数詞(一) ＋ 助数詞 ＋ たりとも','emphasis','N1','[{"ja":"一日たりとも無駄にできない。","ko":"하루라도 낭비할 수 없다."}]'::jsonb,934
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜たりとも');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜をもって','~로써 (수단·기준)','手段・時点・基準を表す格式表現。','名詞 + をもって','emphasis','N1','[{"ja":"本日をもって任期を終了いたします。","ko":"오늘을 끝으로 임기를 종료합니다."}]'::jsonb,935
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜をもって');

-- ─── 추량 계열 (conjecture) ───
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ずにはいられない','~하지 않을 수 없다 (자연스레)','自然に〜してしまう、抑えられない衝動。','動詞ない形 + ずにはいられない','conjecture','N1','[{"ja":"その映像を見て涙を流さずにはいられなかった。","ko":"그 영상을 보고 눈물을 흘리지 않을 수 없었다."}]'::jsonb,936
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ずにはいられない');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜とも思われる','~라고도 여겨진다 (복합 추량)','一つの可能性として客観的に推測する。','普通形 + とも思われる','conjecture','N1','[{"ja":"この現象は仕様変更が原因とも思われる。","ko":"이 현상은 사양 변경이 원인이라고도 여겨진다."}]'::jsonb,937
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜とも思われる');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜とみられる','~로 여겨진다 / ~로 보인다','客観的な推測・判断。報道・報告書体。','普通形 + とみられる','conjecture','N1','[{"ja":"障害の原因はメモリ不足とみられる。","ko":"장애의 원인은 메모리 부족으로 보인다."}]'::jsonb,938
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜とみられる');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜かねない','~할 수도 있다 (우려)','良くない結果になる可能性がある。','動詞ます形 + かねない','conjecture','N1','[{"ja":"このまま放置すると大事故になりかねない。","ko":"이대로 방치하면 큰 사고가 날 수도 있다."}]'::jsonb,939
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜かねない');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ないとも限らない','~이 아니라고도 할 수 없다 (가능성 시사)','その可能性もある、という含み。','動詞ない形 + ないとも限らない','conjecture','N1','[{"ja":"予算が増えないとも限らないので、準備しておこう。","ko":"예산이 늘지 않는다고도 할 수 없으니 준비해 두자."}]'::jsonb,940
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ないとも限らない');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ではあるまいか','~이 아닐까 (추량·의문)','〜ではないかという柔らかい推量。','普通形 + ではあるまいか','conjecture','N1','[{"ja":"これが問題の本質ではあるまいか。","ko":"이것이 문제의 본질이 아닐까."}]'::jsonb,941
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ではあるまいか');

-- ─── 이유 계열 (reason) ───
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ゆえに','~이기 때문에 (격식)','〜だから、という論理的理由。文語。','名詞 / 普通形 + ゆえに','reason','N1','[{"ja":"経験が浅いゆえに、周囲のサポートが欠かせない。","ko":"경험이 얕기 때문에 주변의 지원이 필수다."}]'::jsonb,942
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ゆえに');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜んがために','~하기 위해 (문어·강한 목적)','強い目的・意志を表す文語表現。','動詞ない形(語幹) + んがために','reason','N1','[{"ja":"目標を達成せんがために、不眠不休で取り組んだ。","ko":"목표를 달성하기 위해 불철주야 임했다."}]'::jsonb,943
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜んがために');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜とあって','~이라서 / ~이기 때문에','特別な状況・理由からそうなる、という説明。','名詞 / 普通形 + とあって','reason','N1','[{"ja":"新製品の発売日とあって、店の前に行列ができた。","ko":"신제품 발매일이라서 가게 앞에 줄이 섰다."}]'::jsonb,944
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜とあって');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜ゆえの','~때문에 생기는 / ~에서 비롯된 (격식 수식)','理由から生じる名詞修飾形。文語的。','名詞 / 普通形 + ゆえの + 名詞','reason','N1','[{"ja":"若さゆえの失敗を糧にして成長した。","ko":"젊음에서 비롯된 실패를 양분 삼아 성장했다."}]'::jsonb,945
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜ゆえの');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜を余儀なくされる','~을 어쩔 수 없이 하게 되다','外部の力によって〜せざるを得なくなる。','名詞 + を余儀なくされる','reason','N1','[{"ja":"システム障害により、サービス停止を余儀なくされた。","ko":"시스템 장애로 인해 서비스 중단을 어쩔 수 없이 하게 됐다."}]'::jsonb,946
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜を余儀なくされる');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜あまり','~너무 ~한 나머지','感情や状態が強すぎて弊害が出る。','名詞の / 動詞辞書形・た形 + あまり','reason','N1','[{"ja":"緊張のあまり、言葉が出てこなかった。","ko":"긴장한 나머지 말이 나오지 않았다."}]'::jsonb,947
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜あまり');

-- ─── 열거 계열 (listing) ───
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜といわず〜といわず','~라 할 것 없이 ~라 할 것 없이 (모두)','AもBも区別なく全部、の意。','名詞 + といわず + 名詞 + といわず','listing','N1','[{"ja":"昼といわず夜といわず、仕事に追われた。","ko":"낮이라 할 것 없이 밤이라 할 것 없이 일에 쫓겼다."}]'::jsonb,948
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜といわず〜といわず');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜なり','~하자마자 / ~한 채로 (두 용법)','①即時: 〜したとたん ②状態持続: 〜したきり。','動詞辞書形 / た形 + なり','listing','N1','[{"ja":"彼は席に着くなり報告を始めた。","ko":"그는 자리에 앉자마자 보고를 시작했다."}]'::jsonb,949
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜なり');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜やら〜やら','~이니 ~이니 (불확실 열거)','いくつかを曖昧に列挙する。','名詞 / 普通形 + やら〜やら','listing','N1','[{"ja":"荷物やら書類やら、持ち物が多くて大変だ。","ko":"짐이니 서류니 갖고 다닐 것이 많아 힘들다."}]'::jsonb,950
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜やら〜やら');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜といったような','~이라든지 하는 (예시 열거)','例を挙げて柔らかく示す。','名詞 / 普通形 + といったような','listing','N1','[{"ja":"クラウドや自動化といったような最新技術を活用する。","ko":"클라우드나 자동화라든지 하는 최신 기술을 활용한다."}]'::jsonb,951
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜といったような');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜はもとより','~은 물론이고','〜はもちろん、さらに。','名詞 + はもとより','listing','N1','[{"ja":"日本語はもとより、英語でのコミュニケーションも求められる。","ko":"일본어는 물론이고 영어 의사소통도 요구된다."}]'::jsonb,952
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜はもとより');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜をはじめとして','~을 비롯하여','〜を代表例として他にも、という列挙。','名詞 + をはじめとして / をはじめ','listing','N1','[{"ja":"東京をはじめとして全国の主要都市でセミナーを開く。","ko":"도쿄를 비롯하여 전국 주요 도시에서 세미나를 연다."}]'::jsonb,953
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜をはじめとして');

-- ─── 정중/격식 계열 (formal) ───
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜申し上げる','~드리다 (최고 경어)','謙譲語の最上位。相手への敬意を最大限示す。','動詞ます形 → 申し上げる','formal','N1','[{"ja":"厚くお礼申し上げます。","ko":"깊이 감사 드립니다."}]'::jsonb,954
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜申し上げる');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜いたしかねます','~하기 어렵습니다 (정중 거절)','丁重に断る表現。「〜できません」の格式体。','動詞ます形 + いたしかねます','formal','N1','[{"ja":"その件についてはお答えいたしかねます。","ko":"그 건에 대해서는 답변하기 어렵습니다."}]'::jsonb,955
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜いたしかねます');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜に存じます','~라고 생각합니다 (최고 겸양)','「思います」の最丁寧な謙譲形。','普通形 + と存じます / 名詞 + に存じます','formal','N1','[{"ja":"ご検討いただければ幸いに存じます。","ko":"검토해 주신다면 감사하게 생각합니다."}]'::jsonb,956
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜に存じます');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜に際して','~에 즈음하여 / ~할 때에','重要な場面・時点で、という格式表現。','名詞 / 動詞辞書形 + に際して','formal','N1','[{"ja":"プロジェクト開始に際して、全員で目標を確認した。","ko":"프로젝트 시작에 즈음하여 전원이 목표를 확인했다."}]'::jsonb,957
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜に際して');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜にあたって','~에 임하여 / ~를 앞두고','重要な行為・場面に臨む時。','名詞 / 動詞辞書形 + にあたって','formal','N1','[{"ja":"入社にあたって、心構えを再確認した。","ko":"입사에 임하여 마음가짐을 재확인했다."}]'::jsonb,958
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜にあたって');

INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, formation, category, jlpt_level, example_sentences, sort_order)
SELECT '〜のもとで','~의 하에서 / ~아래에서','〜という状況・指導のもとにある。','名詞 + のもとで','formal','N1','[{"ja":"上司の指導のもとで、スキルを磨いた。","ko":"상사의 지도 하에 실력을 갈고닦았다."}]'::jsonb,959
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern='〜のもとで');
