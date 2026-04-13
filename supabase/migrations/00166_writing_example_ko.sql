BEGIN;

ALTER TABLE it_glossary ADD COLUMN IF NOT EXISTS example_sentence_ko TEXT;

-- ============================================
-- expressions — request (18)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '바쁘신 와중에 죄송합니다만, 이 자료를 확인해 주실 수 있으시겠습니까.' WHERE term_ja = 'お忙しいところ恐れ入りますが' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '첨부한 견적서에 대해, 편하실 때 확인해 주십시오.' WHERE term_ja = 'お手すきの際にご確認ください' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '버그 수정에 대해 대응해 주시면 감사하겠습니다.' WHERE term_ja = 'ご対応いただけますと幸いです' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '새로운 개발 도구의 도입에 대해 검토 부탁드립니다.' WHERE term_ja = 'ご検討のほどよろしくお願いいたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '수고스럽겠지만, 첨부 파일의 내용을 확인 부탁드립니다.' WHERE term_ja = 'お手数ですが、ご確認をお願いいたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '죄송합니다만, 이 API의 사양에 대해 알려 주실 수 있으시겠습니까.' WHERE term_ja = '恐れ入りますが、ご教示いただけますでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '테스트 결과 리포트를 공유해 주실 수 없으시겠습니까.' WHERE term_ja = '〜していただけないでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '시스템 이전에 따라 여러분의 협력 부탁드립니다.' WHERE term_ja = 'ご協力をお願いいたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '프로젝트의 방침에 대해 승인해 주시기를 바랍니다.' WHERE term_ja = '〜いただきたく存じます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '기술적인 과제가 있어서, 도움 주시면 감사하겠습니다.' WHERE term_ja = 'お力添えいただけますと助かります' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '사양에 대해 인식에 차이가 없는지 확인시켜 주십시오. 화면A에서는 직접 전환하지 않는다는 이해로 맞습니까.' WHERE term_ja = '認識に相違がないか確認させてください' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '수정한 설계서를 보내드렸으니, 확인해 주실 수 있으시겠습니까.' WHERE term_ja = 'ご確認いただけますでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '혹시 몰라 확인드리고 싶은데요, 납품일은 이번 달 말로 틀림없겠습니까.' WHERE term_ja = '念のため確認させていただきたいのですが' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '배포는 금요일 야간에 실시한다, 이 인식이 맞는 것이겠습니까.' WHERE term_ja = 'この認識で合っておりますでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '요건을 정리하였습니다. 아래의 이해로 맞겠습니까. 1. 로그인 화면에 SSO 기능을 추가한다.' WHERE term_ja = '以下の理解でよろしいでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '그러면 다음 릴리스에 이 기능은 포함하지 않는다는 것으로 되겠습니까.' WHERE term_ja = '〜ということでよろしいでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '오늘 미팅 전에 확인 사항이 있습니다. 테스트 환경의 접근 권한에 대해 여쭤보고 싶은데요.' WHERE term_ja = '確認事項がございます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '지적 부분을 수정하였으니, 다시 한번 확인 부탁드립니다.' WHERE term_ja = '再度ご確認をお願いいたします' AND category = 'expression';

