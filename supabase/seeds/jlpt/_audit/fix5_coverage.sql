-- encoding: UTF-8
-- fix5_coverage.sql
-- 모의고사 N1 출제 항목 중 jlpt_vocabulary / jlpt_grammar 학습목록 누락분 추가
-- 어휘 38개 + 문법 9개
-- 중복 가드: WHERE NOT EXISTS (해당 word / pattern 이 어느 레벨에든 존재하면 건너뜀)

-- ============================================================
-- N1 어휘 (38개)
-- ============================================================

-- 1. 人脈 (じんみゃく)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '人脈', 'じんみゃく', '인맥', 'N1', '명사',
       '社会活動で人脈を広げることは、キャリア形成において重要だ。',
       '사회활동에서 인맥을 넓히는 것은 커리어 형성에 있어 중요하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '人脈');

-- 2. 奔放 (ほんぽう)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '奔放', 'ほんぽう', '자유분방', 'N1', '형용동사',
       '彼の奔放な生き方は周囲を驚かせた。',
       '그의 자유분방한 삶의 방식은 주변을 놀라게 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '奔放');

-- 3. 清廉 (せいれん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '清廉', 'せいれん', '청렴', 'N1', '형용동사',
       'その政治家は長年にわたり清廉な姿勢を貫いた。',
       '그 정치인은 오랜 기간 청렴한 자세를 관철했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '清廉');

-- 4. 詭弁 (きべん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '詭弁', 'きべん', '궤변', 'N1', '명사',
       '彼女の発言は論理的に矛盾しており、詭弁と批判された。',
       '그녀의 발언은 논리적으로 모순되어 궤변이라고 비판받았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '詭弁');

-- 5. 紐解く (ひもとく)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '紐解く', 'ひもとく', '풀어 살피다, 탐구하다', 'N1', '동사',
       '古い書物を紐解くと、当時の価値観が浮かび上がってくる。',
       '오래된 서적을 풀어 살피면 당시 사람들의 가치관이 떠오른다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '紐解く');

-- 6. 恣意的 (しいてき)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '恣意的', 'しいてき', '자의적', 'N1', '형용동사',
       '彼女の主張は恣意的な解釈に基づいており、根拠に乏しい。',
       '그녀의 주장은 자의적인 해석에 바탕을 두고 있어 근거가 부족하다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '恣意的');

-- 7. 俯瞰 (ふかん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '俯瞰', 'ふかん', '부감, 조감', 'N1', '명사・する동사',
       '長期的な視点から事業を俯瞰することが経営者に求められる。',
       '장기적인 관점에서 사업을 조감하는 것이 경영자에게 요구된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '俯瞰');

-- 8. 傲岸不遜 (ごうがんふそん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '傲岸不遜', 'ごうがんふそん', '오만불손', 'N1', '형용동사・사자성어',
       '彼の態度は傲岸不遜であり、周囲の反感を買った。',
       '그의 태도는 오만불손하여 주변의 반감을 샀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '傲岸不遜');

-- 9. 滔々 (とうとう)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '滔々', 'とうとう', '거침없이, 도도히', 'N1', '부사・형용동사',
       '彼は反論に対して滔々と持論を展開した。',
       '그는 반론에 대해 거침없이 자신의 지론을 펼쳤다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '滔々');

-- 10. 批准 (ひじゅん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '批准', 'ひじゅん', '비준', 'N1', '명사・する동사',
       'その条約は批准されるまでに数年の歳月を要した。',
       '그 조약은 비준되기까지 수 년의 세월이 걸렸다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '批准');

-- 11. 隠遁 (いんとん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '隠遁', 'いんとん', '은둔', 'N1', '명사・する동사',
       'その画家は晩年、隠遁生活を送りながら傑作を生み出した。',
       '그 화가는 만년에 은둔 생활을 하면서 걸작을 만들어 냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '隠遁');

-- 12. 卓抜 (たくばつ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '卓抜', 'たくばつ', '탁월', 'N1', '형용동사',
       '彼女の卓抜した語学力は留学生の中でも際立っていた。',
       '그녀의 탁월한 어학 실력은 유학생 중에서도 두드러졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '卓抜');

-- 13. 逼迫 (ひっぱく)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逼迫', 'ひっぱく', '절박, 핍박', 'N1', '명사・する동사',
       '政府は経済の逼迫した状況を打開するため新たな政策を打ち出した。',
       '정부는 경제가 절박한 상황을 타개하기 위해 새로운 정책을 내놓았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '逼迫');

-- 14. 韜晦 (とうかい)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '韜晦', 'とうかい', '재능을 감춤, 도회', 'N1', '명사・する동사',
       '彼の韜晦した物言いに、周囲はその真意を測りかねた。',
       '그의 재능을 감춘 듯한 말투에 주변은 진의를 헤아리지 못했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '韜晦');

-- 15. 妥結 (だけつ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '妥結', 'だけつ', '타결', 'N1', '명사・する동사',
       '長い交渉の末、両社は妥結に至った。',
       '오랜 교섭 끝에 두 회사는 타결에 이르렀다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '妥結');

-- 16. 飽和 (ほうわ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '飽和', 'ほうわ', '포화', 'N1', '명사・する동사',
       '市場の飽和状態が続き、新規参入者にとって厳しい環境が続いている。',
       '시장의 포화 상태가 계속되어 신규 진입자에게 혹독한 환경이 이어지고 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '飽和');

-- 17. 顕彰 (けんしょう)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '顕彰', 'けんしょう', '현창, 표창', 'N1', '명사・する동사',
       '彼女の功績は後世に顕彰され、記念碑が建てられた。',
       '그녀의 공적은 후세에 현창되어 기념비가 세워졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '顕彰');

-- 18. 真摯 (しんし)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '真摯', 'しんし', '진지함, 진지함', 'N1', '형용동사',
       '彼女はどんな相手にも真摯な態度で接し、信頼を集めた。',
       '그녀는 어떤 상대에게도 진지한 태도로 대하여 신뢰를 모았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '真摯');

-- 19. 物議 (ぶつぎ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '物議', 'ぶつぎ', '물의', 'N1', '명사',
       '彼の提案は会議で物議を呼び、採決は紛糾した。',
       '그의 제안은 회의에서 물의를 빚어 표결이 분규에 빠졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '物議');

-- 20. 甘受 (かんじゅ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '甘受', 'かんじゅ', '감수', 'N1', '명사・する동사',
       '彼女は部下の失敗を自分の責任として甘受し、上司に報告した。',
       '그녀는 부하의 실수를 자신의 책임으로 감수하고 상사에게 보고했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '甘受');

-- 21. 錯綜 (さくそう)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '錯綜', 'さくそう', '착종, 뒤엉킴', 'N1', '명사・する동사',
       '経済政策をめぐる議論は複雑で、専門家の間でも見解が錯綜している。',
       '경제 정책을 둘러싼 논의는 복잡하여 전문가들 사이에서도 견해가 뒤엉켜 있다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '錯綜');

-- 22. 訴求 (そきゅう)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '訴求', 'そきゅう', '소구', 'N1', '명사・する동사',
       '候補者は演説で聴衆の感情に訴求し、大きな支持を集めた。',
       '후보자는 연설에서 청중의 감정에 소구하여 큰 지지를 모았다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '訴求');

-- 23. 煩雑化 (はんざつか)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '煩雑化', 'はんざつか', '번잡화', 'N1', '명사・する동사',
       '新制度の導入は業務の煩雑化を招くとして、現場から強い抵抗があった。',
       '새 제도 도입이 업무의 번잡화를 초래한다며 현장에서 강한 저항이 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '煩雑化');

-- 24. 盲点 (もうてん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '盲点', 'もうてん', '맹점', 'N1', '명사',
       '彼は交渉の席で相手の主張の盲点をつき、有利な条件を引き出した。',
       '그는 협상 자리에서 상대 주장의 맹점을 찔러 유리한 조건을 이끌어냈다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '盲点');

-- 25. 逡巡 (しゅんじゅん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '逡巡', 'しゅんじゅん', '주저, 망설임', 'N1', '명사・する동사',
       '重要な決断を前に逡巡したが、最終的に前進することを選んだ。',
       '중요한 결단 앞에서 주저했지만 결국 앞으로 나아가기로 선택했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '逡巡');

-- 26. 斟酌 (しんしゃく)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '斟酌', 'しんしゃく', '참작', 'N1', '명사・する동사',
       '相手の事情を斟酌して、処分を軽くした。',
       '상대방의 사정을 참작하여 처분을 가볍게 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '斟酌');

-- 27. 敷衍 (ふえん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '敷衍', 'ふえん', '부연', 'N1', '명사・する동사',
       '専門用語をわかりやすく敷衍して説明することが求められる。',
       '전문 용어를 알기 쉽게 부연 설명하는 것이 요구된다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '敷衍');

-- 28. 瑕疵 (かし)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '瑕疵', 'かし', '하자', 'N1', '명사',
       '契約書に瑕疵があることが判明し、再交渉となった。',
       '계약서에 하자가 있다는 것이 밝혀져 재교섭이 되었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '瑕疵');

-- 29. 忖度 (そんたく)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '忖度', 'そんたく', '헤아림, (상위자의 의향을) 추측하여 행동함', 'N1', '명사・する동사',
       '上司の意向を忖度して先回りして対応した。',
       '상사의 의향을 헤아려 미리 대응했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '忖度');

-- 30. 蓋然性 (がいぜんせい)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '蓋然性', 'がいぜんせい', '개연성', 'N1', '명사',
       'この仮説が正しい蓋然性は高いと専門家は述べた。',
       '이 가설이 옳을 개연성이 높다고 전문가는 말했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '蓋然性');

-- 31. 玄人好み (くろうとごのみ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '玄人好み', 'くろうとごのみ', '전문가 취향', 'N1', '명사・형용동사',
       'その作品は玄人好みの仕上がりで、一般受けしなかった。',
       '그 작품은 전문가 취향의 완성도여서 일반 대중에게는 인기가 없었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '玄人好み');

-- 32. 冗長 (じょうちょう)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '冗長', 'じょうちょう', '장황함', 'N1', '형용동사',
       '彼の説明は冗長で、聴衆は途中から集中力を失った。',
       '그의 설명은 장황하여 청중은 도중에 집중력을 잃었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '冗長');

-- 33. 一刀両断 (いっとうりょうだん)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '一刀両断', 'いっとうりょうだん', '일도양단', 'N1', '명사・사자성어',
       '彼女はその問題を一刀両断に処理した。',
       '그녀는 그 문제를 일도양단으로 처리했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '一刀両断');

-- 34. 忸怩 (じくじ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '忸怩', 'じくじ', '부끄러움, 내심 부끄럽게 여김', 'N1', '형용동사(忸怩たる)',
       '自分の失態を思い返し、忸怩たる思いを抑えられなかった。',
       '자신의 실태를 되돌아보며 부끄러운 마음을 억누를 수 없었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '忸怩');

-- 35. 紛糾 (ふんきゅう)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '紛糾', 'ふんきゅう', '분규, 혼란', 'N1', '명사・する동사',
       '議論が紛糾し、採決は翌日に持ち越された。',
       '의론이 분규에 빠져 표결은 다음 날로 미뤄졌다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '紛糾');

-- 36. 凌駕 (りょうが)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '凌駕', 'りょうが', '능가', 'N1', '명사・する동사',
       '彼女の実力はライバルを凌駕していた。',
       '그녀의 실력은 라이벌을 능가하고 있었다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '凌駕');

-- 37. 躊躇 (ちゅうちょ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '躊躇', 'ちゅうちょ', '주저, 망설임', 'N1', '명사・する동사',
       '彼は躊躇せずに申し出て、全員を驚かせた。',
       '그는 주저하지 않고 자원하여 모두를 놀라게 했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '躊躇');

-- 38. 紆余曲折 (うよきょくせつ)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, example_sentence_ko)
SELECT '紆余曲折', 'うよきょくせつ', '우여곡절', 'N1', '명사・사자성어',
       'その計画は実現まで紆余曲折があったが、最終的に成功した。',
       '그 계획은 실현까지 우여곡절이 있었지만 결국 성공했다.'
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word = '紆余曲折');


-- ============================================================
-- N1 문법 (9개)
-- ============================================================

-- G1. 〜に起因して (~에 기인하여)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜に起因して', '~에 기인하여', '〜が原因であることを書き言葉的に表す。', 'N1',
       '名詞 + に起因して / に起因する',
       '명사에 붙어 원인·이유를 나타내는 격식 표현. 「〜によって」보다 문어적.',
       'reason',
       '[{"ja": "その事故は設備の老朽化に起因して発生したとみられる。", "ko": "그 사고는 설비 노후화에 기인하여 발생한 것으로 보인다."}]'::jsonb,
       301
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜に起因して');

-- G2. 〜はどうあれ (~이 어찌됐든)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜はどうあれ', '~이 어찌됐든, ~이 어떻든', '〜の状態・結果に関わらず、の意。', 'N1',
       '名詞 + はどうあれ',
       '결과나 상황이 어떠하든 관계없이. 「〜にかかわらず」의 격식·구어 표현.',
       'contrast',
       '[{"ja": "結果はどうあれ、全力を尽くすことに意義がある。", "ko": "결과가 어찌됐든 최선을 다하는 것에 의의가 있다."}]'::jsonb,
       302
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜はどうあれ');

-- G3. 〜というのに (~인데도)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜というのに', '~인데도, ~임에도 불구하고', '〜であるにもかかわらず、話者の不満・落胆を含む逆接表現。', 'N1',
       '普通形 + というのに',
       '화자의 불만·낙담이 담긴 역접. 「〜のに」보다 감정이 강함.',
       'contrast',
       '[{"ja": "締め切りが明日に迫っているというのに、まだ半分も終わっていない。", "ko": "마감이 내일로 다가왔는데도 아직 절반도 끝나지 않았다."}]'::jsonb,
       303
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜というのに');

-- G4. 〜もひとえに (~도 오로지 ~덕분에)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜もひとえに', '오로지 ~덕분에, ~은 전적으로 ~의 덕', '〜は全くもって〜のおかげだ、という感謝・帰因の表現。', 'N1',
       'これも / それも + ひとえに + 名詞 + のおかげ / によるもの',
       '공적이나 결과를 한 가지 원인에 전부 돌리는 격식·감사 표현. 「これもひとえに」가 관용적.',
       'reason',
       '[{"ja": "これもひとえに皆様のご支援のおかげです。", "ko": "이것도 오로지 여러분의 지원 덕분입니다."}]'::jsonb,
       304
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜もひとえに');

-- G5. 〜を受けて (~을 받아, ~을 계기로)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜を受けて', '~을 받아, ~을 계기로', 'ある出来事・状況を引き金として次の行動が起こることを示す。', 'N1',
       '名詞 + を受けて',
       '어떤 사건·상황을 받아서 다음 행동이 일어남. 뉴스·공문서에 자주 등장.',
       'reason',
       '[{"ja": "事態の深刻化を受けて、政府は緊急対策を講じた。", "ko": "사태 악화를 받아 정부는 긴급 대책을 마련했다."}]'::jsonb,
       305
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜を受けて');

-- G6. 〜にあたり (~할 때, ~즈음하여)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜にあたり', '~할 때, ~즈음하여', '重要な行為・場面に際してという意味の改まった表現。', 'N1',
       '動詞辞書形 / 名詞 + にあたり（にあたって）',
       '중요한 행위나 특별한 시점임을 나타내는 격식 표현. 「〜にあたって」와 동의.',
       'time',
       '[{"ja": "重要な決定を下すにあたり、十分なデータを参考にすべきだ。", "ko": "중요한 결정을 내릴 즈음하여 충분한 데이터를 참고해야 한다."}]'::jsonb,
       306
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜にあたり');

-- G7. 〜としても (~라 하더라도)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜としても', '~라 하더라도, ~이라고 해도', '仮定の逆接。たとえ〜であっても、の意。', 'N1',
       '普通形 + としても / 名詞 + だとしても',
       '가정적 역접. 「〜ても」보다 격식적·논리적.',
       'condition',
       '[{"ja": "いくら財産があったとしても、健康を失っては意味がない。", "ko": "아무리 재산이 있다 하더라도 건강을 잃으면 의미가 없다."}]'::jsonb,
       307
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜としても');

-- G8. 〜を挙げて (온 ~이 나서서, 총력을 기울여)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜を挙げて', '온 ~이 나서서, 총력을 기울여', '集団・組織の全員が一丸となって取り組む様子を表す。', 'N1',
       '名詞（集団） + を挙げて',
       '「社会を挙げて」「国を挙げて」「一丸となって」と近い意味. 문어·뉴스에 자주.',
       'manner',
       '[{"ja": "環境問題は社会を挙げて取り組むべき課題だ。", "ko": "환경 문제는 온 사회가 나서서 임해야 할 과제다."}]'::jsonb,
       308
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜を挙げて');

-- G9. 〜にもかかわらず (~에도 불구하고)
INSERT INTO jlpt_grammar (pattern, meaning_ko, meaning_ja, jlpt_level, formation, formation_detail, category, example_sentences, sort_order)
SELECT '〜にもかかわらず', '~에도 불구하고', '〜という事実があるのに、逆の結果になることを示す。', 'N1',
       '普通形 / 名詞 + にもかかわらず',
       '역접 강조. 「〜のに」보다 격식적. 뒤에 예상 밖의 결과가 옴.',
       'contrast',
       '[{"ja": "入場料が高いにもかかわらず、毎週末この美術館を訪れる人が絶えない。", "ko": "입장료가 비쌈에도 불구하고 매 주말 이 미술관을 찾는 사람이 끊이지 않는다."}]'::jsonb,
       309
WHERE NOT EXISTS (SELECT 1 FROM jlpt_grammar WHERE pattern = '〜にもかかわらず');
