-- ============================================================
-- JLPT N1 한자 확장 batch 2 (AI 생성 — 검증 예정)
-- 상용한자 중 DB 미보유 N1급 22자. 벽자(非常用)는 제외.
-- ============================================================
INSERT INTO jlpt_kanji (kanji, reading_on, reading_kun, meaning_ko, meaning_en, stroke_count, jlpt_level, example_words, korean_gloss) VALUES
('憧', 'ショウ、ドウ', 'あこが.れる', '동(憧), 동경하다', 'long for, yearn', 15, 'N1', '[{"word":"憧憬","meaning":"동경","reading":"しょうけい"},{"word":"憧れる","meaning":"동경하다","reading":"あこがれる"}]', '동경할 동'),
('摯', 'シ', '', '지(摯), 진지하다', 'sincere, earnest', 15, 'N1', '[{"word":"真摯","meaning":"진지함","reading":"しんし"}]', '잡을 지'),
('槍', 'ソウ', 'やり', '창(槍), 창', 'spear, lance', 14, 'N1', '[{"word":"槍","meaning":"창","reading":"やり"},{"word":"槍術","meaning":"창술","reading":"そうじゅつ"}]', '창 창'),
('橙', 'トウ', 'だいだい', '등(橙), 등자·주황색', 'bitter orange', 16, 'N1', '[{"word":"橙色","meaning":"주황색","reading":"だいだいいろ"},{"word":"橙","meaning":"등자","reading":"だいだい"}]', '등자나무 등'),
('淵', 'エン', 'ふち', '연(淵), 못·깊은 곳', 'abyss, deep pool', 12, 'N1', '[{"word":"深淵","meaning":"심연","reading":"しんえん"},{"word":"淵","meaning":"깊은 곳","reading":"ふち"}]', '못 연'),
('牽', 'ケン', 'ひ.く', '견(牽), 끌다', 'pull, lead', 11, 'N1', '[{"word":"牽引","meaning":"견인","reading":"けんいん"},{"word":"牽制","meaning":"견제","reading":"けんせい"}]', '끌 견'),
('狙', 'ソ', 'ねら.う', '저(狙), 노리다', 'aim at, target', 8, 'N1', '[{"word":"狙撃","meaning":"저격","reading":"そげき"},{"word":"狙う","meaning":"노리다","reading":"ねらう"}]', '노릴 저'),
('琢', 'タク', '', '탁(琢), 갈다·연마하다', 'polish, refine', 11, 'N1', '[{"word":"琢磨","meaning":"탁마","reading":"たくま"},{"word":"切磋琢磨","meaning":"절차탁마","reading":"せっさたくま"}]', '다듬을 탁'),
('瘍', 'ヨウ', '', '양(瘍), 종기', 'tumor, sore', 14, 'N1', '[{"word":"潰瘍","meaning":"궤양","reading":"かいよう"},{"word":"腫瘍","meaning":"종양","reading":"しゅよう"}]', '종기 양'),
('礁', 'ショウ', '', '초(礁), 암초', 'reef', 17, 'N1', '[{"word":"暗礁","meaning":"암초","reading":"あんしょう"},{"word":"珊瑚礁","meaning":"산호초","reading":"さんごしょう"}]', '암초 초'),
('稚', 'チ', '', '치(稚), 어리다', 'immature, young', 13, 'N1', '[{"word":"幼稚","meaning":"유치","reading":"ようち"},{"word":"稚拙","meaning":"치졸","reading":"ちせつ"}]', '어릴 치'),
('箋', 'セン', '', '전(箋), 종이쪽·처방전', 'slip of paper', 14, 'N1', '[{"word":"処方箋","meaning":"처방전","reading":"しょほうせん"},{"word":"付箋","meaning":"부전(포스트잇)","reading":"ふせん"}]', '글 전'),
('籠', 'ロウ', 'かご、こ.もる', '롱(籠), 바구니·틀어박히다', 'basket, seclude', 22, 'N1', '[{"word":"籠城","meaning":"농성","reading":"ろうじょう"},{"word":"籠","meaning":"바구니","reading":"かご"}]', '대바구니 롱'),
('罵', 'バ', 'ののし.る', '매(罵), 욕하다·꾸짖다', 'abuse, revile', 15, 'N1', '[{"word":"罵倒","meaning":"매도","reading":"ばとう"},{"word":"罵る","meaning":"욕하다","reading":"ののしる"}]', '꾸짖을 매'),
('薪', 'シン', 'たきぎ', '신(薪), 땔나무', 'firewood', 16, 'N1', '[{"word":"薪","meaning":"땔나무","reading":"たきぎ"},{"word":"薪炭","meaning":"신탄","reading":"しんたん"}]', '섶 신'),
('褒', 'ホウ', 'ほ.める', '포(褒), 칭찬하다', 'praise', 15, 'N1', '[{"word":"褒美","meaning":"상","reading":"ほうび"},{"word":"褒める","meaning":"칭찬하다","reading":"ほめる"}]', '기릴 포'),
('貪', 'ドン、タン', 'むさぼ.る', '탐(貪), 탐하다', 'covet, crave', 11, 'N1', '[{"word":"貪欲","meaning":"탐욕","reading":"どんよく"},{"word":"貪る","meaning":"탐하다","reading":"むさぼる"}]', '탐할 탐'),
('蹴', 'シュウ', 'け.る', '축(蹴), 차다', 'kick', 19, 'N1', '[{"word":"一蹴","meaning":"일축","reading":"いっしゅう"},{"word":"蹴る","meaning":"차다","reading":"ける"}]', '찰 축'),
('緯', 'イ', '', '위(緯), 씨실·위도', 'latitude, weft', 16, 'N1', '[{"word":"緯度","meaning":"위도","reading":"いど"},{"word":"経緯","meaning":"경위","reading":"けいい"}]', '씨 위'),
('劾', 'ガイ', '', '핵(劾), 캐묻다·탄핵하다', 'censure, impeach', 8, 'N1', '[{"word":"弾劾","meaning":"탄핵","reading":"だんがい"}]', '캐물을 핵'),
('賂', 'ロ', '', '뢰(賂), 뇌물', 'bribe', 13, 'N1', '[{"word":"賄賂","meaning":"뇌물","reading":"わいろ"}]', '뇌물 뢰'),
('斬', 'ザン', 'き.る', '참(斬), 베다', 'behead, cut', 11, 'N1', '[{"word":"斬新","meaning":"참신","reading":"ざんしん"},{"word":"斬る","meaning":"베다","reading":"きる"}]', '벨 참');