-- ============================================
-- expressions — report (18)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '현재 시점의 진척을 보고하겠습니다. 화면 설계는 예정대로 완료되었습니다.' WHERE term_ja = '現時点での進捗を報告いたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '결론부터 말씀드리겠습니다. 이번 릴리스는 일주일 연기할 필요가 있습니다.' WHERE term_ja = '結論から申し上げます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '서버 장애 건, 보고드립니다. 원인은 디스크 용량 부족이었습니다.' WHERE term_ja = '〜の件、ご報告いたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '제3분기 개발 실적에 대해 아래와 같이 보고드립니다.' WHERE term_ja = '以下の通りご報告申し上げます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '프로젝트 진척 상황을 전달드리겠습니다. 현재 구현 페이즈의 70%가 완료되었습니다.' WHERE term_ja = '進捗状況をお伝えいたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '개발 중에 발견된 문제점을 공유드리겠습니다.' WHERE term_ja = '問題点を共有させていただきます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '시스템의 현 상황을 설명드리겠습니다. 현재 안정적으로 가동 중입니다.' WHERE term_ja = '現状をご説明いたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '테스트 공정에서 지연이 발생하고 있는 점 사과드립니다. 현재 복구 방안을 검토 중입니다.' WHERE term_ja = '遅延が発生しておりますことをお詫び申し上げます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '의뢰하신 버그 수정이 완료되었기에 보고드립니다.' WHERE term_ja = '完了いたしましたのでご報告します' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '성능 저하 원인에 대해 조사 결과를 보고드리겠습니다.' WHERE term_ja = '調査結果をご報告いたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '죄송합니다, 납기에 지연이 발생하고 있습니다. 원인을 조사하여 다음 주 안에 복구하겠습니다.' WHERE term_ja = '申し訳ございません、納期に遅れが生じております' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '시스템 장애로 폐를 끼쳐 드려 죄송합니다. 현재 복구 작업을 진행하고 있습니다.' WHERE term_ja = 'ご迷惑をおかけして申し訳ございません' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '제출한 자료에 미비한 점이 있었던 것, 사과드립니다. 수정 버전을 다시 보내드리겠습니다.' WHERE term_ja = '不備がございましたこと、お詫び申し上げます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '유지보수 연장으로 불편을 끼쳐 드려 대단히 죄송합니다.' WHERE term_ja = 'ご不便をおかけして大変申し訳ございません' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '확인 부족이었습니다. 죄송합니다. 앞으로는 더블 체크를 철저히 하겠습니다.' WHERE term_ja = '確認不足でした。申し訳ございません' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '대응이 늦어져 죄송합니다. 질문하신 건에 대해 아래와 같이 답변드립니다.' WHERE term_ja = '対応が遅れまして申し訳ございません' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '기대에 부응하지 못해 죄송합니다. 현재 리소스로는 대응이 어려운 상황입니다.' WHERE term_ja = 'ご期待に添えず申し訳ございません' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '거듭 폐를 끼쳐 드려, 거듭 사과드립니다. 재발 방지에 힘쓰겠습니다.' WHERE term_ja = '重ねてお詫び申し上げます' AND category = 'expression';

-- ============================================
-- expressions — manner (24)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '오늘 시간을 내주셔서 진심으로 감사드렸습니다. 회의록은 나중에 보내드리겠습니다.' WHERE term_ja = 'お時間をいただき、誠にありがとうございました' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '신속한 대응, 감사합니다. 덕분에 예정대로 릴리스할 수 있을 것 같습니다.' WHERE term_ja = '迅速なご対応、ありがとうございます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '항상 신세지고 있습니다. 주식회사 ○○의 다나카입니다.' WHERE term_ja = 'いつもお世話になっております' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '오늘 잘 부탁드립니다. 바로 본론이지만, 안건에 따라 진행하겠습니다.' WHERE term_ja = '本日はよろしくお願いいたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '수고하셨습니다. 아까 회의에서 결정된 사항을 정리했습니다.' WHERE term_ja = 'お疲れ様です' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '오래간만입니다. 그 후 프로젝트 진척은 어떠신가요.' WHERE term_ja = 'ご無沙汰しております' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '계속 지원해 주시면 감사하겠습니다. 앞으로도 잘 부탁드립니다.' WHERE term_ja = '今後ともよろしくお願いいたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '리뷰 코멘트 감사합니다, 많은 도움이 되었습니다. 바로 수정하겠습니다.' WHERE term_ja = 'ありがとうございます、大変助かりました' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '연수에서 배운 Java 지식을 실무에서 활용하고 싶습니다. 특히 웹 애플리케이션 개발에 참여하고 싶습니다.' WHERE term_ja = '学んだ知識を実務で活かしたいです' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '맡겨진 태스크는 책임감을 가지고 끝까지 해내겠습니다. 전 직장에서도 납기 준수를 최우선으로 하고 있었습니다.' WHERE term_ja = '責任を持って最後までやり遂げます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '팀워크를 중요시합니다. 멤버와 적극적으로 커뮤니케이션하면서 개발을 진행하도록 노력하고 있습니다.' WHERE term_ja = 'チームワークを大切にしています' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '새로운 기술을 적극적으로 배워 나가고 싶습니다. 최근에는 클라우드 서비스에 대해 독학으로 공부하고 있습니다.' WHERE term_ja = '新しい技術を積極的に学んでいきたいです' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '귀사의 AI 개발 사업에 흥미를 가지고 지원하였습니다.' WHERE term_ja = '〜に興味を持ち、志望いたしました' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '귀사의 글로벌 개발 체제에 매력을 느꼈습니다. 다국적 팀에서의 경험을 쌓고 싶습니다.' WHERE term_ja = '貴社の〜に魅力を感じました' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '전 직장에서는 웹 애플리케이션의 백엔드 개발을 담당하고 있었습니다. 주로 Java와 Spring Boot를 사용하고 있었습니다.' WHERE term_ja = '前職では〜を担当しておりました' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '저의 강점은 끈기 있게 문제를 해결하는 능력이라고 생각합니다. 복잡한 버그 조사도 인내심을 갖고 임합니다.' WHERE term_ja = '自分の強みは〜だと考えております' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '담당자에게 확인하겠으니, 잠시만 기다려 주십시오.' WHERE term_ja = '少々お待ちください' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '죄송합니다만, 성함을 다시 한번 여쭤봐도 되겠습니까.' WHERE term_ja = 'もう一度伺ってもよろしいでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '전화 감사합니다. 주식회사 ○○입니다.' WHERE term_ja = 'お電話ありがとうございます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '지금 담당자가 부재중입니다. 돌아오는 대로 다시 전화드릴까요.' WHERE term_ja = 'ただいま担当者が不在にしております' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '확인해서 다시 전화드리겠습니다. 전화번호를 알려 주시겠습니까.' WHERE term_ja = '折り返しお電話いたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '다나카가 돌아오면, 회의 건을 전해 주실 수 있으시겠습니까.' WHERE term_ja = 'お伝えいただけますでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '다시 연락드리겠으니, 전화번호를 여쭤봐도 되겠습니까.' WHERE term_ja = 'お電話番号をお伺いしてもよろしいでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '실례지만, 어느 분이십니까. 담당자에게 연결해 드리겠습니다.' WHERE term_ja = '失礼ですが、どちら様でしょうか' AND category = 'expression';

