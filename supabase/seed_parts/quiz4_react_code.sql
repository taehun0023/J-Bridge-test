-- ============================================
-- Quiz 4 追加: React コードリーディング問題 (30 questions)
-- Category: react
-- Subtype: code_reading
-- sort_order: 181-210
-- Difficulty: easy 9, medium 15, hard 6
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== react code_reading - EASY (9) =====

  -- Q181: JSXの基本レンダリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のReactコンポーネントがレンダリングする内容はどれか。\n\nfunction App() {\n  const name = "React";\n  return <h1>Hello, {name}!</h1>;\n}', 'JSXの中括弧 {} 内でJavaScript式が評価される。変数nameに"React"が格納されているため、<h1>Hello, React!</h1>がレンダリングされる。', 1, 181, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Hello, {name}!', FALSE, 1),
    (gen_random_uuid(), q_id, 'Hello, React!', TRUE, 2),
    (gen_random_uuid(), q_id, 'Hello, undefined!', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q182: 条件付きレンダリング（&&演算子）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のReactコンポーネントがレンダリングする内容はどれか。\n\nfunction App() {\n  const isLoggedIn = true;\n  return (\n    <div>\n      {isLoggedIn && <p>Welcome!</p>}\n    </div>\n  );\n}', '&&演算子による条件付きレンダリングでは、左辺がtrueの場合に右辺がレンダリングされる。isLoggedInがtrueなので<p>Welcome!</p>が表示される。', 1, 182, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '空の<div>のみ表示される', FALSE, 1),
    (gen_random_uuid(), q_id, '<div>内に「Welcome!」が表示される', TRUE, 2),
    (gen_random_uuid(), q_id, '「true」という文字列が表示される', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q183: propsの受け渡し
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードの出力はどれか。\n\nfunction Greeting({ name, age }) {\n  return <p>{name}は{age}歳です</p>;\n}\n\nfunction App() {\n  return <Greeting name="太郎" age={25} />;\n}', 'propsはオブジェクトの分割代入で受け取れる。nameに"太郎"、ageに25が渡されるため、「太郎は25歳です」がレンダリングされる。', 1, 183, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '太郎は25歳です', TRUE, 1),
    (gen_random_uuid(), q_id, '{name}は{age}歳です', FALSE, 2),
    (gen_random_uuid(), q_id, 'undefinedはundefined歳です', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q184: Array.mapによるリストレンダリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のReactコンポーネントがレンダリングする<li>要素の数はいくつか。\n\nfunction List() {\n  const items = ["A", "B", "C"];\n  return (\n    <ul>\n      {items.map((item, i) => (\n        <li key={i}>{item}</li>\n      ))}\n    </ul>\n  );\n}', 'Array.mapは配列の各要素に対して関数を実行し、新しい配列を返す。items配列には3つの要素があるため、<li>要素が3つレンダリングされる。', 1, 184, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0個', FALSE, 1),
    (gen_random_uuid(), q_id, '1個', FALSE, 2),
    (gen_random_uuid(), q_id, '3個', TRUE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q185: 三項演算子による条件レンダリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のReactコンポーネントがレンダリングする内容はどれか。\n\nfunction Status() {\n  const count = 0;\n  return (\n    <p>{count > 0 ? `${count}件あります` : "データなし"}</p>\n  );\n}', 'countが0なので、count > 0はfalseとなる。三項演算子の偽側の"データなし"がレンダリングされる。', 1, 185, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0件あります', FALSE, 1),
    (gen_random_uuid(), q_id, 'データなし', TRUE, 2),
    (gen_random_uuid(), q_id, '何も表示されない', FALSE, 3),
    (gen_random_uuid(), q_id, '0', FALSE, 4);

  -- Q186: useStateの初期値
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のReactコンポーネントの初回レンダリング時に表示される内容はどれか。\n\nfunction Counter() {\n  const [count, setCount] = useState(10);\n  return <span>Count: {count}</span>;\n}', 'useStateの引数は状態の初期値である。useState(10)なのでcountの初期値は10。初回レンダリング時には「Count: 10」が表示される。', 1, 186, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Count: 0', FALSE, 1),
    (gen_random_uuid(), q_id, 'Count: 10', TRUE, 2),
    (gen_random_uuid(), q_id, 'Count: undefined', FALSE, 3),
    (gen_random_uuid(), q_id, 'Count: null', FALSE, 4);

  -- Q187: onClickイベント
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでボタンをクリックした時にconsole.logに出力される値はどれか。\n\nfunction App() {\n  const handleClick = () => {\n    console.log("clicked");\n  };\n  return <button onClick={handleClick}>Click</button>;\n}', 'onClickにhandleClick関数が設定されている。ボタンクリック時にhandleClickが呼ばれ、console.logに"clicked"が出力される。', 1, 187, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'clicked', TRUE, 1),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 2),
    (gen_random_uuid(), q_id, 'handleClick', FALSE, 3),
    (gen_random_uuid(), q_id, '何も出力されない', FALSE, 4);

  -- Q188: propsのデフォルト値
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードがレンダリングする内容はどれか。\n\nfunction Badge({ label = "default" }) {\n  return <span>{label}</span>;\n}\n\nfunction App() {\n  return <Badge />;\n}', 'Badgeコンポーネントにlabel propが渡されていないため、分割代入のデフォルト値"default"が使用される。<span>default</span>がレンダリングされる。', 1, 188, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'default', TRUE, 1),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 2),
    (gen_random_uuid(), q_id, '空文字列', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q189: childrenの表示
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードがレンダリングする内容はどれか。\n\nfunction Card({ children }) {\n  return <div className="card">{children}</div>;\n}\n\nfunction App() {\n  return <Card><p>Hello</p></Card>;\n}', 'children propはコンポーネントの開始タグと終了タグの間に渡された要素を受け取る。<p>Hello</p>がchildrenとしてCard内にレンダリングされる。', 1, 189, 'easy', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '<div class="card"><p>Hello</p></div>', TRUE, 1),
    (gen_random_uuid(), q_id, '<div class="card"></div>', FALSE, 2),
    (gen_random_uuid(), q_id, '<p>Hello</p>', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- ===== react code_reading - MEDIUM (15) =====

  -- Q190: useStateの更新と再レンダリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでボタンを1回クリックした後に表示される値はどれか。\n\nfunction Counter() {\n  const [count, setCount] = useState(0);\n  const handleClick = () => {\n    setCount(count + 1);\n    console.log(count);\n  };\n  return (\n    <div>\n      <p>{count}</p>\n      <button onClick={handleClick}>+1</button>\n    </div>\n  );\n}', 'setCountは次のレンダリングでstateを更新する。console.logはクリック時点のcountの値（クロージャでキャプチャされた0）を出力する。画面には再レンダリング後の1が表示されるが、console.logには0が出力される。', 1, 190, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '画面: 1, console: 1', FALSE, 1),
    (gen_random_uuid(), q_id, '画面: 1, console: 0', TRUE, 2),
    (gen_random_uuid(), q_id, '画面: 0, console: 0', FALSE, 3),
    (gen_random_uuid(), q_id, '画面: 0, console: 1', FALSE, 4);

  -- Q191: useState連続呼び出し（バッチ更新）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでボタンを1回クリックした後に表示されるcountの値はどれか。\n\nfunction Counter() {\n  const [count, setCount] = useState(0);\n  const handleClick = () => {\n    setCount(count + 1);\n    setCount(count + 1);\n    setCount(count + 1);\n  };\n  return <p>{count}</p>;\n}', 'Reactのイベントハンドラ内ではstate更新はバッチ処理される。3回のsetCountはすべて同じcountの値（0）を参照しているため、すべてsetCount(0 + 1)と等価。最終的にcountは1になる。', 1, 191, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3', FALSE, 1),
    (gen_random_uuid(), q_id, '1', TRUE, 2),
    (gen_random_uuid(), q_id, '0', FALSE, 3),
    (gen_random_uuid(), q_id, '2', FALSE, 4);

  -- Q192: useEffect依存配列
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、コンポーネントのマウント後にconsole.logが何回呼ばれるか。\n\nfunction App() {\n  const [count, setCount] = useState(0);\n  useEffect(() => {\n    console.log("effect");\n  }, []);\n  return <p>{count}</p>;\n}', 'useEffectの依存配列が空配列[]の場合、エフェクトはマウント時に1回だけ実行される。countが変更されてもエフェクトは再実行されない。', 1, 192, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0回', FALSE, 1),
    (gen_random_uuid(), q_id, '1回', TRUE, 2),
    (gen_random_uuid(), q_id, 'レンダリングのたびに呼ばれる', FALSE, 3),
    (gen_random_uuid(), q_id, '2回', FALSE, 4);

  -- Q193: useEffectの依存配列による再実行
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、nameが変更された時のuseEffectの動作として正しいのはどれか。\n\nfunction Profile({ name }) {\n  const [bio, setBio] = useState("");\n  useEffect(() => {\n    console.log("Name changed:", name);\n    setBio(`Profile of ${name}`);\n  }, [name]);\n  return <p>{bio}</p>;\n}', '依存配列に[name]が指定されているため、name propが変更されるたびにエフェクトが再実行される。bioが変更されてもname propが同じなら再実行されない。', 1, 193, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'nameが変更された時のみエフェクトが再実行される', TRUE, 1),
    (gen_random_uuid(), q_id, 'bioが変更されるたびにエフェクトが再実行される', FALSE, 2),
    (gen_random_uuid(), q_id, 'マウント時に1回だけ実行される', FALSE, 3),
    (gen_random_uuid(), q_id, 'レンダリングのたびに実行される', FALSE, 4);

  -- Q194: React.memoの再レンダリング条件
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで親コンポーネントが再レンダリングされた時、Childは再レンダリングされるか。\n\nconst Child = React.memo(function Child({ value }) {\n  console.log("Child rendered");\n  return <p>{value}</p>;\n});\n\nfunction Parent() {\n  const [count, setCount] = useState(0);\n  return (\n    <div>\n      <Child value="hello" />\n      <button onClick={() => setCount(c => c + 1)}>+</button>\n    </div>\n  );\n}', 'React.memoはpropsが変更されない限り再レンダリングをスキップする。Childに渡されるvalue="hello"は常に同じ文字列なので、Parentが再レンダリングされてもChildは再レンダリングされない。', 1, 194, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Parentが再レンダリングされるたびにChildも再レンダリングされる', FALSE, 1),
    (gen_random_uuid(), q_id, 'valueが変更されない限りChildは再レンダリングされない', TRUE, 2),
    (gen_random_uuid(), q_id, 'React.memoは関数コンポーネントでは動作しない', FALSE, 3),
    (gen_random_uuid(), q_id, 'countが変更されるたびにChildも再レンダリングされる', FALSE, 4);

  -- Q195: useRefの基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでボタンをクリックした時のconsole.logの出力はどれか。\n\nfunction App() {\n  const countRef = useRef(0);\n  const handleClick = () => {\n    countRef.current += 1;\n    console.log(countRef.current);\n  };\n  return <button onClick={handleClick}>Click</button>;\n}', 'useRefは.currentプロパティを持つオブジェクトを返す。refの更新は再レンダリングを引き起こさないが、値は即座に更新される。クリック時にcountRef.currentが0から1になり、1が出力される。', 1, 195, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0', FALSE, 1),
    (gen_random_uuid(), q_id, '1', TRUE, 2),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 3),
    (gen_random_uuid(), q_id, '再レンダリングされて画面が更新される', FALSE, 4);

  -- Q196: useContextの値伝搬
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで<Display />がレンダリングする内容はどれか。\n\nconst ThemeContext = createContext("light");\n\nfunction Display() {\n  const theme = useContext(ThemeContext);\n  return <p>{theme}</p>;\n}\n\nfunction App() {\n  return (\n    <ThemeContext.Provider value="dark">\n      <Display />\n    </ThemeContext.Provider>\n  );\n}', 'ThemeContext.ProviderでvalueとIて"dark"が指定されている。Display内のuseContext(ThemeContext)はProviderから最も近い値を取得するため、"dark"が返される。', 1, 196, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'light', FALSE, 1),
    (gen_random_uuid(), q_id, 'dark', TRUE, 2),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 3),
    (gen_random_uuid(), q_id, 'null', FALSE, 4);

  -- Q197: 制御コンポーネント（input）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードのinputフィールドにユーザーが「abc」と入力した時、inputに表示される値はどれか。\n\nfunction Form() {\n  const [value, setValue] = useState("");\n  return (\n    <input\n      value={value.toUpperCase()}\n      onChange={(e) => setValue(e.target.value)}\n    />\n  );\n}', 'onChangeでsetValueにe.target.valueが設定される。表示時にvalue.toUpperCase()で大文字に変換される。「abc」と入力すると、valueは"abc"だが表示は"ABC"になる。', 1, 197, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'abc', FALSE, 1),
    (gen_random_uuid(), q_id, 'ABC', TRUE, 2),
    (gen_random_uuid(), q_id, '空文字列（入力できない）', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q198: useCallbackの依存配列
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードについて正しい説明はどれか。\n\nfunction App() {\n  const [count, setCount] = useState(0);\n  const [text, setText] = useState("");\n  const increment = useCallback(() => {\n    setCount(c => c + 1);\n  }, []);\n  return (\n    <div>\n      <input value={text} onChange={e => setText(e.target.value)} />\n      <MemoButton onClick={increment} />\n    </div>\n  );\n}', 'useCallbackは依存配列が変更されない限り同じ関数参照を返す。依存配列が空なので、increment関数は常に同一の参照を保つ。textが変更されてもincrementの参照は変わらないため、React.memoでラップされたMemoButtonの不要な再レンダリングを防げる。', 1, 198, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'textが変更されるたびにincrementは新しい関数になる', FALSE, 1),
    (gen_random_uuid(), q_id, 'incrementは常に同じ関数参照を保つためMemoButtonの再レンダリングを防げる', TRUE, 2),
    (gen_random_uuid(), q_id, 'useCallbackは関数の実行結果をキャッシュする', FALSE, 3),
    (gen_random_uuid(), q_id, 'useCallbackを使うとsetCountが呼ばれなくなる', FALSE, 4);

  -- Q199: useMemoの計算キャッシュ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、textが変更された時にexpensiveCalcは再計算されるか。\n\nfunction App() {\n  const [count, setCount] = useState(0);\n  const [text, setText] = useState("");\n  const result = useMemo(() => {\n    console.log("computing...");\n    return count * 2;\n  }, [count]);\n  return <p>{result} / {text}</p>;\n}', 'useMemoは依存配列の値が変更された時のみ再計算する。依存配列に[count]が指定されているため、textが変更されてもcountが変わらなければ再計算されない。', 1, 199, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'textが変更されるたびに再計算される', FALSE, 1),
    (gen_random_uuid(), q_id, 'countが変更された時のみ再計算される', TRUE, 2),
    (gen_random_uuid(), q_id, 'マウント時の1回だけ計算される', FALSE, 3),
    (gen_random_uuid(), q_id, '毎回のレンダリングで再計算される', FALSE, 4);

  -- Q200: カスタムフックの動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードの初回レンダリング時に表示される内容はどれか。\n\nfunction useCounter(initial) {\n  const [count, setCount] = useState(initial);\n  const increment = () => setCount(c => c + 1);\n  return { count, increment };\n}\n\nfunction App() {\n  const { count } = useCounter(5);\n  return <p>{count}</p>;\n}', 'カスタムフックuseCounterはuseStateをラップしている。initial引数に5が渡されるため、useStateの初期値は5。初回レンダリング時にcountは5が表示される。', 1, 200, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0', FALSE, 1),
    (gen_random_uuid(), q_id, '5', TRUE, 2),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q201: useReducerの状態遷移
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで「increment」ボタンを2回クリックした後に表示されるcountの値はどれか。\n\nfunction reducer(state, action) {\n  switch (action.type) {\n    case "increment": return { count: state.count + 1 };\n    case "decrement": return { count: state.count - 1 };\n    default: return state;\n  }\n}\n\nfunction App() {\n  const [state, dispatch] = useReducer(reducer, { count: 0 });\n  return (\n    <div>\n      <p>{state.count}</p>\n      <button onClick={() => dispatch({ type: "increment" })}>increment</button>\n    </div>\n  );\n}', 'useReducerの初期値は{ count: 0 }。"increment"アクションが2回dispatchされると、reducerが2回実行される。0→1→2と遷移し、最終的にcount: 2が表示される。', 1, 201, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0', FALSE, 1),
    (gen_random_uuid(), q_id, '1', FALSE, 2),
    (gen_random_uuid(), q_id, '2', TRUE, 3),
    (gen_random_uuid(), q_id, '3', FALSE, 4);

  -- Q202: &&演算子と0の罠
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のReactコンポーネントがレンダリングする内容はどれか。\n\nfunction App() {\n  const items = [];\n  return (\n    <div>\n      {items.length && <p>リストがあります</p>}\n    </div>\n  );\n}', 'items.lengthは0（falsy値）。&&演算子はfalsyな左辺をそのまま返す。Reactは数値の0をそのまま画面にレンダリングするため、<div>内に「0」が表示される。これはReactでよくある落とし穴である。', 1, 202, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '「リストがあります」が表示される', FALSE, 1),
    (gen_random_uuid(), q_id, '何も表示されない', FALSE, 2),
    (gen_random_uuid(), q_id, '「0」が表示される', TRUE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q203: useEffectのクリーンアップ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでコンポーネントがアンマウントされた時に実行されるのはどれか。\n\nfunction Timer() {\n  useEffect(() => {\n    const id = setInterval(() => {\n      console.log("tick");\n    }, 1000);\n    return () => clearInterval(id);\n  }, []);\n  return <p>Timer running</p>;\n}', 'useEffectの戻り値として返される関数はクリーンアップ関数である。コンポーネントがアンマウントされる時（依存配列が空の場合）にこのクリーンアップ関数が実行され、clearInterval(id)が呼ばれてタイマーが解除される。', 1, 203, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'console.log("tick")が実行される', FALSE, 1),
    (gen_random_uuid(), q_id, 'clearInterval(id)が実行される', TRUE, 2),
    (gen_random_uuid(), q_id, '何も実行されない', FALSE, 3),
    (gen_random_uuid(), q_id, 'setIntervalが再度呼ばれる', FALSE, 4);

  -- Q204: keyプロパティの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでReactが警告を出す原因として正しいのはどれか。\n\nfunction TodoList({ todos }) {\n  return (\n    <ul>\n      {todos.map((todo) => (\n        <li>{todo.text}</li>\n      ))}\n    </ul>\n  );\n}', 'Array.mapでリストをレンダリングする際、各要素にユニークなkey propが必要。keyがないとReactは「Each child in a list should have a unique key prop」という警告を出す。keyはReactが要素の追加・削除・並べ替えを効率的に処理するために使用される。', 1, 204, 'medium', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'mapのコールバックにindex引数がない', FALSE, 1),
    (gen_random_uuid(), q_id, 'リスト要素にkey propが指定されていない', TRUE, 2),
    (gen_random_uuid(), q_id, '<ul>タグの中に<li>以外の要素がある', FALSE, 3),
    (gen_random_uuid(), q_id, 'todosがundefinedの可能性がある', FALSE, 4);

  -- ===== react code_reading - HARD (6) =====

  -- Q205: useState関数型更新とバッチ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでボタンを1回クリックした後に表示されるcountの値はどれか。\n\nfunction Counter() {\n  const [count, setCount] = useState(0);\n  const handleClick = () => {\n    setCount(prev => prev + 1);\n    setCount(prev => prev + 1);\n    setCount(prev => prev + 1);\n  };\n  return <p>{count}</p>;\n}', '関数型更新（prev => prev + 1）を使った場合、各更新は前回の更新結果に基づいて計算される。1回目: 0→1、2回目: 1→2、3回目: 2→3。値での更新（setCount(count + 1)）とは異なり、関数型更新はバッチ内でも正しくチェーンされる。', 1, 205, 'hard', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, '3', TRUE, 2),
    (gen_random_uuid(), q_id, '0', FALSE, 3),
    (gen_random_uuid(), q_id, '2', FALSE, 4);

  -- Q206: useEffectの実行順序
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで初回マウント時にconsole.logが出力される順序はどれか。\n\nfunction Child() {\n  useEffect(() => {\n    console.log("Child effect");\n  }, []);\n  console.log("Child render");\n  return <p>Child</p>;\n}\n\nfunction Parent() {\n  useEffect(() => {\n    console.log("Parent effect");\n  }, []);\n  console.log("Parent render");\n  return <Child />;\n}', 'レンダリングフェーズでは、ParentのレンダリングがChildのレンダリングを含む。先にParent render、次にChild renderがログされる。useEffectはレンダリング後に実行され、子から親の順に実行される。よってChild effect → Parent effectの順。', 1, 206, 'hard', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Parent render → Child render → Parent effect → Child effect', FALSE, 1),
    (gen_random_uuid(), q_id, 'Parent render → Child render → Child effect → Parent effect', TRUE, 2),
    (gen_random_uuid(), q_id, 'Child render → Parent render → Child effect → Parent effect', FALSE, 3),
    (gen_random_uuid(), q_id, 'Parent effect → Child effect → Parent render → Child render', FALSE, 4);

  -- Q207: React.memoとオブジェクトprops
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで親のボタンをクリックするたびにChildは再レンダリングされるか。\n\nconst Child = React.memo(function Child({ style }) {\n  console.log("Child rendered");\n  return <div style={style}>Hello</div>;\n});\n\nfunction Parent() {\n  const [count, setCount] = useState(0);\n  return (\n    <div>\n      <Child style={{ color: "red" }} />\n      <button onClick={() => setCount(c => c + 1)}>+</button>\n    </div>\n  );\n}', 'React.memoは浅い比較（shallow comparison）でpropsを比較する。{ color: "red" }はレンダリングのたびに新しいオブジェクトが作成されるため、参照が異なる。浅い比較では異なるオブジェクトと判定され、Childは毎回再レンダリングされる。', 1, 207, 'hard', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'React.memoにより再レンダリングされない', FALSE, 1),
    (gen_random_uuid(), q_id, 'style propが毎回新しいオブジェクトなので再レンダリングされる', TRUE, 2),
    (gen_random_uuid(), q_id, 'styleの中身が同じなので再レンダリングされない', FALSE, 3),
    (gen_random_uuid(), q_id, 'count propが渡されていないので再レンダリングされない', FALSE, 4);

  -- Q208: useRefとレンダリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでボタンを3回クリックした後、画面に表示されるcountの値とconsole.logに出力されるrenderCountの値はどれか。\n\nfunction App() {\n  const [count, setCount] = useState(0);\n  const renderCount = useRef(0);\n  renderCount.current += 1;\n  const handleClick = () => setCount(c => c + 1);\n  return (\n    <div>\n      <p>count: {count}</p>\n      <p>renders: {renderCount.current}</p>\n      <button onClick={handleClick}>+</button>\n    </div>\n  );\n}', 'ボタンを3回クリックするとsetCountが3回呼ばれ、初回レンダリングと合わせて計4回レンダリングされる。renderCount.currentはレンダリングのたびにインクリメントされるため4になる。countは3回のクリックで3になる。', 1, 208, 'hard', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'count: 3, renders: 3', FALSE, 1),
    (gen_random_uuid(), q_id, 'count: 3, renders: 4', TRUE, 2),
    (gen_random_uuid(), q_id, 'count: 3, renders: 1', FALSE, 3),
    (gen_random_uuid(), q_id, 'count: 0, renders: 4', FALSE, 4);

  -- Q209: クロージャとstale state
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで「Start」ボタンを押した直後に「+1」ボタンを5回クリックした場合、3秒後にアラートに表示される値はどれか。\n\nfunction App() {\n  const [count, setCount] = useState(0);\n  const handleStart = () => {\n    setTimeout(() => {\n      alert(count);\n    }, 3000);\n  };\n  return (\n    <div>\n      <p>{count}</p>\n      <button onClick={() => setCount(c => c + 1)}>+1</button>\n      <button onClick={handleStart}>Start</button>\n    </div>\n  );\n}', 'setTimeoutのコールバックはhandleStartが呼ばれた時点のcountの値をクロージャでキャプチャする。「Start」クリック時のcountは0なので、3秒後のalertには0が表示される。これはReactのstale closure（古いクロージャ）問題として知られている。', 1, 209, 'hard', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5', FALSE, 1),
    (gen_random_uuid(), q_id, '0', TRUE, 2),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 3),
    (gen_random_uuid(), q_id, 'null', FALSE, 4);

  -- Q210: Context再レンダリングの範囲
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでボタンをクリックした時、再レンダリングされるコンポーネントはどれか。\n\nconst CountContext = createContext(0);\n\nconst Display = React.memo(function Display() {\n  const count = useContext(CountContext);\n  console.log("Display render");\n  return <p>{count}</p>;\n});\n\nconst Static = React.memo(function Static() {\n  console.log("Static render");\n  return <p>Static content</p>;\n});\n\nfunction App() {\n  const [count, setCount] = useState(0);\n  return (\n    <CountContext.Provider value={count}>\n      <Display />\n      <Static />\n      <button onClick={() => setCount(c => c + 1)}>+</button>\n    </CountContext.Provider>\n  );\n}', 'Context.Providerのvalueが変更されると、そのContextをuseContextで購読しているコンポーネントはReact.memoでラップされていても再レンダリングされる。DisplayはuseContext(CountContext)を使用しているため再レンダリングされる。StaticはContextを購読していないため、React.memoにより再レンダリングされない。ただしAppはsetStateにより再レンダリングされる。', 1, 210, 'hard', 'react', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'App, Display, Staticすべて', FALSE, 1),
    (gen_random_uuid(), q_id, 'AppとDisplayのみ（Staticは再レンダリングされない）', TRUE, 2),
    (gen_random_uuid(), q_id, 'Appのみ（React.memoで子はすべてスキップ）', FALSE, 3),
    (gen_random_uuid(), q_id, 'Displayのみ', FALSE, 4);

END $$;
