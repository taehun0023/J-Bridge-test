import fs from 'node:fs/promises'
import path from 'node:path'

const root = path.join(
  process.cwd(),
  'data',
  'training-content-factory',
  'content',
  'cs-knowledge'
)

const list = (text) =>
  text
    .trim()
    .split('\n')
    .map((line) => line.trim())
    .filter(Boolean)

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
    moduleId: 'CSK-BT-01',
    subject: 'basic-theory',
    title: '情報表現と数値の基礎',
    description: 'ビット、バイト、文字コード、数値表現のような基礎概念を静的な解説で理解する。',
    outcomes: list(`
      ビット、バイト、文字コードの役割を説明できる
      2進数と10進数の対応を読み取れる
      数値表現で生じる誤差や制約を判断できる
    `),
    lessons: [
      {
        id: 'CSK-BT-01-01',
        titleJa: '2進数とビットは何を表しているのか',
        titleKo: '2진수와 비트는 무엇을 나타내는가',
        topic: 'binary-and-bit',
        minutes: 18,
        tags: ['basic-theory', 'binary', 'bit', 'byte'],
        summaryJa: '2進数、ビット、バイトの関係を理解し、情報が最小単位からどのように表現されるかを整理する。',
        goalsJa: list(`
          2進数の桁が0と1で構成される理由を説明する
          ビットとバイトの違いを区別する
          10進数を簡単な2進数へ読み替える
        `),
        whyJa: 'コンピュータが最終的に扱う信号はオンとオフの状態に近い。したがって、2進数は暗記対象ではなく、情報表現の土台として理解する必要がある。',
        coreJa: list(`
          1ビットは0または1の二つの状態を持つ最小単位である
          8ビットを1バイトとして扱うのは実務上の標準的なまとまりである
          桁が左へ移るごとに値は2倍になる
        `),
        flowJa: list(`
          対象の10進数を2で割り続け、余りを逆順に読む
          必要なビット数を確認して表現可能な範囲を見積もる
          保存単位としてバイト数へ換算して容量感覚を持つ
        `),
        compareJa: list(`
          ビットは状態の最小単位で、バイトは保存や転送でよく使うまとまりである
          2進数は表現方法であり、10進数は人間が日常的に使う表記体系である
        `),
        misJa: list(`
          2進数は数学の特殊分野であり実装では重要でないという誤解
          1バイトは常に1文字と等しいという誤解
          桁数が少ないほど必ず効率が良いという誤解
        `),
        questionsJa: list(`
          5を2進数で書くとどうなるか
          1バイトで表せる状態の総数はいくつか
          同じ値でも10進数と2進数で見え方が変わる理由は何か
          容量を考えるときビットよりバイトを使うことが多い理由は何か
        `),
        extractJa: list(`
          ビットとバイトの定義差を事実型文項として抽出できる
          10進数を2進数へ変換する短い手順問題を作れる
          表現可能な状態数を問う計算型文項候補になる
        `),
        goalsKo: list(`
          2진수 자리가 왜 0과 1로 구성되는지 설명한다
          비트와 바이트의 차이를 구분한다
          10진수를 간단한 2진수로 읽어 바꾼다
        `),
        whyKo: '컴퓨터가 최종적으로 다루는 신호는 켜짐과 꺼짐에 가까운 상태다. 따라서 2진수는 암기 대상이 아니라 정보 표현의 기반으로 이해해야 한다.',
        coreKo: list(`
          1비트는 0 또는 1의 두 상태를 가지는 최소 단위다
          8비트를 1바이트로 다루는 것은 실무에서 널리 쓰는 표준 묶음이다
          자리가 왼쪽으로 한 칸 이동할 때마다 값은 2배가 된다
        `),
        flowKo: list(`
          대상 10진수를 2로 계속 나누고 나머지를 역순으로 읽는다
          필요한 비트 수를 확인해 표현 가능한 범위를 가늠한다
          저장 단위로는 바이트 수로 바꿔 용량 감각을 잡는다
        `),
        compareKo: list(`
          비트는 상태의 최소 단위이고 바이트는 저장과 전송에서 자주 쓰는 묶음이다
          2진수는 표현 방법이고 10진수는 사람이 일상적으로 쓰는 표기 체계다
        `),
        misKo: list(`
          2진수는 수학의 특수 분야라 구현에서는 중요하지 않다는 오해
          1바이트는 항상 1문자와 같다는 오해
          자리 수가 적을수록 무조건 효율적이라는 오해
        `),
        questionsKo: list(`
          5를 2진수로 쓰면 어떻게 되는가
          1바이트로 표현할 수 있는 상태의 총수는 얼마인가
          같은 값이어도 10진수와 2진수에서 보이는 모습이 다른 이유는 무엇인가
          용량을 생각할 때 비트보다 바이트를 더 자주 쓰는 이유는 무엇인가
        `),
        extractKo: list(`
          비트와 바이트의 정의 차이를 사실형 문항으로 뽑을 수 있다
          10진수를 2진수로 바꾸는 짧은 절차 문제를 만들 수 있다
          표현 가능한 상태 수를 묻는 계산형 문항 후보가 된다
        `),
      },
      {
        id: 'CSK-BT-01-02',
        titleJa: '文字コードと数値表現で何が起きるのか',
        titleKo: '문자 코드와 수치 표현에서는 무엇이 일어나는가',
        topic: 'character-encoding-and-numeric-representation',
        minutes: 20,
        tags: ['basic-theory', 'encoding', 'unicode', 'number'],
        summaryJa: '文字コードと整数・浮動小数点表現を通じて、同じデータでも解釈によって意味が変わることを理解する。',
        goalsJa: list(`
          文字コードが文字を数値に対応づける仕組みを説明する
          整数表現と浮動小数点表現の違いを区別する
          表現方式の違いで生じる誤差可能性を説明する
        `),
        whyJa: '同じビット列でも、文字として読むのか数値として読むのかで意味が変わる。実務ではこの違いを理解していないと文字化けや計算誤差を正しく解釈できない。',
        coreJa: list(`
          文字コードは文字と番号の対応表であり、Unicodeはその代表的な体系である
          整数は離散的な値を比較的そのまま保持しやすい
          浮動小数点は広い範囲の実数近似を扱えるが丸め誤差が起こりうる
        `),
        flowJa: list(`
          まずデータが文字なのか数値なのかを確認する
          次にどの文字コードまたは数値表現を使っているかを特定する
          最後に解釈の違いが表示や計算結果にどう影響するかを検討する
        `),
        compareJa: list(`
          ASCIIは範囲が狭いが単純で、Unicodeは多言語を扱いやすい
          整数は厳密さを重視しやすく、浮動小数点は範囲と近似を重視する
        `),
        misJa: list(`
          Unicodeを使えば文字化けが完全になくなるという誤解
          小数は常に正確に保存できるという誤解
          表示結果が同じなら内部表現も同じという誤解
        `),
        questionsJa: list(`
          文字コードが違うと同じバイト列でも表示が変わるのはなぜか
          整数と浮動小数点はどのような用途で使い分けるか
          0.1のような値が誤差を生みやすいのはなぜか
          文字列長とバイト数が一致しないケースはどんなときか
        `),
        extractJa: list(`
          文字コードの役割を問う概念型文項にできる
          整数と浮動小数点の違いを比較する文項候補になる
          文字化け事例を解釈するシナリオ型文項へ拡張できる
        `),
        goalsKo: list(`
          문자 코드가 문자를 숫자에 대응시키는 구조를 설명한다
          정수 표현과 부동소수점 표현의 차이를 구분한다
          표현 방식 차이 때문에 생기는 오차 가능성을 설명한다
        `),
        whyKo: '같은 비트열이라도 문자인지 숫자인지에 따라 의미가 달라진다. 실무에서는 이 차이를 모르면 문자 깨짐이나 계산 오차를 제대로 해석할 수 없다.',
        coreKo: list(`
          문자 코드는 문자와 번호의 대응표이며 Unicode는 대표적인 체계다
          정수는 이산적인 값을 비교적 그대로 유지하기 쉽다
          부동소수점은 넓은 범위의 실수를 근사해 다루지만 반올림 오차가 생길 수 있다
        `),
        flowKo: list(`
          먼저 데이터가 문자인지 숫자인지 확인한다
          다음으로 어떤 문자 코드 또는 수 표현을 쓰는지 특정한다
          마지막으로 해석 차이가 표시나 계산 결과에 어떤 영향을 주는지 검토한다
        `),
        compareKo: list(`
          ASCII는 범위가 좁지만 단순하고 Unicode는 다국어를 다루기 쉽다
          정수는 엄밀성을 중시하고 부동소수점은 범위와 근사를 중시한다
        `),
        misKo: list(`
          Unicode를 쓰면 문자 깨짐이 완전히 사라진다는 오해
          소수는 항상 정확히 저장할 수 있다는 오해
          표시 결과가 같으면 내부 표현도 같다는 오해
        `),
        questionsKo: list(`
          문자 코드가 다르면 같은 바이트열도 표시가 달라지는 이유는 무엇인가
          정수와 부동소수점은 어떤 용도로 구분해 쓰는가
          0.1 같은 값이 오차를 만들기 쉬운 이유는 무엇인가
          문자열 길이와 바이트 수가 일치하지 않는 경우는 언제인가
        `),
        extractKo: list(`
          문자 코드의 역할을 묻는 개념형 문항으로 만들 수 있다
          정수와 부동소수점의 차이를 비교하는 문항 후보가 된다
          문자 깨짐 사례를 해석하는 시나리오형 문항으로 확장할 수 있다
        `),
      },
    ],
  },
  {
    moduleId: 'CSK-DS-01',
    subject: 'data-structures',
    title: 'データ構造の選択基準',
    description: '配列、連結リスト、スタック、キューのような頻出構造を静的な解説で整理する。',
    outcomes: list(`
      代表的なデータ構造のアクセス特性と更新特性を説明できる
      問題状況に応じたデータ構造の選択基準を示せる
      似た構造を比較して誤解を減らせる
    `),
    lessons: [
      {
        id: 'CSK-DS-01-01', titleJa: '配列と連結リストは何が違うのか', titleKo: '배열과 연결 리스트는 무엇이 다른가', topic: 'array-vs-linked-list', minutes: 20, tags: ['data-structures', 'array', 'linked-list', 'complexity'], summaryJa: '配列と連結リストを比較し、アクセス、挿入、メモリ配置の違いを整理する。',
        goalsJa: list(`
          配列と連結リストの基本構造を説明する
          アクセスと挿入の違いを判断する
          連続したメモリ配置の意味を理解する
        `),
        whyJa: 'データ構造の違いはアルゴリズム以前に性能と実装の読みやすさへ直結する。配列と連結リストはその代表的な対比である。',
        coreJa: list(`
          配列は連続した位置にデータを置くため添字で素早く参照しやすい
          連結リストは要素同士を参照でつなぎ、途中挿入を説明しやすい
          ただし連結リストは目的位置までたどるコストがかかる
        `),
        flowJa: list(`
          課題で頻繁なランダムアクセスが必要かを見る
          途中挿入や削除が多いかを見る
          メモリ局所性と実装の単純さのどちらを優先するか決める
        `),
        compareJa: list(`
          配列は位置ベース、連結リストは参照ベースの構造である
          理論上の挿入コストだけでなく位置探索コストまで含めて判断する必要がある
        `),
        misJa: list(`
          連結リストなら常に挿入が速いという誤解
          配列はサイズ変更が一切できないという誤解
          時間計算量だけ見れば実務でも必ず正しい選択になるという誤解
        `),
        questionsJa: list(`
          添字アクセスが重要な場合はどちらが向いているか
          途中への追加が多いなら何を確認すべきか
          連続メモリ配置はキャッシュ観点でどんな意味を持つか
          理論と実務の性能差が生じる理由は何か
        `),
        extractJa: list(`
          配列と連結リストのアクセス対比を比較型文項として抽出できる
          メモリ配置とキャッシュを結ぶ解釈型文項候補になる
          問題状況に合う構造選択問題を作れる
        `),
        goalsKo: list(`
          배열과 연결 리스트의 기본 구조를 설명한다
          접근과 삽입의 차이를 판단한다
          연속된 메모리 배치의 의미를 이해한다
        `),
        whyKo: '자료구조의 차이는 알고리즘 이전에 성능과 구현 난이도에 직접 연결된다. 배열과 연결 리스트는 그 대표적인 대비다.',
        coreKo: list(`
          배열은 연속된 위치에 데이터를 두기 때문에 인덱스로 빠르게 참조하기 쉽다
          연결 리스트는 요소를 참조로 연결해 중간 삽입 구조를 설명하기 쉽다
          다만 연결 리스트는 목적 위치까지 따라가는 비용이 든다
        `),
        flowKo: list(`
          문제에서 임의 접근이 자주 필요한지 본다
          중간 삽입과 삭제가 많은지 본다
          메모리 지역성과 구현 단순성 중 무엇을 우선할지 결정한다
        `),
        compareKo: list(`
          배열은 위치 기반이고 연결 리스트는 참조 기반 구조다
          이론상의 삽입 비용뿐 아니라 위치 탐색 비용까지 포함해 판단해야 한다
        `),
        misKo: list(`
          연결 리스트면 항상 삽입이 빠르다는 오해
          배열은 크기 변경이 전혀 안 된다는 오해
          시간 복잡도만 보면 실무에서도 항상 맞는 선택이라는 오해
        `),
        questionsKo: list(`
          인덱스 접근이 중요한 경우 어느 쪽이 더 적합한가
          중간 추가가 많다면 무엇을 먼저 확인해야 하는가
          연속 메모리 배치는 캐시 관점에서 어떤 의미를 가지는가
          이론과 실무의 성능 차이가 생기는 이유는 무엇인가
        `),
        extractKo: list(`
          배열과 연결 리스트의 접근 대비를 비교형 문항으로 추출할 수 있다
          메모리 배치와 캐시를 연결한 해석형 문항 후보가 된다
          문제 상황에 맞는 구조 선택 문제를 만들 수 있다
        `),
      },
      {
        id: 'CSK-DS-01-02', titleJa: 'スタックとキューはどの場面で使い分けるのか', titleKo: '스택과 큐는 어떤 상황에서 구분해 쓰는가', topic: 'stack-vs-queue', minutes: 18, tags: ['data-structures', 'stack', 'queue', 'order'], summaryJa: 'スタックとキューの処理順序を中心に、問題状況に合う選択基準を整理する。',
        goalsJa: list(`
          スタックとキューの取り出し順序を説明する
          LIFOとFIFOの違いを判断する
          代表的な利用場面を順序観点で解釈する
        `),
        whyJa: '同じデータ集合でも取り出し順序が変わるだけで問題の性質は大きく変わる。順序制御の理解不足は要求不一致に直結する。',
        coreJa: list(`
          スタックは最後に入れたものを先に取り出すLIFO構造である
          キューは先に入れたものを先に取り出すFIFO構造である
          探索、待ち行列、履歴管理で使いどころが分かれる
        `),
        flowJa: list(`
          問題の順序要件を最初に文章で整理する
          新しい要素を優先するか、古い要素を優先するかを決める
          必要なら両端操作を持つ他構造とも比較する
        `),
        compareJa: list(`
          スタックは直前状態へ戻る操作と相性が良い
          キューは到着順処理やバッファリングと相性が良い
        `),
        misJa: list(`
          どちらも入れて取り出すだけなので同じだという誤解
          キューは必ずネットワーク専用構造だという誤解
          スタックは再帰があるときだけ必要だという誤解
        `),
        questionsJa: list(`
          ブラウザの戻る機能はなぜスタックに近いか
          印刷待ち作業はなぜキューで説明しやすいか
          FIFOが必要な要件をLIFOで実装するとどんな問題が起きるか
          Dequeと比較すべき状況はいつか
        `),
        extractJa: list(`
          LIFOとFIFOの違いを定義型文項にできる
          具体例を見てスタックかキューかを選ぶ判断型文項へ拡張できる
          順序要件の誤読を狙う誤答誘導ポイントを構成できる
        `),
        goalsKo: list(`
          스택과 큐의 꺼내는 순서를 설명한다
          LIFO와 FIFO의 차이를 판단한다
          대표 활용 사례를 순서 관점에서 해석한다
        `),
        whyKo: '같은 데이터 집합이라도 꺼내는 순서가 달라지면 문제의 성격이 크게 바뀐다. 순서 제어를 잘못 이해하면 요구사항을 만족하지 못한다.',
        coreKo: list(`
          스택은 나중에 넣은 것을 먼저 꺼내는 LIFO 구조다
          큐는 먼저 넣은 것을 먼저 꺼내는 FIFO 구조다
          탐색, 대기열, 기록 관리에서 쓰임새가 갈린다
        `),
        flowKo: list(`
          문제의 순서 요구를 먼저 문장으로 정리한다
          새 요소를 우선할지 오래된 요소를 우선할지 결정한다
          필요하면 양쪽 끝 조작이 가능한 다른 구조와도 비교한다
        `),
        compareKo: list(`
          스택은 직전 상태로 되돌아가는 동작과 잘 맞는다
          큐는 도착 순서 처리나 버퍼링과 잘 맞는다
        `),
        misKo: list(`
          둘 다 넣고 꺼내기만 하면 같다는 오해
          큐는 반드시 네트워크 전용 구조라는 오해
          스택은 재귀가 있을 때만 필요하다는 오해
        `),
        questionsKo: list(`
          브라우저 뒤로 가기는 왜 스택에 가까운가
          인쇄 대기 작업은 왜 큐로 설명하기 쉬운가
          FIFO가 필요한 요구사항을 LIFO로 구현하면 어떤 문제가 생기는가
          Deque와 비교해야 하는 상황은 언제인가
        `),
        extractKo: list(`
          LIFO와 FIFO의 차이를 정의형 문항으로 만들 수 있다
          사례를 보고 스택과 큐를 선택하는 판단형 문항으로 확장할 수 있다
          순서 요구를 잘못 해석한 오답 유도 포인트를 만들 수 있다
        `),
      },
    ],
  }
]

