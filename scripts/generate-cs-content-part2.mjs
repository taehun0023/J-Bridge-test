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
    moduleId: 'CSK-AL-01',
    subject: 'algorithms',
    title: 'アルゴリズム判断の基本',
    description: '探索、整列、再帰のような頻出テーマを前提条件と選択基準中心で説明する。',
    outcomes: list(`
      探索と整列の前提条件を説明できる
      計算量だけでなく入力特性もあわせて判断できる
      再帰的思考と反復的思考を比較できる
    `),
    lessons: [
      {
        id: 'CSK-AL-01-01', titleJa: '線形探索と二分探索はどの条件で使い分けるのか', titleKo: '선형 탐색과 이분 탐색은 어떤 조건에서 구분해 쓰는가', topic: 'linear-vs-binary-search', minutes: 18, tags: ['algorithms', 'search', 'binary-search'], summaryJa: '探索の前提条件に注目し、線形探索と二分探索の使い分けを整理する。',
        goalsJa: list(`
          線形探索と二分探索の手順を説明する
          二分探索に整列が必要な理由を説明する
          入力規模と準備コストを一緒に判断する
        `),
        whyJa: '探索アルゴリズムは単純な速度比較よりも前提条件を先に見る習慣が重要である。前提を無視すると速い手法でも使えない。',
        coreJa: list(`
          線形探索は先頭から順に確認するため事前条件がほとんどない
          二分探索は整列済みデータに対して範囲を半分ずつ狭める
          整列コストまで含めると常に二分探索が有利とは限らない
        `),
        flowJa: list(`
          データが整列済みかどうかを確認する
          一度だけ探すのか、繰り返し探すのかを確認する
          準備コストと探索回数を合わせて判断する
        `),
        compareJa: list(`
          線形探索は単純で適用範囲が広い
          二分探索は速いが整列という前提を必要とする
        `),
        misJa: list(`
          二分探索は常に優れているという誤解
          整列さえされていれば実装の細部は重要でないという誤解
          入力規模が小さくても計算量差が絶対的だという誤解
        `),
        questionsJa: list(`
          未整列データで二分探索をそのまま使うと何が問題か
          一度だけ探す状況では整列コストをどう見るべきか
          繰り返し探索が増えると判断はどう変わるか
          線形探索がより実用的な場面はどんなときか
        `),
        extractJa: list(`
          探索の前提条件を問う判断型文項を作れる
          整列コスト込みで考える解釈型文項候補になる
          線形探索と二分探索の誤答パターンを比較できる
        `),
        goalsKo: list(`
          선형 탐색과 이분 탐색의 절차를 설명한다
          이분 탐색에 정렬이 필요한 이유를 설명한다
          입력 규모와 준비 비용을 함께 판단한다
        `),
        whyKo: '탐색 알고리즘은 단순한 속도 비교보다 전제 조건을 먼저 보는 습관이 중요하다. 전제를 무시하면 빨라 보이는 알고리즘도 사용할 수 없다.',
        coreKo: list(`
          선형 탐색은 앞에서부터 순서대로 확인하므로 사전 조건이 거의 없다
          이분 탐색은 정렬된 데이터에서 범위를 절반씩 줄여 간다
          정렬 비용까지 포함하면 언제나 이분 탐색이 유리한 것은 아니다
        `),
        flowKo: list(`
          데이터가 정렬되어 있는지 확인한다
          한 번만 찾는지 반복해서 찾는지 본다
          준비 비용과 탐색 횟수를 함께 계산한다
        `),
        compareKo: list(`
          선형 탐색은 단순하고 적용 범위가 넓다
          이분 탐색은 빠르지만 정렬이라는 전제가 필요하다
        `),
        misKo: list(`
          이분 탐색이 항상 더 좋다는 오해
          정렬만 되어 있으면 구현 세부는 중요하지 않다는 오해
          입력 크기가 작아도 복잡도 차이가 절대적이라는 오해
        `),
        questionsKo: list(`
          정렬되지 않은 데이터에 이분 탐색을 그대로 쓰면 왜 문제가 되는가
          한 번만 탐색하는 상황에서 정렬 비용은 어떻게 봐야 하는가
          반복 탐색이 많아지면 판단은 어떻게 달라지는가
          선형 탐색이 더 실용적인 상황은 언제인가
        `),
        extractKo: list(`
          탐색 전제 조건을 묻는 판단형 문항을 만들 수 있다
          정렬 비용 포함 여부를 따지는 해석형 문항 후보가 된다
          선형 탐색과 이분 탐색의 오답 포인트를 비교할 수 있다
        `),
      },
      {
        id: 'CSK-AL-01-02', titleJa: 'ソートでは何を基準に手法を選ぶのか', titleKo: '정렬에서는 무엇을 기준으로 방법을 선택하는가', topic: 'sorting-selection', minutes: 19, tags: ['algorithms', 'sorting', 'complexity'], summaryJa: '整列アルゴリズムを計算量、安定性、入力特性の観点で比較する。',
        goalsJa: list(`
          代表的な整列判断基準を説明する
          安定ソートの意味を理解する
          入力特性に応じて優先基準を調整する
        `),
        whyJa: '整列はO(n log n)を暗記する問題ではなく、データ規模、部分整列の有無、安定性要求を合わせて見る代表的なテーマである。',
        coreJa: list(`
          整列手法は平均性能、最悪性能、メモリ使用量が異なる
          安定ソートは同じキーの相対順序を保つ
          入力がほぼ整列済みなら一部手法が有利になる
        `),
        flowJa: list(`
          要件に安定性が必要か確認する
          追加メモリ利用が許容されるか確認する
          入力規模と分布を考えて候補を絞る
        `),
        compareJa: list(`
          マージソートは安定性と一貫性が長所だが追加メモリを使う
          クイックソートは平均的に速いがピボット次第で偏りが出る
        `),
        misJa: list(`
          計算量表だけ見れば選択が終わるという誤解
          安定性は画面表示でしか重要でないという誤解
          入力特性は実性能へほとんど影響しないという誤解
        `),
        questionsJa: list(`
          安定ソートが必要な事例はどんなものか
          ほぼ整列済み入力では何を追加で見るべきか
          平均性能と最悪性能を一緒に見る理由は何か
          追加メモリ制約があると判断はどう変わるか
        `),
        extractJa: list(`
          整列選択基準を比較型文項にできる
          安定性概念を問う概念型文項へ展開できる
          入力特性から適切な整列戦略を選ばせる問題を作れる
        `),
        goalsKo: list(`
          대표적인 정렬 판단 기준을 설명한다
          안정 정렬의 의미를 이해한다
          입력 특성에 따라 우선 기준을 조정한다
        `),
        whyKo: '정렬은 O(n log n)을 외우는 문제가 아니라 데이터 규모, 부분 정렬 여부, 안정성 요구를 함께 봐야 하는 대표 주제다.',
        coreKo: list(`
          정렬 방법은 평균 성능, 최악 성능, 메모리 사용량이 다르다
          안정 정렬은 같은 키의 상대 순서를 보존한다
          입력이 거의 정렬된 경우 일부 알고리즘이 유리할 수 있다
        `),
        flowKo: list(`
          요구사항에 안정성이 필요한지 확인한다
          추가 메모리 사용 허용 여부를 확인한다
          입력 규모와 분포를 고려해 후보를 좁힌다
        `),
        compareKo: list(`
          병합 정렬은 안정성과 일관성이 장점이지만 추가 메모리를 쓴다
          퀵 정렬은 평균적으로 빠르지만 피벗 선택에 따라 편차가 생긴다
        `),
        misKo: list(`
          시간 복잡도 표만 보면 선택이 끝난다는 오해
          안정성은 화면 표시에서만 중요하다는 오해
          입력 특성은 실제 성능에 거의 영향이 없다는 오해
        `),
        questionsKo: list(`
          안정 정렬이 필요한 사례는 어떤 것인가
          거의 정렬된 입력에서는 무엇을 추가로 봐야 하는가
          평균 성능과 최악 성능을 함께 봐야 하는 이유는 무엇인가
          추가 메모리 제약이 있으면 판단이 어떻게 달라지는가
        `),
        extractKo: list(`
          정렬 선택 기준을 비교형 문항으로 만들 수 있다
          안정성 개념을 묻는 개념형 문제로 전개할 수 있다
          입력 특성을 주고 적절한 정렬 전략을 고르게 할 수 있다
        `),
      },
    ],
  },
  {
    moduleId: 'CSK-CA-01',
    subject: 'computer-architecture',
    title: 'コンピュータ構造の動作理解',
    description: 'CPU、メモリ、キャッシュのような基礎構造を静的な解説で整理する。',
    outcomes: list(`
      CPU、メモリ、ストレージの役割を区別できる
      キャッシュが必要な理由を説明できる
      命令実行の流れを段階的に解釈できる
    `),
    lessons: [
      {
        id: 'CSK-CA-01-01', titleJa: 'CPU・メモリ・ストレージの役割はどう違うのか', titleKo: 'CPU, 메모리, 저장장치의 역할은 어떻게 다른가', topic: 'cpu-memory-storage', minutes: 18, tags: ['computer-architecture', 'cpu', 'memory', 'storage'], summaryJa: 'CPU、主記憶、ストレージの役割差とデータ流れを整理する。',
        goalsJa: list(`
          主要構成要素の役割を説明する
          速度と容量のトレードオフを理解する
          処理の流れを段階的に説明する
        `),
        whyJa: 'コンピュータ構造を知らないと性能問題をすべてコードのせいにしやすい。各装置の役割を分けて考える必要がある。',
        coreJa: list(`
          CPUは命令を解釈して実行する中心である
          メモリは現在使うデータを高速に置く作業空間である
          ストレージは大容量だが相対的に遅い保管領域である
        `),
        flowJa: list(`
          プログラムとデータがストレージから読み込まれる
          実行に必要な部分がメモリへ配置される
          CPUがメモリから必要な値を取り出して計算する
        `),
        compareJa: list(`
          メモリは電源断で内容が失われうるがストレージは長期保存に向く
          CPUは計算主体であり、メモリは計算対象が滞在する場所である
        `),
        misJa: list(`
          CPUが速ければすべてのボトルネックが解決するという誤解
          メモリとストレージは容量だけ違う同じ場所だという誤解
          プログラム実行時には常に全体が一度にメモリへ乗るという誤解
        `),
        questionsJa: list(`
          CPUとメモリの役割を入れ替えて説明すると何が問題か
          ストレージよりメモリが速い理由をどう直感的に説明できるか
          実行中データはなぜストレージではなくメモリにある必要があるか
          容量と速度の折衷はどのような形で現れるか
        `),
        extractJa: list(`
          構成要素の役割区分を定義型文項にできる
          データ流れ順序を並べる手順型文項候補になる
          ボトルネック解釈シナリオ型文項へ拡張できる
        `),
        goalsKo: list(`
          주요 구성 요소의 역할을 설명한다
          속도와 용량의 트레이드오프를 이해한다
          처리 흐름을 단계적으로 설명한다
        `),
        whyKo: '컴퓨터 구조를 모르면 성능 문제를 전부 코드 탓으로 돌리기 쉽다. 각 장치의 역할을 분리해 봐야 한다.',
        coreKo: list(`
          CPU는 명령을 해석하고 실행하는 중심이다
          메모리는 현재 쓰는 데이터를 빠르게 두는 작업 공간이다
          저장장치는 대용량이지만 상대적으로 느린 보관 영역이다
        `),
        flowKo: list(`
          프로그램과 데이터가 저장장치에서 읽힌다
          실행에 필요한 부분이 메모리에 배치된다
          CPU가 메모리에서 필요한 값을 꺼내 계산한다
        `),
        compareKo: list(`
          메모리는 전원이 꺼지면 내용이 사라질 수 있지만 저장장치는 장기 보관에 적합하다
          CPU는 계산 주체이고 메모리는 계산 대상이 머무는 장소다
        `),
        misKo: list(`
          CPU가 빠르면 모든 병목이 해결된다는 오해
          메모리와 저장장치는 용량만 다른 같은 장소라는 오해
          프로그램 실행 시 전체가 한 번에 메모리에 올라간다는 오해
        `),
        questionsKo: list(`
          CPU와 메모리의 역할을 바꿔 설명하면 왜 문제가 되는가
          저장장치보다 메모리가 빠른 이유를 어떻게 직관적으로 설명할 수 있는가
          실행 중 데이터가 왜 저장장치가 아니라 메모리에 있어야 하는가
          용량과 속도의 절충은 어떤 형태로 나타나는가
        `),
        extractKo: list(`
          구성 요소 역할 구분 문제를 정의형 문항으로 만들 수 있다
          데이터 흐름 순서를 맞추는 절차형 문항 후보가 된다
          병목 해석 시나리오형 문제로 확장할 수 있다
        `),
      },
      {
        id: 'CSK-CA-01-02', titleJa: 'キャッシュと局所性はなぜ性能に効くのか', titleKo: '캐시와 지역성은 왜 성능에 영향을 주는가', topic: 'cache-and-locality', minutes: 19, tags: ['computer-architecture', 'cache', 'locality', 'performance'], summaryJa: 'キャッシュメモリと時間的・空間的局所性を中心に性能差の背景を説明する。',
        goalsJa: list(`
          キャッシュの役割を説明する
          局所性の概念を区別する
          アクセスパターンが性能に与える影響を解釈する
        `),
        whyJa: '同じ演算量でもメモリアクセスのパターン次第で性能差は大きくなる。キャッシュと局所性はその差を説明する道具である。',
        coreJa: list(`
          キャッシュはよく使うデータをCPUに近い場所へ置いて待ち時間を減らす
          時間的局所性は最近使ったデータをまた使う可能性である
          空間的局所性は近くにあるデータを続けて使う可能性である
        `),
        flowJa: list(`
          頻繁に触るデータが何かを見る
          アクセスが繰り返しか連続かを確認する
          キャッシュヒットを高める構造かどうかを考える
        `),
        compareJa: list(`
          時間的局所性は再利用間隔の短さと関係する
          空間的局所性は隣接データアクセスと関係する
        `),
        misJa: list(`
          キャッシュは小さいメモリなので概念的に重視しなくてよいという誤解
          演算速度だけ速ければメモリアクセスは重要でないという誤解
          配列走査とランダムアクセス差は基礎学習では無意味という誤解
        `),
        questionsJa: list(`
          時間的局所性と空間的局所性はどう違うか
          連続走査がランダムアクセスより有利な理由は何か
          キャッシュヒット率が上がると体感性能はなぜ変わるか
          同じO(n)でも実行時間が違う事例をどう説明できるか
        `),
        extractJa: list(`
          キャッシュの役割を問う概念型文項へできる
          局所性の二種類を比較する文項候補になる
          アクセスパターン事例から性能差を解釈させられる
        `),
        goalsKo: list(`
          캐시의 역할을 설명한다
          지역성 개념을 구분한다
          접근 패턴이 성능에 주는 영향을 해석한다
        `),
        whyKo: '같은 연산량처럼 보여도 메모리 접근 패턴에 따라 성능 차이가 크게 난다. 캐시와 지역성은 그 차이를 설명하는 핵심 도구다.',
        coreKo: list(`
          캐시는 자주 쓰는 데이터를 CPU 가까이에 두어 대기 시간을 줄인다
          시간적 지역성은 최근 사용한 데이터를 다시 사용할 가능성이다
          공간적 지역성은 가까이 있는 데이터를 이어서 사용할 가능성이다
        `),
        flowKo: list(`
          자주 접근하는 데이터가 무엇인지 본다
          접근이 반복되는지 연속적인지 확인한다
          캐시 적중이 높아질 구조인지 해석한다
        `),
        compareKo: list(`
          시간적 지역성은 재사용 간격의 짧음과 관련이 있다
          공간적 지역성은 인접 데이터 접근과 관련이 있다
        `),
        misKo: list(`
          캐시는 작은 메모리일 뿐이라 개념적으로 볼 필요 없다는 오해
          연산 속도만 빠르면 메모리 접근 패턴은 중요하지 않다는 오해
          배열 순회와 무작위 접근 차이는 기초 학습에서 무의미하다는 오해
        `),
        questionsKo: list(`
          시간적 지역성과 공간적 지역성은 어떻게 다른가
          연속 순회가 무작위 접근보다 유리한 이유는 무엇인가
          캐시 적중률이 높아지면 체감 성능은 왜 달라지는가
          같은 O(n)이어도 실행 시간이 다른 사례를 어떻게 설명할 수 있는가
        `),
        extractKo: list(`
          캐시의 역할을 묻는 개념형 문항으로 만들 수 있다
          지역성 두 종류를 비교하는 문항 후보가 된다
          접근 패턴 사례를 주고 성능 차이를 해석하게 할 수 있다
        `),
      },
    ],
  },
]

