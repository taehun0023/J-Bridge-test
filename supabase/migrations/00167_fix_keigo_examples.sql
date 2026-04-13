-- ============================================
-- Fix keigo example_sentence: rewrite all 50 items
-- as complete, natural IT business sentences
-- + add Korean translations (example_sentence_ko)
-- ============================================

BEGIN;

-- ============================================
-- rule (20 items)
-- ============================================

UPDATE it_glossary SET
  example_sentence = '本日のAPI仕様変更について、私からご説明いたします。ご不明な点がございましたらお申し付けください。',
  example_sentence_ko = '오늘 API 사양 변경에 대해 제가 설명드리겠습니다. 불분명한 점이 있으시면 말씀해 주십시오.'
WHERE term_ja = 'する → される / いたす' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'お送りいただいた設計書を拝見いたしました。修正が必要な箇所について共有させていただきます。',
  example_sentence_ko = '보내주신 설계서를 확인하였습니다. 수정이 필요한 부분에 대해 공유드리겠습니다.'
WHERE term_ja = '見る → ご覧になる / 拝見する' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '先ほどのミーティングでリードエンジニアがおっしゃった通り、テスト環境のデプロイを優先いたします。',
  example_sentence_ko = '방금 미팅에서 리드 엔지니어가 말씀하신 대로, 테스트 환경 배포를 우선 진행하겠습니다.'
WHERE term_ja = '言う → おっしゃる / 申す' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '午後からお客様先のデータセンターに参りまして、サーバー移行作業の立ち会いをしてまいります。',
  example_sentence_ko = '오후에 고객사 데이터센터에 가서 서버 이전 작업 입회를 하고 오겠습니다.'
WHERE term_ja = '行く → いらっしゃる / 参る' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'お客様がオフィスにいらっしゃいましたので、会議室へご案内いたしました。',
  example_sentence_ko = '고객님께서 사무실에 오셨기에 회의실로 안내해 드렸습니다.'
WHERE term_ja = '来る → いらっしゃる / 参る' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'プロジェクト打ち上げのお食事会では、ぜひお好きなものを召し上がってください。',
  example_sentence_ko = '프로젝트 완료 기념 식사 자리에서는 편하게 드시고 싶은 것을 드십시오.'
WHERE term_ja = '食べる → 召し上がる / いただく' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'こちらのマイクロサービス構成について、すでにご存じかと思いますが、改めて概要を共有いたします。',
  example_sentence_ko = '이 마이크로서비스 구성에 대해 이미 알고 계시리라 생각하지만, 다시 한번 개요를 공유드리겠습니다.'
WHERE term_ja = '知る → ご存じ / 存じる' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'デプロイ手順について一点伺いたいのですが、ステージング環境でのテストは完了しておりますでしょうか。',
  example_sentence_ko = '배포 절차에 대해 한 가지 여쭤보고 싶은데요, 스테이징 환경에서의 테스트는 완료되었는지요.'
WHERE term_ja = '聞く → お聞きになる / 伺う' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'お送りいただいたコードレビューのコメントを拝読いたしました。ご指摘の箇所を修正してプッシュいたします。',
  example_sentence_ko = '보내주신 코드 리뷰 코멘트를 확인하였습니다. 지적해 주신 부분을 수정하여 푸시하겠습니다.'
WHERE term_ja = '読む → お読みになる / 拝読する' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'テスト結果のレポートをいただきましたので、不具合の優先度を整理してご報告いたします。',
  example_sentence_ko = '테스트 결과 리포트를 받았으므로, 버그 우선순위를 정리하여 보고드리겠습니다.'
WHERE term_ja = 'もらう → — / いただく' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '完成した技術仕様書のドラフトを差し上げますので、お手すきの際にご確認いただけますでしょうか。',
  example_sentence_ko = '완성된 기술 사양서 초안을 드리겠사오니, 시간이 되실 때 확인해 주시면 감사하겠습니다.'
WHERE term_ja = 'あげる → — / 差し上げる' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '先日のカンファレンスでお目にかかった際にお話しした件について、進捗をご報告いたします。',
  example_sentence_ko = '지난 컨퍼런스에서 뵈었을 때 말씀드렸던 건에 대해 진행 상황을 보고드립니다.'
WHERE term_ja = '会う → — / お目にかかる' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '申し訳ございませんが、担当の鈴木はただいまリモートワーク中でオフィスにはおりません。',
  example_sentence_ko = '죄송합니다만, 담당 스즈키는 현재 재택근무 중으로 사무실에 없습니다.'
