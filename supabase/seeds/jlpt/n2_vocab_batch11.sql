-- encoding: UTF-8
-- N2 語彙シード batch 11 (130語)
-- テーマ: 家庭・家事・育児・人生・日常生活
-- 作成日: 2026-06-25
-- 除外済み(既存語): 炊事・洗濯・掃除・暮らし・生活費・余暇・余裕・育てる・介護・引越し 等
-- 読み確認: 標準辞書準拠

-- ============================================================
-- 名詞 — 家庭・住まい (Nouns — Home & Living) — 30語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '家事', 'かじ', '가사, 집안일', 'N2', '명사', '家事を分担して行う。', '가사를 분담하여 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='家事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '家庭', 'かてい', '가정', 'N2', '명사', '温かい家庭を築きたい。', '따뜻한 가정을 만들고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='家庭' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '家族', 'かぞく', '가족', 'N2', '명사', '家族で旅行に出かけた。', '가족과 함께 여행을 떠났다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='家族' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '夫婦', 'ふうふ', '부부', 'N2', '명사', '仲のいい夫婦だ。', '사이가 좋은 부부이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='夫婦' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '親戚', 'しんせき', '친척', 'N2', '명사', '親戚が集まって食事をした。', '친척이 모여 식사를 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='親戚' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '兄弟', 'きょうだい', '형제', 'N2', '명사', '兄弟は三人いる。', '형제는 세 명 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='兄弟' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '祖父母', 'そふぼ', '조부모', 'N2', '명사', '祖父母と同居している。', '조부모와 함께 살고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='祖父母' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '子育て', 'こそだて', '육아, 자녀 양육', 'N2', '명사', '子育ては大変だが喜びも多い。', '육아는 힘들지만 기쁨도 많다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='子育て' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '育児', 'いくじ', '육아', 'N2', '명사', '育児休暇を取る父親が増えた。', '육아 휴직을 내는 아버지가 늘었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='育児' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '保育', 'ほいく', '보육', 'N2', '명사', '保育所に子どもを預ける。', '보육원에 아이를 맡기다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='保育' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '幼児', 'ようじ', '유아', 'N2', '명사', '幼児向けの番組を見る。', '유아용 프로그램을 보다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幼児' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '乳児', 'にゅうじ', '영아, 젖먹이', 'N2', '명사', '乳児は一日に何度も授乳が必要だ。', '영아는 하루에 몇 번이나 수유가 필요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='乳児' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '授乳', 'じゅにゅう', '수유', 'N2', '명사', '授乳の時間が決まっている。', '수유 시간이 정해져 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='授乳' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'おむつ', 'おむつ', '기저귀', 'N2', '명사', 'おむつを替える。', '기저귀를 갈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='おむつ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '離乳食', 'りにゅうしょく', '이유식', 'N2', '명사', '離乳食を手作りする。', '이유식을 직접 만들다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='離乳食' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '夕飯', 'ゆうはん', '저녁 식사', 'N2', '명사', '夕飯の支度をする。', '저녁 식사 준비를 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='夕飯' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '朝食', 'ちょうしょく', '아침 식사', 'N2', '명사', '毎朝、朝食を欠かさない。', '매일 아침 아침 식사를 빠뜨리지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='朝食' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '献立', 'こんだて', '식단, 메뉴', 'N2', '명사', '今日の献立を考える。', '오늘의 식단을 생각하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='献立' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食器', 'しょっき', '식기', 'N2', '명사', '食器を洗って棚に戻す。', '식기를 씻어 선반에 돌려놓다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食器' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '台所', 'だいどころ', '부엌, 주방', 'N2', '명사', '台所で料理をする。', '부엌에서 요리를 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='台所' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '浴室', 'よくしつ', '욕실', 'N2', '명사', '浴室を毎日掃除する。', '욕실을 매일 청소하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='浴室' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '寝室', 'しんしつ', '침실', 'N2', '명사', '寝室のカーテンを変えた。', '침실 커튼을 바꿨다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='寝室' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '玄関', 'げんかん', '현관', 'N2', '명사', '玄関で靴を脱ぐ。', '현관에서 신발을 벗다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='玄関' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物置', 'ものおき', '창고, 물건을 두는 곳', 'N2', '명사', '不用品を物置に入れた。', '불필요한 물건을 창고에 넣었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物置' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '光熱費', 'こうねつひ', '광열비 (전기·가스·수도 요금)', 'N2', '명사', '光熱費を節約するよう心がける。', '광열비를 절약하도록 신경 쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='光熱費' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '家賃', 'やちん', '집세, 임대료', 'N2', '명사', '家賃が高くて困っている。', '집세가 비싸서 곤란하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='家賃' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '近所', 'きんじょ', '근처, 이웃', 'N2', '명사', '近所の人とあいさつを交わす。', '근처 사람과 인사를 나누다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='近所' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '隣人', 'りんじん', '이웃 사람', 'N2', '명사', '隣人との関係を大切にする。', '이웃 사람과의 관계를 소중히 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='隣人' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ゴミ', 'ごみ', '쓰레기', 'N2', '명사', 'ゴミを分別して捨てる。', '쓰레기를 분리해서 버리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ゴミ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '粗大ゴミ', 'そだいごみ', '대형 폐기물', 'N2', '명사', '粗大ゴミの回収日を確認する。', '대형 폐기물 수거일을 확인하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='粗大ゴミ' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 人生・感情・心理 (Nouns — Life & Emotions) — 30語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '生涯', 'しょうがい', '생애, 일생', 'N2', '명사', '生涯を研究に捧げた。', '일생을 연구에 바쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='生涯' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '幼少期', 'ようしょうき', '어린 시절', 'N2', '명사', '幼少期の記憶が残っている。', '어린 시절의 기억이 남아 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幼少期' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '青春', 'せいしゅん', '청춘', 'N2', '명사', '青春時代に戻りたい。', '청춘 시절로 돌아가고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='青春' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '老後', 'ろうご', '노후', 'N2', '명사', '老後のために貯金をする。', '노후를 위해 저축을 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='老後' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '定年', 'ていねん', '정년', 'N2', '명사', '定年退職後も元気に過ごす。', '정년퇴직 후에도 건강하게 지내다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='定年' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '結婚', 'けっこん', '결혼', 'N2', '명사', '来年、結婚する予定だ。', '내년에 결혼할 예정이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='結婚' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '離婚', 'りこん', '이혼', 'N2', '명사', '離婚して一人で暮らしている。', '이혼하고 혼자서 살고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='離婚' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '出産', 'しゅっさん', '출산', 'N2', '명사', '出産のため入院した。', '출산을 위해 입원했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='出産' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '妊娠', 'にんしん', '임신', 'N2', '명사', '妊娠中は食事に気をつける。', '임신 중에는 식사에 주의한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='妊娠' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '葬儀', 'そうぎ', '장례식', 'N2', '명사', '葬儀に参列する。', '장례식에 참석하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='葬儀' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '喪失', 'そうしつ', '상실', 'N2', '명사', '大切なものを喪失した悲しみ。', '소중한 것을 잃은 슬픔.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喪失' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '後悔', 'こうかい', '후회', 'N2', '명사', '後悔しない選択をしたい。', '후회하지 않을 선택을 하고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='後悔' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '憧れ', 'あこがれ', '동경, 선망', 'N2', '명사', '海外生活への憧れがある。', '해외 생활에 대한 동경이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='憧れ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '絆', 'きずな', '유대, 인연', 'N2', '명사', '家族との絆を大切にする。', '가족과의 유대를 소중히 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='絆' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思いやり', 'おもいやり', '배려, 상대방을 생각하는 마음', 'N2', '명사', '思いやりのある言葉をかける。', '배려 어린 말을 건네다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思いやり' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '葛藤', 'かっとう', '갈등', 'N2', '명사', '心の中で葛藤を感じる。', '마음속에서 갈등을 느끼다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='葛藤' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '嫉妬', 'しっと', '질투', 'N2', '명사', '嫉妬から生まれる感情は複雑だ。', '질투에서 생기는 감정은 복잡하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='嫉妬' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '孤独', 'こどく', '고독, 외로움', 'N2', '명사', '都会で孤独を感じることがある。', '도시에서 고독을 느낄 때가 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='孤独' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '安堵', 'あんど', '안도', 'N2', '명사', '無事を聞いて安堵した。', '무사하다는 소식을 듣고 안도했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='安堵' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '喜び', 'よろこび', '기쁨', 'N2', '명사', '子どもの成長を見る喜び。', '아이의 성장을 보는 기쁨.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='喜び' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悲しみ', 'かなしみ', '슬픔', 'N2', '명사', '悲しみを乗り越えて前へ進む。', '슬픔을 극복하고 앞으로 나아가다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悲しみ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '苦しみ', 'くるしみ', '괴로움, 고통', 'N2', '명사', '苦しみを誰かに打ち明けたい。', '괴로움을 누군가에게 털어놓고 싶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='苦しみ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '焦り', 'あせり', '조급함, 초조함', 'N2', '명사', '焦りを感じて集中できない。', '조급함을 느껴 집중할 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焦り' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '怒り', 'いかり', '분노, 화', 'N2', '명사', '怒りをうまく抑える方法を学ぶ。', '분노를 잘 억제하는 방법을 배우다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='怒り' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '驚き', 'おどろき', '놀라움', 'N2', '명사', '彼の才能に驚きを感じた。', '그의 재능에 놀라움을 느꼈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='驚き' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不安', 'ふあん', '불안', 'N2', '명사', '将来への不安が消えない。', '미래에 대한 불안이 사라지지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不安' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '緊張', 'きんちょう', '긴장', 'N2', '명사', '発表の前に緊張した。', '발표 전에 긴장했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='緊張' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感動', 'かんどう', '감동', 'N2', '명사', '映画を見て感動した。', '영화를 보고 감동받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感動' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '感謝', 'かんしゃ', '감사', 'N2', '명사', '感謝の気持ちを伝える。', '감사한 마음을 전하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='感謝' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恥', 'はじ', '부끄러움, 수치', 'N2', '명사', '恥をかかずに済んだ。', '창피를 당하지 않아도 됐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恥' AND jlpt_level='N2');

