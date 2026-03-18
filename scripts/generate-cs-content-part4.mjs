import fs from 'node:fs/promises'
import path from 'node:path'

const root = path.join(process.cwd(), 'data', 'training-content-factory', 'content', 'cs-knowledge')
const list = (text) => text.trim().split('\n').map((line) => line.trim()).filter(Boolean)
const sections = [
  ['学習目標', '학습 목표'],
  ['なぜ重要か', '왜 중요한가'],
  ['中核説明', '핵심 설명'],
  ['仕組みまたは判断の流れ', '작동 방식 또는 판단 흐름'],
  ['似ている概念との比較', '비슷한 개념과의 비교'],
  ['よくある誤解', '자주 하는 오해'],
  ['確認質問', '확인 질문'],
  ['問題抽出メモ', '문항 추출 메모'],
]

const subjects = [
  {
    moduleId: 'CSK-NW-01', subject: 'networking', title: 'ネットワーク階層と通信理解', description: 'HTTP、TCP、DNSのような基礎概念を階層観点で整理する。', outcomes: list(`
      HTTPとTCPの役割を区別できる
      名前解決と経路決定の違いを説明できる
      ステートレス性とセッション管理の関係を理解できる
    `), lessons: [
      {
        id: 'CSK-NW-01-01', titleJa: 'HTTPはTCPの上で何をしているのか', titleKo: 'HTTP는 TCP 위에서 무엇을 하는가', topic: 'http-over-tcp', minutes: 18, tags: ['networking', 'http', 'tcp'], summaryJa: 'HTTPとTCPの役割差を階層観点で説明し、混同しやすい点を整理する。',
        goalsJa: list(`
          HTTPとTCPの役割を区別する
          アプリケーション層と転送層の違いを説明する
          要求と応答の流れを階層的に見る
        `), whyJa: 'Web開発ではHTTP用語とTCP用語が混ざりやすい。階層を分けて理解してこそ障害原因と性能問題を整理できる。', coreJa: list(`
          HTTPは要求と応答の意味や形式を定めるアプリケーション層の規約である
          TCPはデータ転送の順序性と信頼性を扱う転送層の規約である
          一つのWeb要求も複数層の協力で成立している
        `), flowJa: list(`
          クライアントがHTTP要求メッセージを作る
          そのメッセージがTCPで順序を保ちながら運ばれる
          サーバがHTTP応答として結果を返す
        `), compareJa: list(`
          HTTPは何を頼みどう表現するかを扱う
          TCPはデータがどう順序と信頼性を保って移動するかを扱う
        `), misJa: list(`
          HTTPがそのままTCPだという誤解
          ポート番号だけ分かれば階層区分は不要だという誤解
          HTTP性能問題は必ずアプリコードの問題だという誤解
        `), questionsJa: list(`
          HTTPとTCPを分けて理解する理由は何か
          要求メッセージ形式と転送信頼性はそれぞれどの層の関心か
          同じHTTP要求でも体感差が出る理由は何か
          HTTPSが加わると階層説明はどう広がるか
        `), extractJa: list(`
          HTTPとTCP役割区分問題を比較型文項へできる
          層別責任を問う概念型文項に展開できる
          性能問題を層別に分解するシナリオ型文項候補になる
        `),
        goalsKo: list(`
          HTTP와 TCP의 역할을 구분한다
          애플리케이션 계층과 전송 계층의 차이를 설명한다
          요청과 응답 흐름을 계층적으로 본다
        `), whyKo: '웹 개발에서는 HTTP 용어와 TCP 용어가 자주 섞여 쓰인다. 계층을 분리해 이해해야 장애 원인과 성능 문제를 정리할 수 있다.', coreKo: list(`
          HTTP는 요청과 응답의 의미와 형식을 정하는 애플리케이션 계층 규약이다
          TCP는 데이터 전송의 순서성과 신뢰성을 다루는 전송 계층 규약이다
          하나의 웹 요청도 여러 계층의 협력으로 성립한다
        `), flowKo: list(`
          클라이언트가 HTTP 요청 메시지를 만든다
          그 메시지가 TCP로 순서를 지키며 전달된다
          서버가 HTTP 응답으로 결과를 돌려준다
        `), compareKo: list(`
          HTTP는 무엇을 요청하고 어떻게 표현할지를 다룬다
          TCP는 데이터가 어떤 순서와 신뢰성으로 이동할지를 다룬다
        `), misKo: list(`
          HTTP가 곧 TCP라는 오해
          포트 번호만 알면 계층 구분은 불필요하다는 오해
          HTTP 성능 문제는 항상 애플리케이션 코드 문제라는 오해
        `), questionsKo: list(`
          HTTP와 TCP를 분리해 이해해야 하는 이유는 무엇인가
          요청 형식과 전송 신뢰성은 각각 어느 계층의 관심사인가
          같은 HTTP 요청이라도 체감 차이가 생기는 이유는 무엇인가
          HTTPS가 추가되면 계층 설명은 어떻게 확장되는가
        `), extractKo: list(`
          HTTP와 TCP 역할 구분 문제를 비교형 문항으로 만들 수 있다
          계층별 책임을 묻는 개념형 문제로 전개할 수 있다
          성능 문제를 계층별로 분해하는 시나리오형 문항 후보가 된다
        `),
      },
      {
        id: 'CSK-NW-01-02', titleJa: 'DNSとルーティングは何が違うのか', titleKo: 'DNS와 라우팅은 무엇이 다른가', topic: 'dns-and-routing', minutes: 18, tags: ['networking', 'dns', 'routing'], summaryJa: '名前解決とパケット経路決定を区別し、DNSとルーティングの違いを説明する。',
        goalsJa: list(`
          DNSの役割を説明する
          ルーティングの役割を説明する
          名前解決と経路決定の違いを区別する
        `), whyJa: '接続失敗を語るときにDNS問題と経路問題を混ぜると原因分析が曖昧になる。両者は関係するが役割は違う。', coreJa: list(`
          DNSはドメイン名をIPアドレスへ対応づけて解決する仕組みである
          ルーティングは宛先までパケットをどの経路で送るか決める過程である
          名前解決が成功しても配送成功が保証されるわけではない
        `), flowJa: list(`
          利用者はドメイン名で接続を試みる
          DNSが対応するIPアドレスを見つける
          その後ネットワーク機器が経路に沿ってパケットを運ぶ
        `), compareJa: list(`
          DNSは行き先住所を調べる段階に近い
          ルーティングは調べた住所へ実際に運ぶ段階に近い
        `), misJa: list(`
          DNSさえ動けば通信は自動的に成功するという誤解
          ルーティングは通信事業者だけの内部概念だという誤解
          IPアドレスを知っていればDNSは完全に不要という誤解
        `), questionsJa: list(`
          ドメイン名をIPへ変える役割は何か
          名前解決成功後にも通信失敗が起こる理由は何か
          DNS問題とルーティング問題はどう見分けるか
          IPを直接指定してもすべての問題が消えない理由は何か
        `), extractJa: list(`
          DNSとルーティングの役割比較問題を作れる
          通信失敗原因を段階的に解釈するシナリオ型文項候補になる
          名前解決と経路決定を分ける概念型文項へ展開できる
        `),
        goalsKo: list(`
          DNS의 역할을 설명한다
          라우팅의 역할을 설명한다
          이름 해석과 경로 결정의 차이를 구분한다
        `), whyKo: '연결 실패를 말할 때 DNS 문제와 경로 문제를 섞으면 원인 분석이 흐려진다. 둘은 관련되지만 역할은 다르다.', coreKo: list(`
          DNS는 도메인 이름을 IP 주소로 대응시켜 해석하는 구조다
          라우팅은 목적지까지 패킷을 어떤 경로로 보낼지 결정하는 과정이다
          이름 해석이 성공해도 전달 성공이 보장되는 것은 아니다
        `), flowKo: list(`
          사용자는 도메인 이름으로 접속을 시도한다
          DNS가 대응하는 IP 주소를 찾는다
          이후 네트워크 장비가 경로를 따라 패킷을 전달한다
        `), compareKo: list(`
          DNS는 목적지 주소를 찾는 단계에 가깝다
          라우팅은 찾은 주소로 실제 이동시키는 단계에 가깝다
        `), misKo: list(`
          DNS만 되면 통신은 자동으로 성공한다는 오해
          라우팅은 통신사만 아는 내부 개념이라는 오해
          IP 주소를 알면 DNS는 완전히 불필요하다는 오해
        `), questionsKo: list(`
          도메인 이름을 IP로 바꾸는 역할은 무엇인가
          이름 해석 성공 후에도 통신 실패가 생기는 이유는 무엇인가
          DNS 문제와 라우팅 문제를 어떻게 구분할 수 있는가
          IP를 직접 입력해도 모든 문제가 사라지지 않는 이유는 무엇인가
        `), extractKo: list(`
          DNS와 라우팅의 역할 비교 문항을 만들 수 있다
          통신 실패 원인을 단계별로 해석하는 시나리오형 문항 후보가 된다
          이름 해석과 경로 결정을 분리하는 개념형 문항으로 전개할 수 있다
        `),
      },
    ]
  },
  {
    moduleId: 'CSK-SC-01', subject: 'security', title: 'セキュリティ核心概念の境界', description: '認証と認可、パスワード保存、暗号化基礎のような混同しやすい概念を区別する。', outcomes: list(`
      認証と認可の違いを説明できる
      パスワード保存原則を理解できる
      対称鍵と公開鍵暗号の役割を区別できる
    `), lessons: [
      {
        id: 'CSK-SC-01-01', titleJa: '認証と認可はなぜ混同してはいけないのか', titleKo: '인증과 인가는 왜 혼동하면 안 되는가', topic: 'authentication-vs-authorization', minutes: 18, tags: ['security', 'authentication', 'authorization'], summaryJa: '認証と認可を区別し、保安設計でそれぞれが担う責任を説明する。',
        goalsJa: list(`
          認証と認可の違いを説明する
          利用者確認と権限判断を区別する
          保安設計で混同すると危険な理由を理解する
        `), whyJa: 'ログイン機能があるだけで権限検査が終わるわけではない。認証と認可を混ぜると権限漏れや過剰許可が起きる。', coreJa: list(`
          認証は利用者が誰かを確認する過程である
          認可はその利用者が何をしてよいか判断する過程である
          両者は連続して現れても責任は分けて考える必要がある
        `), flowJa: list(`
          まず本人確認を行う
          次にその主体の権限情報を参照する
          最後に要求操作が許可範囲内か判定する
        `), compareJa: list(`
          認証はidentity中心であり、認可はpermission中心である
          ログイン成功は認証結果であって資源アクセス許可を意味しない
        `), misJa: list(`
          ログインできればすべて許可されうるという誤解
          画面ボタンを隠せば認可が十分だという誤解
          管理者かどうかだけ見れば権限設計が終わるという誤解
        `), questionsJa: list(`
          認証と認可を入れ替えて説明すると何が危険か
          ログイン済み利用者でも拒否される理由は何か
          ボタン非表示だけではなぜ認可にならないか
          API水準の権限検査が必要な理由は何か
        `), extractJa: list(`
          認証と認可差を比較型文項へできる
          権限漏れ事例を解釈するシナリオ型文項候補になる
          ログインと許可判定を分ける概念型文項へ展開できる
        `),
        goalsKo: list(`
          인증과 인가의 차이를 설명한다
          사용자 확인과 권한 판단을 구분한다
          보안 설계에서 혼동이 왜 위험한지 이해한다
        `), whyKo: '로그인 기능이 있다고 해서 권한 검사가 끝나는 것은 아니다. 인증과 인가를 섞으면 권한 누락과 과도한 허용이 생긴다.', coreKo: list(`
          인증은 사용자가 누구인지 확인하는 과정이다
          인가는 그 사용자가 무엇을 할 수 있는지 판단하는 과정이다
          둘은 이어질 수 있지만 책임은 분리해 생각해야 한다
        `), flowKo: list(`
          먼저 본인 확인을 한다
          다음으로 그 주체의 권한 정보를 조회한다
          마지막으로 요청 작업이 허용 범위인지 판단한다
        `), compareKo: list(`
          인증은 identity 중심이고 인가는 permission 중심이다
          로그인 성공은 인증 결과일 뿐 자원 접근 허용을 의미하지 않는다
        `), misKo: list(`
          로그인만 되면 모든 요청이 허용될 수 있다는 오해
          화면 버튼을 숨기면 인가가 충분하다는 오해
          관리자 여부만 보면 권한 설계가 끝난다는 오해
        `), questionsKo: list(`
          인증과 인가를 바꿔 설명하면 왜 위험한가
          로그인한 사용자도 거부될 수 있는 이유는 무엇인가
          버튼 숨김만으로는 왜 인가가 되지 않는가
          API 수준 권한 검사가 필요한 이유는 무엇인가
        `), extractKo: list(`
          인증과 인가 차이를 비교형 문항으로 만들 수 있다
          권한 누락 사례를 해석하는 시나리오형 문항 후보가 된다
          로그인과 접근 허용을 분리하는 개념형 문항으로 전개할 수 있다
        `),
      },
      {
        id: 'CSK-SC-01-02', titleJa: 'ハッシュ化と暗号化は何が違うのか', titleKo: '해시화와 암호화는 무엇이 다른가', topic: 'hashing-vs-encryption', minutes: 19, tags: ['security', 'hash', 'encryption', 'password'], summaryJa: 'ハッシュ化と暗号化を目的と復元可能性の観点で区別し、パスワード保存原則を説明する。',
        goalsJa: list(`
          ハッシュ化と暗号化の違いを説明する
          パスワード保存原則を説明する
          復元可能性の意味を区別する
        `), whyJa: '保安基礎で最もよく起こる混同の一つがハッシュと暗号化を同じだと考えることだ。目的が違うため適用位置も変わる。', coreJa: list(`
          ハッシュ化は原文から固定長値を作り通常は復元を前提にしない
          暗号化は適切な鍵があれば元文へ戻せる変換である
          パスワード保存では原文復元が不要なのでハッシュ系手法が向く
        `), flowJa: list(`
          保護対象を再び読める必要があるか判断する
          復元が必要なら暗号化の適用を検討する
          検証だけ必要ならハッシュとsaltを考える
        `), compareJa: list(`
          ハッシュ化は検証中心であり、暗号化は機密性と復元可能性中心である
          パスワード保存と通信中保護は同じ問題として扱ってはいけない
        `), misJa: list(`
          パスワードを暗号化して保存すれば十分だという誤解
          ハッシュは必ず安全で追加設計は不要だという誤解
          復号できなければ攻撃も不可能だという誤解
        `), questionsJa: list(`
          ハッシュと暗号化を分ける核心基準は何か
          パスワード保存で復元が不要な理由は何か
          saltを追加で考える理由は何か
          通信中保護と保存時保護はどう違って考えるべきか
        `), extractJa: list(`
          ハッシュ化と暗号化差を比較型文項へできる
          パスワード保存原則を問う概念型文項に展開できる
          目的別保護手段選択を求める判断型文項候補になる
        `),
        goalsKo: list(`
          해시화와 암호화의 차이를 설명한다
          비밀번호 저장 원칙을 설명한다
          복원 가능성의 의미를 구분한다
        `), whyKo: '보안 기초에서 자주 생기는 혼동 중 하나가 해시와 암호화를 같은 것으로 보는 것이다. 목적이 다르기 때문에 적용 위치도 달라진다.', coreKo: list(`
          해시화는 원문에서 고정 길이 값을 만들며 보통 복원을 전제로 하지 않는다
          암호화는 적절한 키가 있으면 원문으로 되돌릴 수 있는 변환이다
          비밀번호 저장에는 원문 복원이 필요 없으므로 해시 기반 접근이 적합하다
        `), flowKo: list(`
          보호 대상이 다시 읽혀야 하는지 판단한다
          복원이 필요하면 암호화 적용을 검토한다
          검증만 필요하면 해시와 솔트를 고려한다
        `), compareKo: list(`
          해시화는 검증 중심이고 암호화는 기밀성과 복원 가능성 중심이다
          비밀번호 저장과 전송 중 보호는 같은 문제로 보면 안 된다
        `), misKo: list(`
          비밀번호를 암호화해 저장하면 충분하다는 오해
          해시는 반드시 안전하며 추가 설계는 필요 없다는 오해
          복호화가 안 되면 공격도 불가능하다는 오해
        `), questionsKo: list(`
          해시와 암호화를 구분하는 핵심 기준은 무엇인가
          비밀번호 저장에서 복원이 필요 없는 이유는 무엇인가
          솔트를 추가로 고려하는 이유는 무엇인가
          전송 중 보호와 저장 시 보호는 어떻게 다르게 봐야 하는가
        `), extractKo: list(`
          해시화와 암호화 차이를 비교형 문항으로 만들 수 있다
          비밀번호 저장 원칙을 묻는 개념형 문제로 전개할 수 있다
          목적별 보안 수단 선택을 요구하는 판단형 문항 후보가 된다
        `),
      },
    ]
  },
]