WHERE term_ja = 'いる → いらっしゃる / おる' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'アーキテクチャの見直しが必要かと存じますが、まずは現行システムの負荷テスト結果を確認したく存じます。',
  example_sentence_ko = '아키텍처 재검토가 필요하다고 생각합니다만, 우선 현행 시스템의 부하 테스트 결과를 확인하고 싶습니다.'
WHERE term_ja = '思う → お思いになる / 存じる' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '開発環境のセットアップが完了しましたので、こちらのドキュメントをお使いになって初期設定を進めてください。',
  example_sentence_ko = '개발 환경 설정이 완료되었으니, 이 문서를 사용하셔서 초기 설정을 진행해 주십시오.'
WHERE term_ja = 'お/ご〜になる（尊敬語の一般形）' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'スプリントレビューの日程について、改めてご連絡いたします。ご都合の良い日時をお知らせください。',
  example_sentence_ko = '스프린트 리뷰 일정에 대해 다시 연락드리겠습니다. 편하신 날짜와 시간을 알려주십시오.'
WHERE term_ja = 'お/ご〜する（謙譲語の一般形）' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'プルリクエストのレビューをご確認いただけますでしょうか。本日中にマージできると大変助かります。',
  example_sentence_ko = '풀 리퀘스트 리뷰를 확인해 주실 수 있으시겠습니까? 오늘 중으로 머지할 수 있으면 대단히 감사하겠습니다.'
WHERE term_ja = 'お/ご〜いただく（謙譲語の依頼形）' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'テスト用のAPIキーをこちらに記載しておりますので、ご自由にお使いください。',
  example_sentence_ko = '테스트용 API 키를 여기에 기재해 두었으니, 자유롭게 사용해 주십시오.'
WHERE term_ja = 'お/ご〜ください（尊敬語の依頼形）' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '本日のスタンドアップミーティングでは、各チームのスプリント進捗を共有いたします。',
  example_sentence_ko = '오늘 스탠드업 미팅에서는 각 팀의 스프린트 진행 상황을 공유하겠습니다.'
WHERE term_ja = 'です/ます（丁寧語の基本）' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'ご質問がございましたら、Slackのサポートチャンネルまでお気軽にお問い合わせくださいませ。',
  example_sentence_ko = '질문이 있으시면 Slack 지원 채널로 편하게 문의해 주십시오.'
WHERE term_ja = 'ございます（丁寧語の最上級）' AND category = 'keigo';

-- ============================================
-- mistake (15 items)
-- ============================================

UPDATE it_glossary SET
  example_sentence = 'お送りいただいた要件定義書を拝見いたしました。いくつか確認したい点がございますので、お時間をいただけますでしょうか。',
  example_sentence_ko = '보내주신 요건 정의서를 확인하였습니다. 몇 가지 확인하고 싶은 점이 있으니, 시간을 내주실 수 있으시겠습니까.'
WHERE term_ja = 'させていただくの乱用' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'お手すきの際にこちらのプルリクエストをお読みになっていただけますでしょうか。レビューコメントをお待ちしております。',
  example_sentence_ko = '시간이 되실 때 이 풀 리퀘스트를 읽어봐 주시겠습니까. 리뷰 코멘트를 기다리고 있겠습니다.'
WHERE term_ja = '二重敬語' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'こちらがサーバー障害に関する調査報告書でございます。原因と対策について詳しく記載しております。',
  example_sentence_ko = '이쪽이 서버 장애에 관한 조사 보고서입니다. 원인과 대책에 대해 자세히 기재하였습니다.'
WHERE term_ja = 'バイト敬語' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'デモ画面は現在こちらのURLから見られますので、動作確認をお願いいたします。',
  example_sentence_ko = '데모 화면은 현재 이 URL에서 보실 수 있으니, 동작 확인을 부탁드립니다.'
WHERE term_ja = 'ら抜き言葉' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '先ほどのミーティングで私が申し上げたのは、リリース日を一週間延期するという提案でございます。',
  example_sentence_ko = '아까 미팅에서 제가 말씀드린 것은 릴리스 날짜를 일주일 연기하자는 제안입니다.'
WHERE term_ja = '自分への尊敬語' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'デプロイ完了後のステータスについてご確認いただけますでしょうか。モニタリングダッシュボードのURLをお送りいたします。',
  example_sentence_ko = '배포 완료 후 상태에 대해 확인해 주시겠습니까. 모니터링 대시보드 URL을 보내드리겠습니다.'
