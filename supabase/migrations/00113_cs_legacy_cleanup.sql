-- Normalize legacy CS quiz metadata, recategorize uncategorized questions,
-- and translate remaining English computer architecture questions to Japanese.

UPDATE quizzes
SET title = mapped.title
FROM (
  VALUES
    ('60000001-0000-0000-0000-000000000001'::uuid, 'CS知識 アルゴリズム Final'),
    ('60000001-0000-0000-0000-000000000002'::uuid, 'CS知識 データ構造 Final'),
    ('60000001-0000-0000-0000-000000000003'::uuid, 'CS知識 情報表現 Final'),
    ('60000001-0000-0000-0000-000000000004'::uuid, 'CS知識 データベース Final'),
    ('60000001-0000-0000-0000-000000000005'::uuid, 'CS知識 ネットワーク Final'),
    ('60000001-0000-0000-0000-000000000006'::uuid, 'CS知識 オペレーティングシステム Final'),
    ('60000001-0000-0000-0000-000000000007'::uuid, 'CS知識 セキュリティ Final'),
    ('60000001-0000-0000-0000-000000000008'::uuid, 'CS知識 情報表現 Check 1'),
    ('60000001-0000-0000-0000-000000000009'::uuid, 'CS知識 情報表現 Check 2'),
    ('60000001-0000-0000-0000-000000000010'::uuid, 'CS知識 コンピュータ構成 Final'),
    ('60000001-0000-0000-0000-000000000011'::uuid, 'CS知識 データ構造 Check 1'),
    ('60000001-0000-0000-0000-000000000012'::uuid, 'CS知識 データ構造 Check 2'),
    ('60000001-0000-0000-0000-000000000013'::uuid, 'CS知識 アルゴリズム Check 1'),
    ('60000001-0000-0000-0000-000000000014'::uuid, 'CS知識 アルゴリズム Check 2'),
    ('60000001-0000-0000-0000-000000000015'::uuid, 'CS知識 コンピュータ構成 Check 1'),
    ('60000001-0000-0000-0000-000000000016'::uuid, 'CS知識 コンピュータ構成 Check 2'),
    ('60000001-0000-0000-0000-000000000017'::uuid, 'CS知識 データベース Check 1'),
    ('60000001-0000-0000-0000-000000000018'::uuid, 'CS知識 データベース Check 2'),
    ('60000001-0000-0000-0000-000000000019'::uuid, 'CS知識 ネットワーク Check 1'),
    ('60000001-0000-0000-0000-000000000020'::uuid, 'CS知識 ネットワーク Check 2'),
    ('60000001-0000-0000-0000-000000000021'::uuid, 'CS知識 オペレーティングシステム Check 1'),
    ('60000001-0000-0000-0000-000000000022'::uuid, 'CS知識 オペレーティングシステム Check 2'),
    ('60000001-0000-0000-0000-000000000023'::uuid, 'CS知識 セキュリティ Check 1'),
    ('60000001-0000-0000-0000-000000000024'::uuid, 'CS知識 セキュリティ Check 2'),
    ('61000001-0000-0000-0000-000000000003'::uuid, 'CS知識 情報表現 Check 1 Source'),
    ('61000001-0000-0000-0000-000000000004'::uuid, 'CS知識 情報表現 Check 2 Source'),
    ('61000001-0000-0000-0000-000000000005'::uuid, 'CS知識 情報表現 Final Source'),
    ('61000001-0000-0000-0000-000000000006'::uuid, 'CS知識 コンピュータ構成 Final Source'),
    ('61000001-0000-0000-0000-000000000011'::uuid, 'CS知識 アルゴリズム Check 1 Source'),
    ('61000001-0000-0000-0000-000000000012'::uuid, 'CS知識 アルゴリズム Check 2 Source'),
    ('61000001-0000-0000-0000-000000000013'::uuid, 'CS知識 アルゴリズム Final Source'),
    ('61000001-0000-0000-0000-000000000014'::uuid, 'CS知識 データ構造 Check 1 Source'),
    ('61000001-0000-0000-0000-000000000015'::uuid, 'CS知識 データ構造 Check 2 Source'),
    ('61000001-0000-0000-0000-000000000016'::uuid, 'CS知識 データ構造 Final Source'),
    ('61000001-0000-0000-0000-000000000017'::uuid, 'CS知識 コンピュータ構成 Check 1 Source'),
    ('61000001-0000-0000-0000-000000000018'::uuid, 'CS知識 コンピュータ構成 Check 2 Source'),
    ('61000001-0000-0000-0000-000000000019'::uuid, 'CS知識 データベース Check 1 Source'),
    ('61000001-0000-0000-0000-000000000020'::uuid, 'CS知識 データベース Check 2 Source'),
    ('61000001-0000-0000-0000-000000000021'::uuid, 'CS知識 データベース Final Source'),
    ('61000001-0000-0000-0000-000000000022'::uuid, 'CS知識 ネットワーク Check 1 Source'),
    ('61000001-0000-0000-0000-000000000023'::uuid, 'CS知識 ネットワーク Check 2 Source'),
    ('61000001-0000-0000-0000-000000000024'::uuid, 'CS知識 ネットワーク Final Source'),
    ('61000001-0000-0000-0000-000000000025'::uuid, 'CS知識 オペレーティングシステム Check 1 Source'),
    ('61000001-0000-0000-0000-000000000026'::uuid, 'CS知識 オペレーティングシステム Check 2 Source'),
    ('61000001-0000-0000-0000-000000000027'::uuid, 'CS知識 オペレーティングシステム Final Source'),
    ('61000001-0000-0000-0000-000000000028'::uuid, 'CS知識 セキュリティ Check 1 Source'),
    ('61000001-0000-0000-0000-000000000029'::uuid, 'CS知識 セキュリティ Check 2 Source'),
    ('61000001-0000-0000-0000-000000000030'::uuid, 'CS知識 セキュリティ Final Source')
) AS mapped(id, title)
WHERE quizzes.id = mapped.id;