function frontmatter({ id, title, moduleId, subject, minutes, tags, language }) {
  return [
    '---',
    `lesson_id: ${id}`,
    `title: "${title}"`,
    `module: ${moduleId}`,
    'level: foundation',
    `subject: ${subject}`,
    `language: ${language}`,
    `est_minutes: ${minutes}`,
    `tags: [${tags.map((tag) => `"${tag}"`).join(', ')}]`,
    '---',
    '',
  ].join('\n')
}

function renderLesson(language, subject, lesson) {
  const isJa = language === 'ja'
  const [h1, h2, h3, h4, h5, h6, h7, h8] = isJa
    ? sections.map((pair) => pair[0])
    : sections.map((pair) => pair[1])
  const goals = isJa ? lesson.goalsJa : lesson.goalsKo
  const why = isJa ? lesson.whyJa : lesson.whyKo
  const core = isJa ? lesson.coreJa : lesson.coreKo
  const flow = isJa ? lesson.flowJa : lesson.flowKo
  const compare = isJa ? lesson.compareJa : lesson.compareKo
  const mis = isJa ? lesson.misJa : lesson.misKo
  const questions = isJa ? lesson.questionsJa : lesson.questionsKo
  const extract = isJa ? lesson.extractJa : lesson.extractKo
  const title = isJa ? lesson.titleJa : lesson.titleKo

  return [
    frontmatter({
      id: lesson.id,
      title,
      moduleId: subject.moduleId,
      subject: subject.subject,
      minutes: lesson.minutes,
      tags: lesson.tags,
      language,
    }),
    `## 1) ${h1}\n\n${goals.map((item) => `- ${item}`).join('\n')}\n`,
    `## 2) ${h2}\n\n${why}\n`,
    `## 3) ${h3}\n\n${core.map((item) => `- ${item}`).join('\n')}\n`,
    `## 4) ${h4}\n\n${flow.map((item, index) => `${index + 1}. ${item}`).join('\n')}\n`,
    `## 5) ${h5}\n\n${compare.map((item) => `- ${item}`).join('\n')}\n`,
    `## 6) ${h6}\n\n${mis.map((item) => `- ${item}`).join('\n')}\n`,
    `## 7) ${h7}\n\n${questions.map((item, index) => `${index + 1}. ${item}`).join('\n')}\n`,
    `## 8) ${h8}\n\n${extract.map((item) => `- ${item}`).join('\n')}\n`,
  ].join('\n')
}