-- ============================================================
-- 名詞 — 日常生活・健康・行事 (Nouns — Daily Life, Health, Events) — 20語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '習慣', 'しゅうかん', '습관', 'N2', '명사', '早起きの習慣をつける。', '일찍 일어나는 습관을 들이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='習慣' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '日課', 'にっか', '일과', 'N2', '명사', '朝の散歩が日課になった。', '아침 산책이 일과가 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='日課' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '睡眠', 'すいみん', '수면', 'N2', '명사', '十分な睡眠をとることが大切だ。', '충분한 수면을 취하는 것이 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='睡眠' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '体温', 'たいおん', '체온', 'N2', '명사', '毎朝体温を測る。', '매일 아침 체온을 재다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体温' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '体力', 'たいりょく', '체력', 'N2', '명사', '体力づくりのために走る。', '체력 향상을 위해 달리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='体力' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '栄養', 'えいよう', '영양', 'N2', '명사', '栄養バランスのよい食事をとる。', '영양 균형이 좋은 식사를 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='栄養' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '水分', 'すいぶん', '수분', 'N2', '명사', 'こまめに水分を補給する。', '수시로 수분을 보충하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='水分' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '汗', 'あせ', '땀', 'N2', '명사', '運動して汗をかく。', '운동하여 땀을 흘리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='汗' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '疲労', 'ひろう', '피로', 'N2', '명사', '疲労が溜まって動けない。', '피로가 쌓여 움직일 수 없다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='疲労' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '花粉', 'かふん', '꽃가루', 'N2', '명사', '花粉症に悩んでいる。', '꽃가루 알레르기로 고생하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='花粉' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '熱中症', 'ねっちゅうしょう', '열사병, 더위 먹음', 'N2', '명사', '夏は熱中症に気をつける。', '여름에는 열사병에 주의하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='熱中症' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '食欲', 'しょくよく', '식욕', 'N2', '명사', 'ストレスで食欲がなくなる。', '스트레스로 식욕이 없어지다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='食欲' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '運動', 'うんどう', '운동', 'N2', '명사', '定期的に運動する習慣をつける。', '정기적으로 운동하는 습관을 들이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='運動' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '散歩', 'さんぽ', '산책', 'N2', '명사', '夕方に公園を散歩する。', '저녁에 공원을 산책하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='散歩' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '趣味', 'しゅみ', '취미', 'N2', '명사', '趣味は料理と読書だ。', '취미는 요리와 독서이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='趣味' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '行事', 'ぎょうじ', '행사, 행사일', 'N2', '명사', '地域の行事に参加する。', '지역 행사에 참가하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='行事' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '冠婚葬祭', 'かんこんそうさい', '관혼상제 (성인식·결혼·장례·제사)', 'N2', '명사', '冠婚葬祭のマナーを学ぶ。', '관혼상제 예절을 배우다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='冠婚葬祭' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'お歳暮', 'おせいぼ', '연말 선물 (오세이보)', 'N2', '명사', 'お歳暮を贈る習慣がある。', '연말 선물을 보내는 습관이 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='お歳暮' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'お中元', 'おちゅうげん', '여름 선물 (오추겐)', 'N2', '명사', 'お中元を受け取ったらお礼を言う。', '여름 선물을 받으면 감사 인사를 하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='お中元' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '節約', 'せつやく', '절약', 'N2', '명사', '日々の節約を心がける。', '매일의 절약을 신경 쓰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='節約' AND jlpt_level='N2');