function frontmatter({ id, title, moduleId, subject, minutes, tags, language }) {
  return ['---', `lesson_id: ${id}`, `title: "${title}"`, `module: ${moduleId}`, 'level: foundation', `subject: ${subject}`, `language: ${language}`, `est_minutes: ${minutes}`, `tags: [${tags.map((tag) => `"${tag}"`).join(', ')}]`, '---', ''].join('\n')
}

function renderLesson(language, subject, lesson) {
  const isJa = language === 'ja'
  const [h1, h2, h3, h4, h5, h6, h7, h8] = isJa ? sections.map((pair) => pair[0]) : sections.map((pair) => pair[1])
  const goals = isJa ? lesson.goalsJa : lesson.goalsKo
  const why = isJa ? lesson.whyJa : lesson.whyKo
  const core = isJa ? lesson.coreJa : lesson.coreKo
  const flow = isJa ? lesson.flowJa : lesson.flowKo
  const compare = isJa ? lesson.compareJa : lesson.compareKo
  const mis = isJa ? lesson.misJa : lesson.misKo
  const questions = isJa ? lesson.questionsJa : lesson.questionsKo
  const extract = isJa ? lesson.extractJa : lesson.extractKo
  const title = isJa ? lesson.titleJa : lesson.titleKo
  return [frontmatter({ id: lesson.id, title, moduleId: subject.moduleId, subject: subject.subject, minutes: lesson.minutes, tags: lesson.tags, language }), `## 1) ${h1}\n\n${goals.map((item) => `- ${item}`).join('\n')}\n`, `## 2) ${h2}\n\n${why}\n`, `## 3) ${h3}\n\n${core.map((item) => `- ${item}`).join('\n')}\n`, `## 4) ${h4}\n\n${flow.map((item, index) => `${index + 1}. ${item}`).join('\n')}\n`, `## 5) ${h5}\n\n${compare.map((item) => `- ${item}`).join('\n')}\n`, `## 6) ${h6}\n\n${mis.map((item) => `- ${item}`).join('\n')}\n`, `## 7) ${h7}\n\n${questions.map((item, index) => `${index + 1}. ${item}`).join('\n')}\n`, `## 8) ${h8}\n\n${extract.map((item) => `- ${item}`).join('\n')}\n`].join('\n')
}