DO $$
DECLARE
  rec RECORD;
BEGIN
  FOR rec IN
    SELECT *
    FROM (
      VALUES
        (
          'Which component mainly executes instructions?',
          '命令を主に実行する装置はどれか。',
          'CPUは命令を取り出し、解読し、実行する中心的な装置である。',
          ARRAY['CPU','SSD','ディスプレイ','プリンタ']::text[]
        ),
        (
          'What is the main role of RAM?',
          'RAMの主な役割はどれか。',
          'RAMはCPUがすぐ使う作業中のデータを保持する。',
          ARRAY['実行中の処理に必要なデータを一時的に保持する','インターネット接続を提供する','文字を画像に変換する','すべてのファイルを自動で暗号化する']::text[]
        ),
        (
          'What does cache memory try to reduce?',
          'キャッシュメモリは主に何を減らそうとするか。',
          'キャッシュは平均的なメモリアクセス時間を短くするために使われる。',
          ARRAY['メモリアクセスの遅延','画面の明るさ','ファイル数','LANケーブルの長さ']::text[]
        ),
        (
          'What best describes an interrupt?',
          '割込みを最も適切に説明しているものはどれか。',
          '割込みにより、CPUは常に待ち続けなくても発生したイベントに対応できる。',
          ARRAY['CPUにイベント処理を要求する信号','ファイルを圧縮する方式','データベースのロック方式','ネットワークの経路表']::text[]
        ),
        (
          'Why is secondary storage different from main memory?',
          '補助記憶装置が主記憶装置と異なる点として適切なものはどれか。',
          '補助記憶装置は主記憶より遅いが、電源を切ってもデータを保持できる。',
          ARRAY['電源を切ってもデータを保持できる','常にRAMより容量が小さい','命令を直接実行する','CPUキャッシュを置き換える']::text[]
        ),
        (
          'What is the bus in computer architecture?',
          'コンピュータ構成におけるバスとは何か。',
          'バスは、データ・アドレス・制御信号をやり取りするための共通経路である。',
          ARRAY['データや制御信号をやり取りする共通経路','予備電池','パスワード管理ソフト','表計算ソフトの関数']::text[]
        ),
        (
          'What sequence is most natural for instruction execution?',
          '命令実行の流れとして自然な順序はどれか。',
          'CPUは一般に、命令を取り出し、解読し、実行する。',
          ARRAY['取り出し → 解読 → 実行','保存 → 印刷 → 暗号化','コンパイル → 経路選択 → 保管','解読 → 停止 → 取り出し']::text[]
        ),
        (
          'Which situation most likely causes a cache miss?',
          'キャッシュミスが起こりやすい状況はどれか。',
          '必要なデータがキャッシュ内になく、より遅い層から取り出す必要があるときにキャッシュミスが起こる。',
          ARRAY['必要なデータがキャッシュ内にない','ディスプレイケーブルが抜けている','テーブルに主キーがない','DNS名が解決できない']::text[]
        ),
        (
          'Why are interrupts useful for I/O devices?',
          'I/O装置に対して割込みが有効な理由として適切なものはどれか。',
          '割込みを使うと、装置が処理を必要とするまでCPUは別の仕事を進められる。',
          ARRAY['CPUによる常時監視を減らせる','すべてのプログラムを単一スレッド化する','RAMをSSDに変える','OSを不要にする']::text[]
        ),
        (
          'If an application feels slow only when loading large files, what is a natural first suspect?',
          '大きなファイルを読み込むときだけアプリが遅い場合、まず疑うべきものはどれか。',
          '大きなファイルの読み込み遅延は、補助記憶装置のスループットやメモリ階層のボトルネックを示すことが多い。',
          ARRAY['補助記憶装置またはメモリ階層のボトルネック','キーボード配列の誤り','CSS命名規則の不統一','HTTPメソッドの不一致']::text[]
        ),
        (
          'What is the best interpretation of a bottleneck?',
          'ボトルネックの解釈として最も適切なものはどれか。',
          'ボトルネックとは、全体の処理量を制約している最も遅い部分を指す。',
          ARRAY['システム全体の性能を制約している部分','最もボタン数の多い機能','最も新しい部品','ネットワーク名にだけ影響する不具合']::text[]
        ),
        (
          'What does a higher clock speed suggest most directly?',
          'クロック周波数が高いことから直接読み取れることはどれか。',
          'クロック周波数は1秒あたりの基本周期数を示すが、実際の性能は他の要素にも左右される。',
          ARRAY['1秒あたりの周期数が多いが、総合性能が自動的に高いとは限らない','メモリ容量が無限になる','キャッシュミスが起こらなくなる','すべてのプログラムが1手順で終わる']::text[]
        )
    ) AS t(old_text, new_text, new_explanation, option_texts)
  LOOP
    UPDATE quiz_question_options qqo
    SET option_text = rec.option_texts[qqo.sort_order]
    FROM quiz_questions qq
    WHERE qqo.question_id = qq.id
      AND qq.question_text = rec.old_text
      AND qqo.sort_order BETWEEN 1 AND 4;

    UPDATE quiz_questions
    SET question_text = rec.new_text,
        explanation = rec.new_explanation
    WHERE question_text = rec.old_text;
  END LOOP;