async function writeTrack() {
  const lines = [
    'track:',
    '  id: CS-KNOWLEDGE',
    '  title: "CS知識"',
    '  default_language: ja',
    '  supported_languages: [ja, ko]',
    '  level_order: [foundation, intermediate, advanced]',
    '  content_mode: static-interpretive',
    '  assessment_policy:',
    '    standalone_understanding_test: false',
    '    question_extraction_from_lessons: true',
    '  modules:',
  ]

  subjects.forEach((subject, index) => {
    lines.push(`    - id: ${subject.moduleId}`)
    lines.push(`      title: "${subject.title}"`)
    lines.push(`      subject: ${subject.subject}`)
    lines.push('      level: foundation')
    lines.push(`      order: ${(index + 1) * 10}`)
  })

  await fs.writeFile(path.join(root, 'track.yaml'), `${lines.join('\n')}\n`, 'utf8')
}

async function writeSubject(subject) {
  const moduleDir = path.join(root, 'modules', subject.moduleId)
  const lessonsDir = path.join(moduleDir, 'lessons')
  await fs.mkdir(lessonsDir, { recursive: true })

  const moduleLines = [
    'module:',
    `  id: ${subject.moduleId}`,
    `  title: "${subject.title}"`,
    '  default_language: ja',
    '  level: foundation',
    `  description: "${subject.description}"`,
    `  subject: ${subject.subject}`,
    '  content_mode: static-interpretive',
    '  outcomes:',
    ...subject.outcomes.map((item) => `    - "${item}"`),
    '  lessons:',
  ]

  subject.lessons.forEach((lesson) => {
    moduleLines.push(`    - id: ${lesson.id}`)
    moduleLines.push(`      title: "${lesson.titleJa}"`)
    moduleLines.push(`      est_minutes: ${lesson.minutes}`)
    moduleLines.push(`      tags: [${lesson.tags.map((tag) => `"${tag}"`).join(', ')}]`)
  })

  await fs.writeFile(path.join(moduleDir, 'module.yaml'), `${moduleLines.join('\n')}\n`, 'utf8')

  await Promise.all(
    subject.lessons.flatMap((lesson) => {
      const meta = {
        lesson_id: lesson.id,
        category: 'cs-knowledge',
        subject: subject.subject,
        topic: lesson.topic,
        default_language: 'ja',
        available_languages: ['ja', 'ko'],
        summary: lesson.summaryJa,
        key_points: [lesson.coreJa[0], lesson.coreJa[1], lesson.compareJa[0]],
        misconceptions: lesson.misJa,
        check_questions: lesson.questionsJa,
        exam_extractables: {
          fact_candidates: [lesson.coreJa[0], lesson.coreJa[1]],
          concept_contrast_candidates: [lesson.compareJa[0], lesson.compareJa[1]],
          scenario_candidates: [lesson.extractJa[1], lesson.extractJa[2]],
          common_wrong_answer_patterns: [lesson.misJa[0], lesson.misJa[1]],
        },
      }

      return [
        fs.writeFile(path.join(lessonsDir, `${lesson.id}.mdx`), renderLesson('ja', subject, lesson), 'utf8'),
        fs.writeFile(path.join(lessonsDir, `${lesson.id}.ko.mdx`), renderLesson('ko', subject, lesson), 'utf8'),
        fs.writeFile(path.join(lessonsDir, `${lesson.id}.meta.json`), `${JSON.stringify(meta, null, 2)}\n`, 'utf8'),
      ]
    })
  )
}

await fs.mkdir(root, { recursive: true })
await writeTrack()
await Promise.all(subjects.map(writeSubject))
console.log(`Generated ${subjects.length} modules and ${subjects.reduce((sum, subject) => sum + subject.lessons.length, 0)} lessons.`)