WHERE term_ja = 'お/ごの付け間違い' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'お客様がデータセンターにいらっしゃいましたので、サーバールームへご案内いたしました。',
  example_sentence_ko = '고객님께서 데이터센터에 오셨기에 서버실로 안내해 드렸습니다.'
WHERE term_ja = '謙譲語と尊敬語の混同' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'こちらのブランチをベースにマージしてよろしいでしょうか。コンフリクトがないか再度確認いたします。',
  example_sentence_ko = '이 브랜치를 기반으로 머지해도 괜찮으시겠습니까. 충돌이 없는지 다시 확인하겠습니다.'
WHERE term_ja = 'よろしかったでしょうか' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'おっしゃる通りです。マイクロサービスへの分割を先に進めるのが効率的かと存じます。',
  example_sentence_ko = '말씀하신 대로입니다. 마이크로서비스로의 분리를 먼저 진행하는 것이 효율적이라고 생각합니다.'
WHERE term_ja = 'なるほどですね' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'デプロイのスケジュール変更について承知いたしました。開発チームにも共有いたします。',
  example_sentence_ko = '배포 일정 변경에 대해 알겠습니다. 개발팀에도 공유하겠습니다.'
WHERE term_ja = '了解しました → 承知しました' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '本番環境のデータベース障害が発生しており、申し訳ございません。現在復旧作業を進めております。',
  example_sentence_ko = '운영 환경 데이터베이스 장애가 발생하여 대단히 죄송합니다. 현재 복구 작업을 진행하고 있습니다.'
WHERE term_ja = 'すみません vs 申し訳ございません' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'テスト結果について、部長にお伝えいたします。不具合の修正状況も併せてご報告いたします。',
  example_sentence_ko = '테스트 결과에 대해 부장님께 전달드리겠습니다. 버그 수정 상황도 함께 보고드리겠습니다.'
WHERE term_ja = '〜してあげる（目上に使うと失礼）' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '部長、お疲れ様です。先ほどのコードレビューのフィードバックを反映いたしましたので、再確認をお願いいたします。',
  example_sentence_ko = '부장님, 수고하십니다. 방금 코드 리뷰 피드백을 반영하였으니, 재확인을 부탁드립니다.'
WHERE term_ja = 'ご苦労様です vs お疲れ様です' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'インフラ構成はこちらの案でよろしいですか。問題がなければ、本日中にCI/CDパイプラインの設定を開始いたします。',
  example_sentence_ko = '인프라 구성은 이 안으로 괜찮으시겠습니까? 문제가 없으면 오늘 중으로 CI/CD 파이프라인 설정을 시작하겠습니다.'
WHERE term_ja = '〜でよろしかったですか（過去形の誤用）' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '少々お伺いしたいのですが、今回のリリースではAPIのバージョニングをどのように管理される予定でしょうか。',
  example_sentence_ko = '한 가지 여쭤보고 싶은데요, 이번 릴리스에서는 API 버저닝을 어떻게 관리하실 예정이신지요.'
WHERE term_ja = 'ちょっとお聞きしたいんですけど' AND category = 'keigo';

-- ============================================
-- uchi_soto (15 items)
-- ============================================

UPDATE it_glossary SET
  example_sentence = '弊社の開発部長の田中をご紹介いたします。本プロジェクトのアーキテクチャ設計を統括しております。',
  example_sentence_ko = '저희 회사 개발부장 다나카를 소개드리겠습니다. 본 프로젝트의 아키텍처 설계를 총괄하고 있습니다.'
WHERE term_ja = '社外への上司紹介：敬称脱着' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '弊社の部長の田中が、来週中にお見積りをお送りすると申しておりました。今しばらくお待ちいただけますでしょうか。',
  example_sentence_ko = '저희 부장 다나카가 다음 주 중으로 견적서를 보내드리겠다고 전해 달라 하였습니다. 조금만 기다려 주시겠습니까.'
WHERE term_ja = '「うちの部長の田中」vs「田中部長」' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '弊社のクラウドインフラサービスについてご説明いたします。御社のご要望に合わせたプランをご提案させていただきます。',
  example_sentence_ko = '저희 회사의 클라우드 인프라 서비스에 대해 설명드리겠습니다. 귀사의 요구 사항에 맞춘 플랜을 제안드리겠습니다.'
WHERE term_ja = '弊社 vs 御社/貴社' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '当部署のバックエンドチームで対応いたします。御部署のフロントエンドチームとの連携についても調整させていただきます。',
  example_sentence_ko = '저희 부서의 백엔드 팀에서 대응하겠습니다. 귀 부서의 프론트엔드 팀과의 연계에 대해서도 조율하겠습니다.'