-- ============================================
-- expressions — manner: 会議発言 (6)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '그러면 안건으로 들어가겠습니다. 오늘은 3가지가 있습니다.' WHERE term_ja = 'それでは議題に入らせていただきます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '이상이 시스템 개요 설명이었습니다. 질문이 있으시면 부탁드립니다.' WHERE term_ja = 'ご質問があればお願いいたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '한 가지 보충해도 되겠습니까. 지난달의 실적 데이터도 관련이 있습니다.' WHERE term_ja = '補足してもよろしいですか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '그 점에 대해 조금 의견을 말씀드리겠습니다. 기술적으로는 이쪽 방법이 효율적이라고 생각합니다.' WHERE term_ja = 'その点について少し意見を述べさせていただきます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '먼저 진행하기 전에, 요건에 대해 인식 맞추기를 할 수 있으면 합니다.' WHERE term_ja = '認識合わせをさせていただければと思います' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '여기까지 불명확한 점이 있으십니까. 없으시면 다음 섹션으로 넘어가겠습니다.' WHERE term_ja = 'ここまでで何かご不明な点はございますか' AND category = 'expression';

-- ============================================
-- expressions — manner: 対面応対 (5)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '오늘 바쁘신 와중에 와 주셔서 감사합니다. 바로 본론이지만, 회의실로 안내해 드리겠습니다.' WHERE term_ja = '本日はお忙しい中お越しいただきありがとうございます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '이쪽으로 오십시오, 안내해 드리겠습니다. 회의실은 3층입니다.' WHERE term_ja = 'こちらへどうぞ、ご案内いたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '처음 뵙겠습니다. 명함을 받아도 되겠습니까. 이것은 제 명함입니다.' WHERE term_ja = '名刺を頂戴してもよろしいですか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '음료는 무엇이 좋으시겠습니까. 커피와 홍차가 있습니다.' WHERE term_ja = 'お飲み物は何がよろしいでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '돌아가시기 전에, 잊으신 물건이 없는지 확인해 주십시오. 오늘 감사했습니다.' WHERE term_ja = 'お忘れ物がないかご確認ください' AND category = 'expression';