function frontmatter({ id, title, moduleId, subject, minutes, tags, language }) { return ['---', `lesson_id: ${id}`, `title: "${title}"`, `module: ${moduleId}`, 'level: foundation', `subject: ${subject}`, `language: ${language}`, `est_minutes: ${minutes}`, `tags: [${tags.map((tag) => `"${tag}"`).join(', ')}]`, '---', ''].join('\n') }
function renderLesson(language, subject, lesson) { const isJa = language === 'ja'; const [h1,h2,h3,h4,h5,h6,h7,h8] = isJa ? sections.map((pair) => pair[0]) : sections.map((pair) => pair[1]); const goals = isJa ? lesson.goalsJa : lesson.goalsKo; const why = isJa ? lesson.whyJa : lesson.whyKo; const core = isJa ? lesson.coreJa : lesson.coreKo; const flow = isJa ? lesson.flowJa : lesson.flowKo; const compare = isJa ? lesson.compareJa : lesson.compareKo; const mis = isJa ? lesson.misJa : lesson.misKo; const questions = isJa ? lesson.questionsJa : lesson.questionsKo; const extract = isJa ? lesson.extractJa : lesson.extractKo; const title = isJa ? lesson.titleJa : lesson.titleKo; return [frontmatter({ id: lesson.id, title, moduleId: subject.moduleId, subject: subject.subject, minutes: lesson.minutes, tags: lesson.tags, language }), `## 1) ${h1}\n\n${goals.map((item) => `- ${item}`).join('\n')}\n`, `## 2) ${h2}\n\n${why}\n`, `## 3) ${h3}\n\n${core.map((item) => `- ${item}`).join('\n')}\n`, `## 4) ${h4}\n\n${flow.map((item, index) => `${index + 1}. ${item}`).join('\n')}\n`, `## 5) ${h5}\n\n${compare.map((item) => `- ${item}`).join('\n')}\n`, `## 6) ${h6}\n\n${mis.map((item) => `- ${item}`).join('\n')}\n`, `## 7) ${h7}\n\n${questions.map((item, index) => `${index + 1}. ${item}`).join('\n')}\n`, `## 8) ${h8}\n\n${extract.map((item) => `- ${item}`).join('\n')}\n`].join('\n') }