-- ============================================================
-- 동사 (Verbs) — 25語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '煮る', 'にる', '끓이다, 삶다, 조리다', 'N2', '동사', '野菜を柔らかくなるまで煮る。', '채소가 부드러워질 때까지 끓이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='煮る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蒸す', 'むす', '찌다', 'N2', '동사', '魚を蒸して食べる。', '생선을 쪄서 먹다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='蒸す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '炒める', 'いためる', '볶다', 'N2', '동사', '野菜を強火で炒める。', '채소를 강한 불로 볶다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='炒める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '刻む', 'きざむ', '잘게 썰다, 새기다', 'N2', '동사', '玉ねぎを細かく刻む。', '양파를 잘게 썰다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='刻む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '沸かす', 'わかす', '끓이다 (물을)', 'N2', '동사', 'お湯を沸かしてお茶を入れる。', '물을 끓여 차를 타다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='沸かす' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '干す', 'ほす', '말리다, 널다', 'N2', '동사', '洗濯物を外に干す。', '빨래를 밖에 널다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='干す' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '片付ける', 'かたづける', '정리하다, 치우다', 'N2', '동사', '部屋を片付けてすっきりした。', '방을 정리하고 개운해졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='片付ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '磨く', 'みがく', '닦다, 갈고닦다', 'N2', '동사', '歯を丁寧に磨く。', '이를 꼼꼼히 닦다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='磨く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '拭く', 'ふく', '닦다, 훔치다', 'N2', '동사', 'テーブルを布で拭く。', '테이블을 천으로 닦다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='拭く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '縫う', 'ぬう', '바느질하다, 꿰매다', 'N2', '동사', 'ボタンが取れたので縫い付けた。', '단추가 떨어져서 꿰매 붙였다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='縫う' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '甘える', 'あまえる', '응석부리다, 의지하다', 'N2', '동사', '子どもが親に甘える。', '아이가 부모에게 응석을 부리다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='甘える' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悩む', 'なやむ', '고민하다, 괴로워하다', 'N2', '동사', '進路について悩んでいる。', '진로에 대해 고민하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悩む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恐れる', 'おそれる', '두려워하다', 'N2', '동사', '失敗を恐れず挑戦する。', '실패를 두려워하지 않고 도전하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恐れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '苦しむ', 'くるしむ', '괴로워하다, 고통받다', 'N2', '동사', '病気で長年苦しんだ。', '병으로 오랫동안 고통받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='苦しむ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '焦る', 'あせる', '초조해하다, 서두르다', 'N2', '동사', '締め切りが近くて焦っている。', '마감이 다가와 초조해하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='焦る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '照れる', 'てれる', '수줍어하다, 부끄러워하다', 'N2', '동사', '褒められて照れてしまった。', '칭찬을 받아 수줍어해 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='照れる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '落ち着く', 'おちつく', '진정되다, 안정되다', 'N2', '동사', '深呼吸して落ち着いた。', '심호흡을 하고 진정됐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='落ち着く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '落ち込む', 'おちこむ', '낙담하다, 침울해지다', 'N2', '동사', '失敗して落ち込んでしまった。', '실패해서 낙담해 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='落ち込む' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '驚く', 'おどろく', '놀라다', 'N2', '동사', '予想外の結果に驚いた。', '예상 밖의 결과에 놀랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='驚く' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '怒る', 'おこる', '화내다, 성내다', 'N2', '동사', '子どもがいたずらをして怒った。', '아이가 장난을 쳐서 화를 냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='怒る' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '親しむ', 'したしむ', '친숙해지다, 가까이하다', 'N2', '동사', '自然に親しむ機会を作る。', '자연과 친숙해지는 기회를 만들다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='親しむ' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '打ち明ける', 'うちあける', '털어놓다, 솔직히 말하다', 'N2', '동사', '悩みを親友に打ち明けた。', '고민을 절친한 친구에게 털어놓았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='打ち明ける' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '言い聞かせる', 'いいきかせる', '타이르다, 납득시키다', 'N2', '동사', '子どもに言い聞かせる。', '아이에게 타이르다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='言い聞かせる' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '諦める', 'あきらめる', '포기하다, 단념하다', 'N2', '동사', 'まだ諦めるには早すぎる。', '아직 포기하기엔 너무 이르다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='諦める' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恵まれる', 'めぐまれる', '혜택을 받다, 축복받다', 'N2', '동사', '自然に恵まれた土地で育った。', '자연의 혜택을 받은 땅에서 자랐다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恵まれる' AND jlpt_level='N2');