-- ============================================
-- expressions — manner: 顧客訪問 (4)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '실례하겠습니다. 오늘 미팅 시간을 내주셔서 감사합니다.' WHERE term_ja = 'お邪魔いたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '오늘 시간을 내주셔서 감사합니다. 바로 본론이지만, 제안 내용에 대해 설명드리겠습니다.' WHERE term_ja = '本日はお時間をいただきありがとうございます' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '오늘은 이만 실례하겠습니다. 다음 미팅 일정은 별도로 연락드리겠습니다.' WHERE term_ja = '本日はこれで失礼いたします' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '오늘 감사했습니다. 다음에도 잘 부탁드립니다.' WHERE term_ja = '次回もよろしくお願いいたします' AND category = 'expression';

-- ============================================
-- expressions — request: 口頭依頼 (5)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '한 가지, 직접 말씀드리고 싶은데, 시간 괜찮으시겠습니까.' WHERE term_ja = '直接お話しさせていただきたいのですが' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '다나카 씨, 잠시 시간 괜찮으시겠습니까. 설계에 대해 확인하고 싶은 점이 있습니다.' WHERE term_ja = '少しお時間よろしいでしょうか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '사양의 상세에 대해 구두로 설명드려도 되겠습니까. 그림을 보여드리면서가 이해하기 쉬울 것 같습니다.' WHERE term_ja = '口頭でご説明させていただいてもよろしいですか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '한가하시면 함께 확인해 주시겠습니까. 테스트 결과에 불명확한 점이 있어서요.' WHERE term_ja = 'お手すきでしたらご一緒にご確認いただけますか' AND category = 'expression';
UPDATE it_glossary SET example_sentence_ko = '준비가 되면, 편하신 때에 말씀해 주십시오. 바로 설명 드리러 가겠습니다.' WHERE term_ja = 'ご都合のよろしいときにお声がけください' AND category = 'expression';

-- ============================================
-- sentence_patterns — response (7)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '갑작스러운 연락 실례합니다. 주식회사 ABC시스템의 다나카라고 합니다. 귀사의 클라우드 서비스에 대해 여쭤보고자 연락드렸습니다.' WHERE term_ja = '突然のご連絡失礼いたします。○○会社の△△と申します。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '이번 시스템 장애 건으로 불편을 끼쳐드려 대단히 죄송합니다. 원인을 조사하여 재발 방지 대책을 마련하였으므로 보고드립니다.' WHERE term_ja = 'この度は○○の件でご迷惑をおかけし、誠に申し訳ございません。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '지난번 바쁘신 중에 시간을 내주셔서 감사했습니다. 제안해 주신 마이크로서비스 구성에 대해 팀 내에서 검토를 진행하고 있습니다.' WHERE term_ja = '先日はお忙しい中、お時間をいただきありがとうございました。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '이상, 확인 부탁드립니다. 불분명한 점이 있으시면 편하게 문의해 주십시오. 담당: 다나카 (내선: 1234)' WHERE term_ja = 'ご不明な点がございましたら、お気軽にお問い合わせください。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '한 가지 괜찮으시겠습니까. 테스트 공정의 스케줄에 대해 의견이 있습니다. 현재 계획에서는 버퍼가 부족한 것으로 보입니다.' WHERE term_ja = '一点よろしいでしょうか。○○について意見がございます。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '제 생각으로는 React가 최적이 아닐까 합니다. 컴포넌트의 재사용성이 높고, 팀 내에도 경험자가 많기 때문입니다.' WHERE term_ja = '私の考えとしましては、○○が最適ではないかと思います。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '죄송합니다만, 현재 다른 안건의 긴급 대응 사정으로 대응이 어려운 상황입니다. 다음 주 이후라면 대응 가능합니다만, 어떠신가요.' WHERE term_ja = '申し訳ございませんが、○○の都合により対応が難しい状況でございます。' AND category = 'sentence_pattern';