for (const subject of subjects) {
  const moduleDir = path.join(root, 'modules', subject.moduleId)
  const lessonsDir = path.join(moduleDir, 'lessons')
  await fs.mkdir(lessonsDir, { recursive: true })
  const moduleLines = ['module:', `  id: ${subject.moduleId}`, `  title: "${subject.title}"`, '  default_language: ja', '  level: foundation', `  description: "${subject.description}"`, `  subject: ${subject.subject}`, '  content_mode: static-interpretive', '  outcomes:', ...subject.outcomes.map((item) => `    - "${item}"`), '  lessons:']
  subject.lessons.forEach((lesson) => { moduleLines.push(`    - id: ${lesson.id}`); moduleLines.push(`      title: "${lesson.titleJa}"`); moduleLines.push(`      est_minutes: ${lesson.minutes}`); moduleLines.push(`      tags: [${lesson.tags.map((tag) => `"${tag}"`).join(', ')}]`) })
  await fs.writeFile(path.join(moduleDir, 'module.yaml'), `${moduleLines.join('\n')}\n`, 'utf8')
  for (const lesson of subject.lessons) {
    const meta = { lesson_id: lesson.id, category: 'cs-knowledge', subject: subject.subject, topic: lesson.topic, default_language: 'ja', available_languages: ['ja', 'ko'], summary: lesson.summaryJa, key_points: [lesson.coreJa[0], lesson.coreJa[1], lesson.compareJa[0]], misconceptions: lesson.misJa, check_questions: lesson.questionsJa, exam_extractables: { fact_candidates: [lesson.coreJa[0], lesson.coreJa[1]], concept_contrast_candidates: [lesson.compareJa[0], lesson.compareJa[1]], scenario_candidates: [lesson.extractJa[1], lesson.extractJa[2]], common_wrong_answer_patterns: [lesson.misJa[0], lesson.misJa[1]] } }
    await fs.writeFile(path.join(lessonsDir, `${lesson.id}.mdx`), renderLesson('ja', subject, lesson), 'utf8')
    await fs.writeFile(path.join(lessonsDir, `${lesson.id}.ko.mdx`), renderLesson('ko', subject, lesson), 'utf8')
    await fs.writeFile(path.join(lessonsDir, `${lesson.id}.meta.json`), `${JSON.stringify(meta, null, 2)}\n`, 'utf8')
  }
}
console.log(`Generated ${subjects.length} modules.`)