WHERE term_ja = '当部署 vs そちらの部署' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'いつもお世話になっております。先日ご相談いただいたAPIの認証方式について、技術検証が完了いたしましたのでご報告いたします。',
  example_sentence_ko = '항상 신세 지고 있습니다. 지난번 상담해 주신 API 인증 방식에 대해 기술 검증이 완료되었기에 보고드립니다.'
WHERE term_ja = '社内メール vs 社外メールの文体' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'あいにく田中はただいまオンラインミーティング中でございます。終わり次第、折り返しお電話するよう申し伝えます。',
  example_sentence_ko = '공교롭게도 다나카는 현재 온라인 미팅 중입니다. 끝나는 대로 다시 전화드리도록 전달하겠습니다.'
WHERE term_ja = '電話で自社の人を「おります」と言う' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'お客様にはリリースノートをご確認いただきました。弊社の品質管理チームが最終テストを実施いたしました。',
  example_sentence_ko = '고객님께서는 릴리스 노트를 확인해 주셨습니다. 저희 품질관리 팀이 최종 테스트를 실시하였습니다.'
WHERE term_ja = '取引先に尊敬語、自社に謙譲語' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '弊社のインフラ担当が明日の午前中に御社のオフィスに参ります。サーバー設置場所の確認をさせていただきたく存じます。',
  example_sentence_ko = '저희 인프라 담당이 내일 오전 중에 귀사 사무실에 방문하겠습니다. 서버 설치 장소를 확인하고 싶습니다.'
WHERE term_ja = '「参ります」vs「いらっしゃいます」' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '弊社の田中がセキュリティパッチの適用について申しておりました。御社の佐藤様がおっしゃっていたスケジュールに合わせて対応いたします。',
  example_sentence_ko = '저희 다나카가 보안 패치 적용에 대해 말씀드렸었습니다. 귀사 사토 님께서 말씀하신 일정에 맞춰 대응하겠습니다.'
WHERE term_ja = '「申します」vs「おっしゃいます」' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '御社との定例ミーティングの件ですが、田中に確認いたしまして、来週月曜日で調整させていただきます。',
  example_sentence_ko = '귀사와의 정기 미팅 건인데요, 다나카에게 확인하여 다음 주 월요일로 조율하겠습니다.'
WHERE term_ja = '社外向けに上司を呼び捨てにする' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'あいにく佐藤は席を外しております。デプロイ作業の確認に出ておりますので、戻り次第折り返しお電話いたしましょうか。',
  example_sentence_ko = '공교롭게도 사토는 자리를 비우고 있습니다. 배포 작업 확인 중이오니, 돌아오는 대로 다시 전화드릴까요.'
WHERE term_ja = '「佐藤は席を外しております」' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '弊社の担当の鈴木がシステム構成についてご説明いたします。ご不明な点がございましたら何なりとお申し付けください。',
  example_sentence_ko = '저희 담당 스즈키가 시스템 구성에 대해 설명드리겠습니다. 불분명한 점이 있으시면 무엇이든 말씀해 주십시오.'
WHERE term_ja = '「弊社の担当の鈴木がご説明いたします」' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'お客様への提案資料ですが、弊社の部長の田中が申しました通り、クラウド移行プランを中心に対応いたします。',
  example_sentence_ko = '고객에게 드릴 제안 자료인데요, 저희 부장 다나카가 말씀드린 대로 클라우드 이전 플랜을 중심으로 대응하겠습니다.'
WHERE term_ja = '社内会議 vs 客先での言葉遣い' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = '他社のエンジニア様とお話しする際は、弊社の山田が技術サポートを担当いたしますと申し上げてください。',
  example_sentence_ko = '타사 엔지니어분과 이야기하실 때는, 저희 야마다가 기술 지원을 담당한다고 말씀해 주십시오.'
WHERE term_ja = 'ウチの範囲の拡大（部署→会社→グループ）' AND category = 'keigo';

UPDATE it_glossary SET
  example_sentence = 'こちらが弊社のシニアエンジニアの佐藤でございます。本プロジェクトのバックエンド開発を担当しております。',
  example_sentence_ko = '이쪽은 저희 시니어 엔지니어 사토입니다. 본 프로젝트의 백엔드 개발을 담당하고 있습니다.'
WHERE term_ja = 'お客様の前で同僚を紹介する際のルール' AND category = 'keigo';

COMMIT;