-- ============================================
-- sentence_patterns — request (13)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = 'API 연동 건에 대해 대응을 부탁드리고자 연락드렸습니다. 인증 토큰 발행을 검토해 주시겠습니까.' WHERE term_ja = '○○の件につきまして、ご対応をお願いしたく、ご連絡いたしました。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '미팅 일정을 조율하고 싶은데, 아래 일정 중 편하신 날짜와 시간을 알려주시겠습니까. ①2월 15일(월) 10:00~ ②2월 16일(화) 14:00~ ③2월 18일(목) 15:00~' WHERE term_ja = '下記日程でご都合のよい日時をお知らせいただけますでしょうか。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '지난번 보내드린 설계서에 대해 확인하셨는지요. 수정 사항이 있으시면 이번 주 안에 알려 주시면 감사하겠습니다.' WHERE term_ja = '先日お送りした○○について、ご確認いただけましたでしょうか。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '아키텍처 선정에 대해 상담드릴 것이 있습니다. 시간을 내주실 수 있으시겠습니까. 모놀리스와 마이크로서비스 중 어느 쪽으로 진행할지 의견을 구하고 싶습니다.' WHERE term_ja = '○○について相談がございます。お時間をいただけますでしょうか。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '3월 15일에 유급 휴가를 사용하고자 연락드립니다. 당일 대응 사항은 사토 씨에게 인수인계 완료했습니다. 긴급 시에는 휴대폰으로 연락 주십시오.' WHERE term_ja = '○月○日に有給休暇を取得させていただきたく、ご連絡いたします。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '사용자 권한 관리의 사양에 대해 확인하고 싶은 점이 있습니다. 관리자가 멤버의 권한을 변경한 경우, 즉시 반영으로 괜찮겠습니까.' WHERE term_ja = '○○の仕様について確認させていただきたい点がございます。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '인프라 구성에 대해 조금 더 자세히 설명해 주시겠습니까. 특히 오토 스케일링 설정 부분을 듣고 싶습니다.' WHERE term_ja = '○○について、もう少し詳しくご説明いただけますでしょうか。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '다음 회의에서 CI/CD 파이프라인 도입에 대해 논의하고 싶은데, 어떠신가요. 사전에 비교 자료를 준비해 두겠습니다.' WHERE term_ja = '次回の会議で○○について議論したいのですが、いかがでしょうか。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '그러면 마이크로서비스 아키텍처 방침으로 진행한다는 것으로 괜찮으시겠습니까. 이의가 없으시면 다음 주부터 설계에 착수합니다.' WHERE term_ja = 'それでは、○○の方針で進めるということでよろしいでしょうか。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '변경 내용: 사용자 테이블에 이메일 주소 컬럼 추가, 변경 사유: 메일 알림 기능 구현에 필요, 영향 범위: 사용자 등록·프로필 편집 화면, 대응 예정일: 3월 20일' WHERE term_ja = '変更内容: ○○、変更理由: △△、影響範囲: □□、対応予定日: ○月○日' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '3월 18일 14시부터 미팅이 가능하신가요? 차기 릴리스의 스코프에 대해 상의하겠습니다. 30분 정도를 예상하고 있습니다.' WHERE term_ja = '○月○日の○時から打ち合わせは可能でしょうか。△△について相談させてください。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '에러 로그 취급에 대해 질문이 있습니다. 본번 환경에서의 NullPointerException의 경우 어떻게 대응하면 되겠습니까.' WHERE term_ja = '○○について質問がございます。○○の場合、どのように対応すればよろしいでしょうか。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '코드 리뷰 대응을 부탁드리고 싶은데, 3월 15일까지 대응해 주실 수 있으시겠습니까. 풀 리퀘스트 링크를 공유드리겠습니다.' WHERE term_ja = '○○の対応をお願いしたいのですが、○月○日までにご対応いただけますでしょうか。' AND category = 'sentence_pattern';