for (const subject of subjects) {
  const moduleDir = path.join(root, 'modules', subject.moduleId)
  const lessonsDir = path.join(moduleDir, 'lessons')
  await fs.mkdir(lessonsDir, { recursive: true })
  const moduleLines = ['module:', `  id: ${subject.moduleId}`, `  title: "${subject.title}"`, '  default_language: ja', '  level: foundation', `  description: "${subject.description}"`, `  subject: ${subject.subject}`, '  content_mode: static-interpretive', '  outcomes:', ...subject.outcomes.map((item) => `    - "${item}"`), '  lessons:']
  subject.lessons.forEach((lesson) => {
    moduleLines.push(`    - id: ${lesson.id}`)
    moduleLines.push(`      title: "${lesson.titleJa}"`)
    moduleLines.push(`      est_minutes: ${lesson.minutes}`)
    moduleLines.push(`      tags: [${lesson.tags.map((tag) => `"${tag}"`).join(', ')}]`)
  })
  await fs.writeFile(path.join(moduleDir, 'module.yaml'), `${moduleLines.join('\n')}\n`, 'utf8')
  for (const lesson of subject.lessons) {
    const meta = { lesson_id: lesson.id, category: 'cs-knowledge', subject: subject.subject, topic: lesson.topic, default_language: 'ja', available_languages: ['ja', 'ko'], summary: lesson.summaryJa, key_points: [lesson.coreJa[0], lesson.coreJa[1], lesson.compareJa[0]], misconceptions: lesson.misJa, check_questions: lesson.questionsJa, exam_extractables: { fact_candidates: [lesson.coreJa[0], lesson.coreJa[1]], concept_contrast_candidates: [lesson.compareJa[0], lesson.compareJa[1]], scenario_candidates: [lesson.extractJa[1], lesson.extractJa[2]], common_wrong_answer_patterns: [lesson.misJa[0], lesson.misJa[1]] } }
    await fs.writeFile(path.join(lessonsDir, `${lesson.id}.mdx`), renderLesson('ja', subject, lesson), 'utf8')
    await fs.writeFile(path.join(lessonsDir, `${lesson.id}.ko.mdx`), renderLesson('ko', subject, lesson), 'utf8')
    await fs.writeFile(path.join(lessonsDir, `${lesson.id}.meta.json`), `${JSON.stringify(meta, null, 2)}\n`, 'utf8')
  }
}
console.log(`Generated ${subjects.length} modules.`)