END $$;

WITH cs_questions AS (
  SELECT qq.id, qq.question_text, qq.explanation
  FROM quiz_questions qq
  JOIN quizzes q ON q.id = qq.quiz_id
  WHERE q.quiz_type = 'cs_knowledge'
    AND (
      qq.question_category IS NULL
      OR qq.question_category NOT IN (
        'basic_theory', 'basic_theory_check_1', 'basic_theory_check_2', 'basic_theory_final',
        'data_structure', 'data_structure_check_1', 'data_structure_check_2', 'data_structure_final',
        'algorithm', 'algorithm_check_1', 'algorithm_check_2', 'algorithm_final',
        'computer_architecture', 'computer_architecture_check_1', 'computer_architecture_check_2', 'computer_architecture_final',
        'database', 'database_check_1', 'database_check_2', 'database_final',
        'network', 'network_check_1', 'network_check_2', 'network_final',
        'os', 'os_check_1', 'os_check_2', 'os_final',
        'security', 'security_check_1', 'security_check_2', 'security_final'
      )
    )
),
classified AS (
  SELECT
    id,
    CASE
      WHEN concat_ws(' ', question_text, explanation) ~* '(CPU|RAM|cache|interrupt|bus|clock speed|memory hierarchy|主記憶|補助記憶|命令実行|クロック|キャッシュ|レジスタ)'
        THEN 'computer_architecture'
      WHEN concat_ws(' ', question_text, explanation) ~* '(process|thread|virtual memory|paging|page fault|deadlock|scheduler|context switch|processes|mutex|semaphore|プロセス|スレッド|仮想記憶|ページング|ページフォールト|デッドロック|スケジューリング|文脈切替|コンテキストスイッチ|ファイルシステム|セマフォ|ミューテックス)'
        THEN 'os'
      WHEN concat_ws(' ', question_text, explanation) ~* '(TCP|UDP|IP|DNS|HTTP|router|routing|subnet|packet|OSI|LAN|WAN|ルーティング|パケット|サブネット|ネットワーク層|トランスポート層)'
        THEN 'network'
      WHEN concat_ws(' ', question_text, explanation) ~* '(SQL|transaction|index|normalization|foreign key|primary key|JOIN|schema|ACID|テーブル|主キー|外部キー|正規化|インデックス|トランザクション|スキーマ|クエリ)'
        THEN 'database'
      WHEN concat_ws(' ', question_text, explanation) ~* '(encryption|hash|certificate|authentication|authorization|XSS|CSRF|SQL injection|firewall|脆弱性|暗号|ハッシュ|認証|認可|証明書|ファイアウォール|マルウェア)'
        THEN 'security'
      WHEN concat_ws(' ', question_text, explanation) ~* '(array|list|stack|queue|tree|heap|hash table|linked list|binary tree|配列|リスト|スタック|キュー|木構造|ヒープ|連結リスト|ハッシュ表)'
        THEN 'data_structure'
      WHEN concat_ws(' ', question_text, explanation) ~* '(sort|search|binary search|merge sort|quick sort|DFS|BFS|dynamic programming|greedy|再帰|分割統治|計算量|探索|整列|幅優先|深さ優先|動的計画法|貪欲法)'
        THEN 'algorithm'
      WHEN concat_ws(' ', question_text, explanation) ~* '(binary|bit|hex|ASCII|Unicode|UTF|floating|overflow|論理演算|2進数|ビット|16進数|文字コード|浮動小数点|オーバーフロー|補数)'
        THEN 'basic_theory'
      ELSE NULL
    END AS target_category
  FROM cs_questions
)
UPDATE quiz_questions qq
SET question_category = classified.target_category
FROM classified
WHERE qq.id = classified.id
  AND classified.target_category IS NOT NULL;