-- ============================================
-- sentence_patterns — report (15)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '수주 관리 시스템 프로젝트의 진행 상황에 대해 보고드립니다. 현재 설계 페이즈가 완료되어 구현 페이즈에 들어갔습니다. 진척률은 약 60%입니다.' WHERE term_ja = '○○プロジェクトの進捗状況につきまして、ご報告いたします。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '본번 환경의 인증 시스템에서 장애가 발생하여 보고드립니다. 현재 대응 중입니다. 14시경부터 로그인이 안 되는 상태가 계속되고 있으며 원인을 조사하고 있습니다.' WHERE term_ja = '○○システムにて障害が発生しましたので、ご報告いたします。現在対応中です。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '오늘의 진행 상황을 보고드립니다. 사용자 인증 기능의 API 구현 태스크가 완료되었고, 현재 프론트엔드와의 결합 테스트에 착수하고 있습니다. 내일 안에 완료 예정입니다.' WHERE term_ja = '本日の進捗をご報告いたします。○○タスクが完了し、現在△△に着手しております。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '데이터베이스 마이그레이션 대응에 예상 이상의 시간이 소요되고 있어 납기에 영향이 있을 수 있습니다. 레거시 데이터의 변환 처리에서 예상치 못한 문제가 발생하고 있습니다.' WHERE term_ja = '○○の対応に想定以上の時間がかかっており、納期に影響が出る可能性があります。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '보안 패치 적용 대응이 완료되었으므로 연락드립니다. 확인 부탁드립니다. 스테이징 환경에서 동작 확인 완료되었습니다.' WHERE term_ja = '○○の対応が完了いたしましたので、ご連絡いたします。ご確認をお願いいたします。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '프레임워크의 보안 업데이트에 관한 정보를 공유드립니다. 확인 부탁드립니다. 대상 버전과 대응 방법을 첨부 자료에 정리하였습니다.' WHERE term_ja = '○○に関する情報を共有いたします。ご確認のほどよろしくお願いいたします。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '오늘의 결정 사항은 아래와 같습니다. ①인증 방식은 OAuth2.0을 채택 ②DB는 PostgreSQL을 사용. 다음 회의까지 API 설계서 초안을 대응하겠습니다.' WHERE term_ja = '本日の決定事項は以下の通りです。次回までに○○を対応いたします。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '본 시스템은 사내 근태 관리를 목적으로 설계되었으며, 출퇴근 기록·휴가 신청·잔업 관리의 기능을 제공한다.' WHERE term_ja = '本システムは○○を目的として設計されており、△△の機能を提供する。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '테스트 항목 150건 중 145건이 합격, 3건이 불합격, 2건이 미실시가 되었습니다. 불합격 3건에 대해서는 수정 후 재테스트를 예정하고 있습니다.' WHERE term_ja = 'テスト項目○○件中、○○件が合格、△△件が不合格となりました。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '3월 10일 14시 35분, 수주 관리 시스템에서 DB 접속 장애 발생. 원인은 커넥션 풀 고갈이며, 최대 접속 수 상향 및 커넥션 관리 최적화로 대응 완료.' WHERE term_ja = '○月○日○時○分、○○システムにて○○障害が発生。原因は△△であり、□□にて対応完了。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '절차1: AWS 관리 콘솔에 로그인한다. 절차2: EC2 메뉴에서 인스턴스 목록을 선택한다. 절차3: 대상 인스턴스를 선택하고 「재기동」을 클릭한다.' WHERE term_ja = '手順1: ○○にログインする。手順2: △△メニューから□□を選択する。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '일시: 3월 12일 15:00~16:00, 참가자: 다나카·사토·Kim, 안건: API 설계 리뷰, 결정사항: RESTful 설계로 통일, 다음 액션: 사토가 Swagger 정의 작성 (3/15까지)' WHERE term_ja = '日時: ○月○日、参加者: ○○、議題: △△、決定事項: □□、次回アクション: ○○' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '지적 사항: 에러 핸들링 미구현, 지적 사유: API 호출 실패 시 앱이 크래시할 가능성이 있음, 수정안: try-catch 블록으로 예외를 포착하고 사용자에게 에러 메시지를 표시한다' WHERE term_ja = '指摘事項: ○○、指摘理由: △△、修正案: □□' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '결제 모듈 안건을 인계합니다. 현재 상황은 결합 테스트 완료이고, 향후 본번 릴리스와 릴리스 후 모니터링 대응이 필요합니다.' WHERE term_ja = '○○の案件を引き継ぎます。現在の状況は△△で、今後□□の対応が必要です。' AND category = 'sentence_pattern';
UPDATE it_glossary SET example_sentence_ko = '오늘의 작업 내용을 보고드립니다. 로그인 화면의 UI 개수를 완료했고, 비밀번호 재설정 기능은 내일 대응 예정입니다. 특별한 문제 없이 진행되고 있습니다.' WHERE term_ja = '本日の作業内容をご報告いたします。○○を完了し、△△は明日対応予定です。' AND category = 'sentence_pattern';

