-- k_c_extra.sql: 常用漢字 N1追加 (검증된 미포함 字, 전획수)

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '嘉','カ','よし','아름다울 가','N1','[{"word":"嘉納","reading":"かのう","meaning":"승낙, 받아들임"},{"word":"嘉賞","reading":"かしょう","meaning":"칭찬, 포상"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='嘉');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '嘗','ショウ','かつて','일찍이 상','N1','[{"word":"嘗て","reading":"かつて","meaning":"일찍이, 예전에"},{"word":"嘗試","reading":"しょうし","meaning":"시도"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='嘗');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '嶺','レイ','みね','재 령','N1','[{"word":"嶺","reading":"みね","meaning":"산마루, 고개"},{"word":"山嶺","reading":"さんれい","meaning":"산봉우리"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='嶺');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '徴','チョウ','','부를 징','N1','[{"word":"特徴","reading":"とくちょう","meaning":"특징"},{"word":"徴収","reading":"ちょうしゅう","meaning":"징수"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='徴');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '毀','キ','こぼつ','헐 훼','N1','[{"word":"毀損","reading":"きそん","meaning":"훼손"},{"word":"毀誉","reading":"きよ","meaning":"훼예, 비방과 칭찬"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='毀');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '瞭','リョウ','','밝을 료','N1','[{"word":"明瞭","reading":"めいりょう","meaning":"명료"},{"word":"瞭然","reading":"りょうぜん","meaning":"명백함, 뚜렷함"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='瞭');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '稽','ケイ','','상고할 계','N1','[{"word":"稽古","reading":"けいこ","meaning":"연습, 수련"},{"word":"滑稽","reading":"こっけい","meaning":"우스꽝스러움"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='稽');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '罹','リ','かかる','걸릴 리','N1','[{"word":"罹患","reading":"りかん","meaning":"이환, 병에 걸림"},{"word":"罹災","reading":"りさい","meaning":"이재, 재해를 당함"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='罹');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '醤','ショウ','ひしお','장 장','N1','[{"word":"醤油","reading":"しょうゆ","meaning":"간장"},{"word":"醤","reading":"ひしお","meaning":"된장, 장류"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='醤');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '頒','ハン','','나눌 반','N1','[{"word":"頒布","reading":"はんぷ","meaning":"반포, 배포"},{"word":"頒価","reading":"はんか","meaning":"반포 가격"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='頒');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '凛','リン','','늠름할 름','N1','[{"word":"凛々しい","reading":"りりしい","meaning":"늠름하다, 씩씩하다"},{"word":"凛然","reading":"りんぜん","meaning":"늠름함, 엄숙함"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='凛');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '賑','シン','にぎわう','번성할 진','N1','[{"word":"賑わい","reading":"にぎわい","meaning":"번화함, 활기"},{"word":"賑やか","reading":"にぎやか","meaning":"번화하다, 활기차다"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='賑');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '橘','キツ','たちばな','귤 귤','N1','[{"word":"橘","reading":"たちばな","meaning":"귤나무 (일본 재래종)"},{"word":"橘色","reading":"たちばないろ","meaning":"귤색, 주황색"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='橘');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '煤','バイ','すす','그을음 매','N1','[{"word":"煤煙","reading":"ばいえん","meaning":"매연"},{"word":"煤","reading":"すす","meaning":"그을음, 검댕"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='煤');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '畿','キ','','기내 기','N1','[{"word":"近畿","reading":"きんき","meaning":"긴키 (오사카·교토 인근 지역)"},{"word":"畿内","reading":"きない","meaning":"기내, 수도 인근 지역"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='畿');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '訃','フ','','부고 부','N1','[{"word":"訃報","reading":"ふほう","meaning":"부고, 사망 소식"},{"word":"訃音","reading":"ふいん","meaning":"부음"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='訃');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '諫','カン','いさめる','간할 간','N1','[{"word":"諫言","reading":"かんげん","meaning":"간언, 간하는 말"},{"word":"諫める","reading":"いさめる","meaning":"간하다, 충고하다"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='諫');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '錦','キン','にしき','비단 금','N1','[{"word":"錦","reading":"にしき","meaning":"비단, 금란"},{"word":"錦旗","reading":"きんき","meaning":"금기, 금빛 깃발"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='錦');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '錮','コ','','가둘 고','N1','[{"word":"禁錮","reading":"きんこ","meaning":"금고 (자유형의 일종)"},{"word":"錮疾","reading":"こしつ","meaning":"고질, 고치기 어려운 병"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='錮');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '魯','ロ','','노둔할 로','N1','[{"word":"魯鈍","reading":"ろどん","meaning":"노둔, 아둔함"},{"word":"魯国","reading":"ろこく","meaning":"노나라 (춘추시대 국명)"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='魯');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '喉','コウ','のど','목구멍 후','N1','[{"word":"喉","reading":"のど","meaning":"목구멍, 인후"},{"word":"喉頭","reading":"こうとう","meaning":"후두"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='喉');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '丼','ドン','どんぶり','덮밥 정','N1','[{"word":"丼","reading":"どんぶり","meaning":"덮밥, 덮밥 그릇"},{"word":"牛丼","reading":"ぎゅうどん","meaning":"규동 (소고기 덮밥)"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='丼');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '乞','コツ','こう','빌 걸','N1','[{"word":"乞食","reading":"こじき","meaning":"거지, 구걸"},{"word":"乞う","reading":"こう","meaning":"빌다, 청하다"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='乞');

INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, jlpt_level, example_words) SELECT '亥','ガイ','い','돼지 해','N1','[{"word":"亥年","reading":"いどし","meaning":"해년, 돼지띠 해"},{"word":"亥","reading":"い","meaning":"해 (십이지의 열두 번째)"}]'::jsonb WHERE NOT EXISTS (SELECT 1 FROM jlpt_kanji WHERE kanji='亥');
