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
    moduleId: 'CSK-OS-01', subject: 'operating-systems', title: 'オペレーティングシステムの実行モデル', description: 'プロセス、スレッド、スケジューリングのような基本実行概念を静的な解説で扱う。', outcomes: list(`
      プロセスとスレッドの違いを説明できる
      文脈切り替えとスケジューリングの必要性を説明できる
      OSの実行モデルを段階的に解釈できる
    `), lessons: [
      {
        id: 'CSK-OS-01-01', titleJa: 'プロセスとスレッドはどう違うのか', titleKo: '프로세스와 스레드는 어떻게 다른가', topic: 'process-vs-thread', minutes: 18, tags: ['operating-systems', 'process', 'thread'], summaryJa: '実行単位としてのプロセスとスレッドを資源共有と隔離の観点で比較する。',
        goalsJa: list(`
          プロセスとスレッドの定義を説明する
          隔離と共有の違いを判断する
          実行単位選択時の考慮点を述べる
        `), whyJa: '実行単位を誤解すると並行性問題と資源共有問題を区別しにくくなる。OSの基本モデル理解は後続学習の土台である。', coreJa: list(`
          プロセスは独立した実行空間を持つ単位である
          スレッドは同じプロセス内で資源を共有しながら実行される流れである
          共有が容易なぶん同期問題も発生しやすい
        `), flowJa: list(`
          まず隔離が重要かを見る
          次にデータ共有が多いかを見る
          最後に生成コストと管理複雑度をあわせて考える
        `), compareJa: list(`
          プロセスは隔離が強く、スレッドは共有が容易である
          スレッドは軽量に見えても同期負荷が付いて回る
        `), misJa: list(`
          スレッドは常にプロセスより優れているという誤解
          同じプロセスのスレッドは完全に独立だという誤解
          プロセス間通信はほとんど不可能だという誤解
        `), questionsJa: list(`
          プロセスとスレッドを分ける核心基準は何か
          共有資源が増えるほどどんな問題が増えるか
          隔離が重要な作業になぜプロセスが向く場合があるか
          並行性バグ説明でスレッドモデルが重要な理由は何か
        `), extractJa: list(`
          プロセスとスレッド差を比較型文項へできる
          共有と隔離のトレードオフを問う判断型文項候補になる
          同期必要性を問うシナリオ型文項へ拡張できる
        `),
        goalsKo: list(`
          프로세스와 스레드의 정의를 설명한다
          격리와 공유의 차이를 판단한다
          실행 단위 선택 시 고려점을 말한다
        `), whyKo: '실행 단위를 잘못 이해하면 동시성 문제와 자원 공유 문제를 구분하기 어렵다. 운영체제의 기본 모델 이해는 이후 학습의 기반이다.', coreKo: list(`
          프로세스는 독립된 실행 공간을 가진 단위다
          스레드는 같은 프로세스 안에서 자원을 공유하며 실행되는 흐름이다
          공유가 쉬운 만큼 동기화 문제도 함께 생긴다
        `), flowKo: list(`
          먼저 격리가 중요한지 본다
          다음으로 데이터 공유가 많은지 본다
          마지막으로 생성 비용과 관리 복잡도를 함께 고려한다
        `), compareKo: list(`
          프로세스는 격리가 강하고 스레드는 공유가 쉽다
          스레드는 가벼워 보여도 동기화 부담이 있다
        `), misKo: list(`
          스레드는 항상 프로세스보다 우월하다는 오해
          같은 프로세스의 스레드는 완전히 독립적이라는 오해
          프로세스 간 통신은 거의 불가능하다는 오해
        `), questionsKo: list(`
          프로세스와 스레드를 구분하는 핵심 기준은 무엇인가
          공유 자원이 많을수록 어떤 문제가 늘어나는가
          격리가 중요한 작업은 왜 프로세스가 적합할 수 있는가
          동시성 버그를 설명할 때 스레드 모델이 왜 중요한가
        `), extractKo: list(`
          프로세스와 스레드 차이를 비교형 문항으로 만들 수 있다
          공유와 격리의 trade-off를 묻는 판단형 문항 후보가 된다
          동기화 필요성을 묻는 시나리오형 문항으로 확장할 수 있다
        `),
      },
      {
        id: 'CSK-OS-01-02', titleJa: 'スケジューリングと文脈切り替えは何をしているのか', titleKo: '스케줄링과 문맥 교환은 무엇을 하는가', topic: 'scheduling-and-context-switch', minutes: 19, tags: ['operating-systems', 'scheduling', 'context-switch'], summaryJa: 'CPU時間を分けるスケジューリングと文脈切り替えの意味を実行流れ中心で説明する。',
        goalsJa: list(`
          スケジューリングの目的を説明する
          文脈切り替えが必要な理由を説明する
          応答性と処理量のバランスを理解する
        `), whyJa: '多数の作業が同時に動くように見えるのはOSがCPU時間を細かく配分するからである。その原理理解が応答性説明に必要である。', coreJa: list(`
          スケジューラは実行可能な作業から次のCPU利用者を選ぶ
          文脈切り替えは現在作業状態を保存し別作業を再開する過程である
          過剰な切り替えはコストになるため無料ではない
        `), flowJa: list(`
          実行待ち作業を集める
          優先度と方針に基づいて次作業を選ぶ
          必要なら状態保存と再開を行う
        `), compareJa: list(`
          スケジューリングは選択規則であり、文脈切り替えは実際の切替動作である
          応答性最適化と処理量最適化は常に同方向ではない
        `), misJa: list(`
          CPUコアが一つでも真の同時実行だという誤解
          文脈切り替えコストは無視できるという誤解
          優先度だけ高めればすべて解決するという誤解
        `), questionsJa: list(`
          スケジューリング方針を一つに固定しにくい理由は何か
          文脈切り替えが増えるとどんなコストが生じるか
          応答性と処理量をなぜ一緒に見るべきか
          単一コアでも複数作業が同時に見えるのはなぜか
        `), extractJa: list(`
          スケジューリングと文脈切り替え差を比較型文項へできる
          応答性と処理量のトレードオフを問う判断型文項候補になる
          切替コストを解釈するシナリオ型文項へ拡張できる
        `),
        goalsKo: list(`
          스케줄링의 목적을 설명한다
          문맥 교환이 필요한 이유를 설명한다
          응답성과 처리량의 균형을 이해한다
        `), whyKo: '여러 작업이 동시에 돌아가는 것처럼 보이는 이유는 운영체제가 CPU 시간을 잘게 나누어 배분하기 때문이다. 이 원리를 이해해야 시스템 응답성을 설명할 수 있다.', coreKo: list(`
          스케줄러는 실행 가능한 작업 중 다음에 CPU를 받을 대상을 고른다
          문맥 교환은 현재 작업 상태를 저장하고 다른 작업을 재개하는 과정이다
          과도한 전환은 비용이 되므로 공짜가 아니다
        `), flowKo: list(`
          실행 대기 작업을 모은다
          우선순위와 정책에 따라 다음 작업을 선택한다
          필요하면 상태 저장과 재개를 수행한다
        `), compareKo: list(`
          스케줄링은 선택 규칙이고 문맥 교환은 실제 전환 동작이다
          응답성 최적화와 처리량 최적화는 항상 같은 방향이 아니다
        `), misKo: list(`
          CPU 코어가 하나여도 진짜 동시 실행이라고 보는 오해
          문맥 교환 비용은 무시해도 된다는 오해
          우선순위만 높이면 모든 문제가 해결된다는 오해
        `), questionsKo: list(`
          스케줄링 정책을 하나로 고정하기 어려운 이유는 무엇인가
          문맥 교환이 많아지면 어떤 비용이 생기는가
          응답성과 처리량을 왜 함께 봐야 하는가
          단일 코어에서도 여러 작업이 동시에 보이는 이유는 무엇인가
        `), extractKo: list(`
          스케줄링과 문맥 교환 차이를 비교형 문항으로 만들 수 있다
          응답성과 처리량 trade-off를 묻는 판단형 문항 후보가 된다
          전환 비용을 해석하는 시나리오형 문항으로 확장할 수 있다
        `),
      },
    ]
  },
  {
    moduleId: 'CSK-DB-01', subject: 'database', title: 'データベース核心概念', description: 'インデックス、トランザクションのような基礎頻出テーマを整理する。', outcomes: list(`
      インデックスの利点とコストを説明できる
      トランザクションの目的とACIDを説明できる
      正規化や結合の役割を区別できる
    `), lessons: [
      {
        id: 'CSK-DB-01-01', titleJa: 'インデックスはなぜ読み取りを助け書き込みを重くするのか', titleKo: '인덱스는 왜 조회를 돕고 쓰기를 무겁게 만드는가', topic: 'index-read-write-tradeoff', minutes: 20, tags: ['database', 'index', 'query'], summaryJa: 'インデックスの利点と維持コストをあわせて見て、読み取りと書き込みのトレードオフを説明する。',
        goalsJa: list(`
          インデックスの役割を説明する
          読み取りと書き込みのトレードオフを理解する
          インデックスを無条件で増やせない理由を説明する
        `), whyJa: 'データベース性能問題でインデックスは最初に言及されやすいが、増やし方を誤ると全体性能を悪化させる。原理とコストを一緒に理解する必要がある。', coreJa: list(`
          インデックスは目的行を探すための補助構造である
          検索条件や並び順によって大きな利点を出せる
          ただし更新時にはインデックス側の変更も必要なので書き込みコストが増える
        `), flowJa: list(`
          よく使う検索条件を把握する
          その条件がインデックスで利益を得られるか検討する
          書き込み頻度と保存コストまで合わせて判断する
        `), compareJa: list(`
          テーブル本体は実データの保存場所で、インデックスは探索補助構造である
          読み取り最適化と書き込み最適化は同じ選択にならないことがある
        `), misJa: list(`
          インデックスは多いほど良いという誤解
          主キーインデックスだけあれば他は不要だという誤解
          小さいテーブルにも常にインデックスが必要だという誤解
        `), questionsJa: list(`
          インデックスが読み取りを速くする原理は何か
          書き込み作業が多い表では設計がどう変わるか
          小規模データで体感差が少ない理由は何か
          検索条件と並び順を一緒に見る理由は何か
        `), extractJa: list(`
          インデックス長短所を比較型文項へできる
          読み取りと書き込みトレードオフを問う判断型文項候補になる
          インデックス乱用事例を解釈するシナリオ型文項へ拡張できる
        `),
        goalsKo: list(`
          인덱스의 역할을 설명한다
          읽기와 쓰기의 트레이드오프를 이해한다
          인덱스를 무조건 늘릴 수 없는 이유를 설명한다
        `), whyKo: '데이터베이스 성능 문제에서 인덱스는 가장 먼저 언급되지만 잘못 추가하면 전체 성능을 악화시킬 수 있다. 원리와 비용을 함께 이해해야 한다.', coreKo: list(`
          인덱스는 원하는 행을 찾기 위한 보조 구조다
          조회 조건과 정렬 조건에 따라 큰 이점을 줄 수 있다
          하지만 갱신 시 인덱스도 함께 변경해야 하므로 쓰기 비용이 늘어난다
        `), flowKo: list(`
          자주 쓰는 조회 조건을 파악한다
          그 조건이 인덱스로 이득을 보는지 검토한다
          쓰기 빈도와 저장 비용까지 함께 판단한다
        `), compareKo: list(`
          테이블 본문은 실제 데이터 저장소이고 인덱스는 탐색 보조 구조다
          읽기 최적화와 쓰기 최적화는 같은 선택이 아닐 수 있다
        `), misKo: list(`
          인덱스는 많을수록 좋다는 오해
          기본 키 인덱스만 있으면 다른 인덱스는 필요 없다는 오해
          작은 테이블에도 항상 인덱스가 필요하다는 오해
        `), questionsKo: list(`
          인덱스가 조회를 빠르게 만드는 원리는 무엇인가
          쓰기 작업이 많은 테이블에서는 설계가 어떻게 달라지는가
          작은 데이터셋에서 체감 이득이 적은 이유는 무엇인가
          조회 조건과 정렬 조건을 함께 봐야 하는 이유는 무엇인가
        `), extractKo: list(`
          인덱스 장단점을 비교형 문항으로 만들 수 있다
          읽기와 쓰기 트레이드오프를 묻는 판단형 문항 후보가 된다
          인덱스 남용 사례를 해석하는 시나리오형 문항으로 확장할 수 있다
        `),
      },
      {
        id: 'CSK-DB-01-02', titleJa: 'トランザクションとACIDは何を守るのか', titleKo: '트랜잭션과 ACID는 무엇을 지키는가', topic: 'transaction-and-acid', minutes: 19, tags: ['database', 'transaction', 'acid'], summaryJa: 'トランザクションの目的とACID性質を一貫したデータ処理の観点で説明する。',
        goalsJa: list(`
          トランザクションの目的を説明する
          ACIDの各要素を区別する
          部分失敗がなぜ危険かを解釈する
        `), whyJa: '現実のデータ変更は複数段階で起こり、中途失敗が残るとデータ矛盾が生まれる。トランザクションはその問題を扱う核心概念である。', coreJa: list(`
          トランザクションは一連の変更を一つの作業単位として扱う考え方である
          Atomicity、Consistency、Isolation、Durabilityは異なる危険を扱う
          同時実行があるほど隔離と一貫性の理解が重要になる
        `), flowJa: list(`
          関連する変更を一単位へまとめる
          失敗時に戻す境界を明確にする
          同時実行時の衝突可能性も考える
        `), compareJa: list(`
          Atomicityは全部成功か全部失敗かに近く、Durabilityは完了後の保持に近い
          Consistencyは規則維持の観点で、Isolationは同時実行干渉制御の観点である
        `), misJa: list(`
          ACIDがあれば性能や拡張性は考えなくてよいという誤解
          トランザクションはINSERTを束ねるときだけ使うという誤解
          隔離レベル差は実務では体感できないという誤解
        `), questionsJa: list(`
          部分失敗が残るとどんな問題が起きるか
          AtomicityとConsistencyはどう違うか
          同時実行環境でIsolationが必要な理由は何か
          Durabilityはどんな事態を防ぐ性質か
        `), extractJa: list(`
          ACID要素区分を比較型文項へできる
          部分失敗シナリオを解釈する判断型文項候補になる
          トランザクション目的を問う概念型文項に展開できる
        `),
        goalsKo: list(`
          트랜잭션의 목적을 설명한다
          ACID의 각 요소를 구분한다
          부분 실패가 왜 위험한지 해석한다
        `), whyKo: '현실의 데이터 변경은 여러 단계로 이루어지고 중간 실패가 생기면 데이터 모순이 생길 수 있다. 트랜잭션은 그 문제를 다루는 핵심 개념이다.', coreKo: list(`
          트랜잭션은 일련의 변경을 하나의 작업 단위로 다루는 생각이다
          Atomicity, Consistency, Isolation, Durability는 서로 다른 위험을 다룬다
          동시 실행이 있을수록 격리와 일관성 이해가 중요해진다
        `), flowKo: list(`
          관련된 변경을 하나의 단위로 묶는다
          실패 시 되돌릴 경계를 명확히 한다
          동시 실행 시 충돌 가능성도 고려한다
        `), compareKo: list(`
          Atomicity는 전부 성공 또는 전부 실패에 가깝고 Durability는 완료 후 유지에 가깝다
          Consistency는 규칙 유지 관점이고 Isolation은 동시 실행 간 간섭 제어 관점이다
        `), misKo: list(`
          ACID만 있으면 성능이나 확장성은 생각하지 않아도 된다는 오해
          트랜잭션은 INSERT를 묶을 때만 쓰는 개념이라는 오해
          격리 수준 차이는 실무에서 체감되지 않는다는 오해
        `), questionsKo: list(`
          부분 실패가 남으면 어떤 문제가 생기는가
          Atomicity와 Consistency는 어떻게 다른가
          동시성 환경에서 Isolation이 필요한 이유는 무엇인가
          Durability는 어떤 상황을 막기 위한 성질인가
        `), extractKo: list(`
          ACID 요소 구분 문제를 비교형 문항으로 만들 수 있다
          부분 실패 시나리오를 해석하는 판단형 문항 후보가 된다
          트랜잭션 목적을 묻는 개념형 문제로 전개할 수 있다
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