-- ============================================
-- keigo — rule (20)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '부장님께서 설명하십니다. / 제가 설명드리겠습니다.' WHERE term_ja = 'する → される / いたす' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '이 자료를 봐 주십시오. / 바로 배견하겠습니다.' WHERE term_ja = '見る → ご覧になる / 拝見する' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '부장님께서 말씀하신 대로입니다. / 제가 한 말씀 드리겠습니다.' WHERE term_ja = '言う → おっしゃる / 申す' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '고객님께서 회의실에 계십니다. / 오후에 본사에 가겠습니다.' WHERE term_ja = '行く → いらっしゃる / 参る' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '고객님께서 오셨습니다. / 내일 그쪽으로 가겠습니다.' WHERE term_ja = '来る → いらっしゃる / 参る' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '부디 드십시오. / 감사히 먹겠습니다.' WHERE term_ja = '食べる → 召し上がる / いただく' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '이 건에 대해 알고 계십니까. / 네, 알고 있습니다.' WHERE term_ja = '知る → ご存じ / 存じる' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '부장님에게서 들으셨습니까. / 한 가지 여쭤보고 싶은데요.' WHERE term_ja = '聞く → お聞きになる / 伺う' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '시간 되실 때 읽어 주십시오. / 메일을 배독하였습니다.' WHERE term_ja = '読む → お読みになる / 拝読する' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '확인해 주실 수 있으시겠습니까. / 자료를 받았습니다.' WHERE term_ja = 'もらう → — / いただく' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '선물을 드리겠습니다. / 연락을 드리고 싶은데요.' WHERE term_ja = 'あげる → — / 差し上げる' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '뵙게 되어 영광입니다. / 지난번 뵌 건인데요.' WHERE term_ja = '会う → — / お目にかかる' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '사장님은 지금 안 계십니다. / 저는 도쿄에 있습니다.' WHERE term_ja = 'いる → いらっしゃる / おる' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '어떻게 생각하십니까. / 저도 그렇게 생각합니다.' WHERE term_ja = '思う → お思いになる / 存じる' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '이 자료를 사용해 주십시오. / 확인하셨습니까.' WHERE term_ja = 'お/ご〜になる（尊敬語の一般形）' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '짐을 들어드리겠습니다. / 안내해 드리겠습니다.' WHERE term_ja = 'お/ご〜する（謙譲語の一般形）' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '확인해 주실 수 있으시겠습니까. / 시간을 내주시고 싶은데요.' WHERE term_ja = 'お/ご〜いただく（謙譲語の依頼形）' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '이쪽에 앉아 주십시오. / 자유롭게 사용해 주십시오.' WHERE term_ja = 'お/ご〜ください（尊敬語の依頼形）' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '내일은 회의가 있습니다. / 이것이 보고서입니다.' WHERE term_ja = 'です/ます（丁寧語の基本）' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '화장실은 2층에 있습니다. / 불분명한 점이 있으십니까.' WHERE term_ja = 'ございます（丁寧語の最上級）' AND category = 'keigo';

-- ============================================
-- keigo — mistake (15)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '✕ 자료를 배견시켜 주시겠습니다 → ○ 자료를 배견하겠습니다' WHERE term_ja = 'させていただくの乱用' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 읽으시게 되시다 → ○ 읽으시다 / ✕ 말씀하시게 되시다 → ○ 말씀하시다' WHERE term_ja = '二重敬語' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 이것이 자료가 됩니다 → ○ 이것이 자료입니다' WHERE term_ja = 'バイト敬語' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 볼 수 있나요(축약) → ○ 보실 수 있습니까 / ✕ 먹을 수 있어요(축약) → ○ 드실 수 있습니다' WHERE term_ja = 'ら抜き言葉' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 제가 말씀하신 것은 → ○ 제가 말씀드린 것은' WHERE term_ja = '自分への尊敬語' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ お커피 → ○ 커피 / ✕ お비어 → ○ 비어' WHERE term_ja = 'お/ごの付け間違い' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 고객님께서 참석하겠습니다(겸양) → ○ 고객님께서 오셨습니다(존경)' WHERE term_ja = '謙譲語と尊敬語の混同' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 이쪽으로 괜찮으셨습니까 → ○ 이쪽으로 괜찮으시겠습니까' WHERE term_ja = 'よろしかったでしょうか' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 그렇군요(비격식) → ○ 말씀하신 대로입니다 / ○ 알겠습니다' WHERE term_ja = 'なるほどですね' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 了解했습니다(동등한 관계) → ○ 알겠습니다(격식) / ○ 분부대로 하겠습니다' WHERE term_ja = '了解しました → 承知しました' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 죄송합니다(일상), 지각했습니다 → ○ 대단히 죄송합니다, 지각하였습니다' WHERE term_ja = 'すみません vs 申し訳ございません' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 부장님에게 알려드리겠습니다(시혜) → ○ 부장님에게 전달드리겠습니다' WHERE term_ja = '〜してあげる（目上に使うと失礼）' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 부장님, 수고하셨습니다(ご苦労様) → ○ 부장님, 수고하셨습니다(お疲れ様)' WHERE term_ja = 'ご苦労様です vs お疲れ様です' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 주문은 이상으로 괜찮으셨습니까 → ○ 주문은 이상으로 괜찮으시겠습니까' WHERE term_ja = '〜でよろしかったですか（過去形の誤用）' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 좀 여쭤보고 싶은데요(구어) → ○ 잠시 여쭤보고 싶은 것이 있는데요(격식)' WHERE term_ja = 'ちょっとお聞きしたいんですけど' AND category = 'keigo';