-- ============================================================
-- い형용사 (い-Adjectives) — 15語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '幼い', 'おさない', '어리다, 유치하다', 'N2', 'い형용사', '幼い頃の夢を覚えている。', '어린 시절의 꿈을 기억하고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='幼い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'くやしい', 'くやしい', '억울하다, 분하다', 'N2', 'い형용사', '負けてくやしい思いをした。', '져서 분한 느낌을 받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='くやしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'もどかしい', 'もどかしい', '안타깝다, 답답하다', 'N2', 'い형용사', '伝わらなくてもどかしい。', '전달이 안 돼서 답답하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='もどかしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'うとましい', 'うとましい', '싫다, 꺼림칙하다', 'N2', 'い형용사', '干渉されるのがうとましい。', '간섭받는 것이 꺼림칙하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='うとましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '悩ましい', 'なやましい', '고민스럽다, 괴롭다', 'N2', 'い형용사', '選択が多くて悩ましい状況だ。', '선택지가 많아 고민스러운 상황이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='悩ましい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慌ただしい', 'あわただしい', '분주하다, 어수선하다', 'N2', 'い형용사', '年末は何かと慌ただしい。', '연말에는 이래저래 분주하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慌ただしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物悲しい', 'ものがなしい', '왠지 슬프다, 쓸쓸하다', 'N2', 'い형용사', '秋の夕暮れは物悲しい雰囲気だ。', '가을 저녁노을은 왠지 슬픈 분위기이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物悲しい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物足りない', 'ものたりない', '부족하다, 아쉽다', 'N2', 'い형용사', '量が少なくて物足りない。', '양이 적어서 아쉽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='物足りない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恥ずかしい', 'はずかしい', '부끄럽다, 창피하다', 'N2', 'い형용사', '人前で失敗して恥ずかしかった。', '사람 앞에서 실수해서 부끄러웠다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='恥ずかしい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '心強い', 'こころづよい', '든든하다, 마음이 강해지다', 'N2', 'い형용사', '仲間がいると心強い。', '동료가 있으면 든든하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='心強い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '心細い', 'こころぼそい', '불안하다, 마음이 든든하지 않다', 'N2', 'い형용사', '初めての一人暮らしで心細い。', '처음 혼자 사는 생활이라 불안하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='心細い' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'ぎこちない', 'ぎこちない', '어색하다, 서투르다', 'N2', 'い형용사', '初対面でぎこちない会話をした。', '처음 만나 어색한 대화를 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='ぎこちない' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気まずい', 'きまずい', '어색하다, 껄끄럽다', 'N2', 'い형용사', '喧嘩の後、気まずい空気が続いた。', '싸움 후 어색한 분위기가 이어졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気まずい' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '不器用', 'ぶきよう', '손재주가 없음, 서툼', 'N2', 'い형용사', '不器用だから料理が苦手だ。', '손재주가 없어서 요리가 서툴다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='不器用' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '几帳面', 'きちょうめん', '꼼꼼함, 빈틈없음', 'N2', 'い형용사', '几帳面な性格で何でもきちんとする。', '꼼꼼한 성격으로 무엇이든 제대로 한다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='几帳面' AND jlpt_level='N2');