-- ============================================
-- keigo — uchi_soto (15)
-- ============================================
UPDATE it_glossary SET example_sentence_ko = '✕ 다나카 부장님을 소개합니다 → ○ 폐사의 부장 다나카를 소개합니다' WHERE term_ja = '社外への上司紹介：敬称脱着' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '(사외) 저희 부장 다나카가 말씀드렸습니다. / (사내) 다나카 부장님께서 말씀하셨습니다.' WHERE term_ja = '「うちの部長の田中」vs「田中部長」' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '폐사의 서비스에 대해 설명드리겠습니다. 귀사의 요구에 부응할 수 있도록 노력하겠습니다.' WHERE term_ja = '弊社 vs 御社/貴社' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '해당 부서에서 대응하겠습니다. 그쪽 부서와의 연계를 도모하고 싶습니다.' WHERE term_ja = '当部署 vs そちらの部署' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '(사내) 수고하셨습니다. 확인 부탁합니다. / (사외) 항상 신세지고 있습니다. 확인 부탁드립니다.' WHERE term_ja = '社内メール vs 社外メールの文体' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 다나카 부장님은 계십니다 → ○ 다나카는 있습니다 / ○ 다나카는 자리를 비우고 있습니다' WHERE term_ja = '電話で自社の人を「おります」と言う' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '고객님께서 확인해 주셨습니다. 폐사 담당자가 확인하였습니다.' WHERE term_ja = '取引先に尊敬語、自社に謙譲語' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '폐사 담당자가 오후에 가겠습니다. / 귀사의 다나카 님께서 오십니다.' WHERE term_ja = '「参ります」vs「いらっしゃいます」' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '폐사의 다나카가 말씀드렸습니다. / 귀사의 사토 님께서 말씀하셨던 건인데요.' WHERE term_ja = '「申します」vs「おっしゃいます」' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '✕ 다나카 부장에게 확인합니다 → ○ 다나카에게 확인하겠습니다 (사외 대응 시)' WHERE term_ja = '社外向けに上司を呼び捨てにする' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '공교롭게도 사토는 자리를 비우고 있습니다. 돌아오는 대로 다시 전화드릴까요.' WHERE term_ja = '「佐藤は席を外しております」' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '폐사 담당 스즈키가 설명드리겠습니다. 불분명한 점이 있으시면 무엇이든 말씀해 주십시오.' WHERE term_ja = '「弊社の担当の鈴木がご説明いたします」' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '(사내) 부장님께서 말씀하신 대로입니다. / (고객사) 폐사 부장 다나카가 말씀드린 대로 대응하겠습니다.' WHERE term_ja = '社内会議 vs 客先での言葉遣い' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '(타 부서에) 저희 과의 야마다가 대응합니다. / (타사에) 폐사의 야마다가 대응하겠습니다.' WHERE term_ja = 'ウチの範囲の拡大（部署→会社→グループ）' AND category = 'keigo';
UPDATE it_glossary SET example_sentence_ko = '이쪽이 폐사 엔지니어 사토입니다. 본 프로젝트의 기술 부분을 담당하고 있습니다.' WHERE term_ja = 'お客様の前で同僚を紹介する際のルール' AND category = 'keigo';

COMMIT;