-- ============================================================
-- な형용사 (な-Adjectives) — 5語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '円満', 'えんまん', '원만함, 원만한', 'N2', 'な형용사', '円満な家庭を作ることが目標だ。', '원만한 가정을 만드는 것이 목표이다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='円満' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '清潔', 'せいけつ', '청결함', 'N2', 'な형용사', '清潔な環境を保つ。', '청결한 환경을 유지하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='清潔' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '気さく', 'きさく', '스스럼없음, 털털함', 'N2', 'な형용사', '気さくな人で話しやすい。', '스스럼없는 사람이라 말하기 쉽다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='気さく' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '慎重', 'しんちょう', '신중함', 'N2', 'な형용사', '慎重に判断してから行動する。', '신중하게 판단한 후에 행동하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='慎重' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '頑固', 'がんこ', '완고함, 고집스러움', 'N2', 'な형용사', '頑固な父はなかなか意見を変えない。', '완고한 아버지는 좀처럼 의견을 바꾸지 않는다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='頑固' AND jlpt_level='N2');

-- ============================================================
-- 부사 (Adverbs) — 5語
-- ============================================================

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '徐々に', 'じょじょに', '서서히, 점차', 'N2', '부사', '体の調子が徐々に回復してきた。', '몸 상태가 서서히 회복되어 왔다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='徐々に' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '思わず', 'おもわず', '자기도 모르게, 무심코', 'N2', '부사', '思わず笑ってしまった。', '자기도 모르게 웃어 버렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='思わず' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'さすが', 'さすが', '과연, 역시', 'N2', '부사', 'さすがプロだけあって仕事が早い。', '과연 프로답게 일이 빠르다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='さすが' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'せめて', 'せめて', '적어도, 최소한', 'N2', '부사', 'せめて一日一回は連絡してほしい。', '최소한 하루에 한 번은 연락해 주길 바란다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='せめて' AND jlpt_level='N2');

INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT 'やむを得ず', 'やむをえず', '어쩔 수 없이', 'N2', '부사', 'やむを得ず出張をキャンセルした。', '어쩔 수 없이 출장을 취소했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='やむを得ず' AND jlpt_level='N2');
