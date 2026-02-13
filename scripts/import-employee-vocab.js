/**
 * import-employee-vocab.js
 *
 * Reads the CSV file at data/WEAVUS_japanese.csv and generates SQL seed files
 * for the J-Bridge LMS jlpt_vocabulary and it_glossary tables.
 *
 * Usage: node scripts/import-employee-vocab.js
 *
 * No external dependencies required - uses only Node.js built-in modules.
 */

const fs = require('fs');
const path = require('path');

// ---------------------------------------------------------------------------
// Configuration
// ---------------------------------------------------------------------------

const CSV_PATH = path.join(__dirname, '..', 'data', 'WEAVUS_japanese.csv');
const OUTPUT_JLPT_PATH = path.join(__dirname, '..', 'supabase', 'seed_employee_vocabulary.sql');

// Existing it_glossary terms (166 terms already seeded) - used to detect duplicates
const existingItGlossary = [
  '設計書', '稼働', '権限', '検収', '派遣', '常駐', '仕様変更', '要件定義',
  'ER図', '基本設計', '詳細設計', 'テーブル定義書', 'バグ', '不具合', 'デバッグ',
  'リリース', 'ステークホルダー', 'スケジュール', 'リスク管理', 'ビルド',
  'API', 'フレームワーク', 'ライブラリ', 'ソースコード', 'テスト環境',
  'バージョン管理', 'ブランチ', 'マージ', 'コミット', 'リファクタリング',
  'CI/CD', 'コンパイル', '例外処理', 'ログ', '環境変数', 'パッケージ',
  '依存関係', 'モジュール', 'テンプレート', 'アーキテクチャ', 'インターフェース',
  '実装', 'スニペット', '単体テスト', '回帰テスト', '受入テスト', '負荷テスト',
  'テストケース', '障害', 'モック', 'スタブ', 'カバレッジ', 'テスト自動化',
  '品質保証', 'テスト計画', '期待値', '実測値', 'リグレッション', '再現手順',
  '画面設計書', 'フローチャート', 'シーケンス図', 'クラス図', 'ユースケース図',
  '状態遷移図', '機能仕様書', '非機能要件', 'データベース設計', 'API仕様書',
  '画面遷移図', 'ワイヤーフレーム', 'プロトタイプ', 'コンポーネント図',
  'システム構成図', 'ネットワーク構成図', 'インフラ設計書', '外部設計',
  '内部設計', '共通設計', 'コーディング規約', '命名規則', 'レビュー指摘',
  '設計変更', 'クラウド', 'オンプレミス', 'ロードバランサー', 'ファイアウォール',
  'DNS', 'SSL証明書', 'VPN', 'Docker', 'コンテナ', '仮想マシン', 'ストレージ',
  'バックアップ', '冗長化', '可用性', 'スケーラビリティ', 'モニタリング',
  'ログ管理', 'CDN', 'プロキシ', 'リバースプロキシ', 'SSH', 'ネットワーク',
  'IPアドレス', 'ポート番号', 'OS', 'パッチ', 'セキュリティ', 'データセンター',
  'スプリント', 'バックログ', 'カンバン', 'マイルストーン', '工数', '見積もり',
  'WBS', 'ガントチャート', 'スクラム', 'アジャイル', 'ウォーターフォール',
  'レトロスペクティブ', 'デイリースタンドアップ', 'プロダクトオーナー',
  'スクラムマスター', '課題管理', '変更管理', '品質管理', 'テスト計画書',
  '要員計画', 'レビュー会', '定例会議', '成果物', '受入基準', 'KPI',
  '見積書', '請求書', '契約書', 'SES', '案件', '単価', '勤怠',
  '有給休暇', '残業', '出張', '名刺交換', '敬語', 'お辞儀', '席順',
  'ビジネスメール', '電話応対', 'クライアント', 'ベンダー', '発注', '受注',
  '仕様変更', '追加開発', '保守運用', 'ヘルプデスク', 'SLA',
  'バグ票', '基本設計', '詳細設計'
];

const existingItGlossarySet = new Set(existingItGlossary);

// Categories from CSV that map to potential it_glossary entries
const IT_GLOSSARY_CATEGORIES = new Set([
  '面接練習', '面接', '模擬面接', 'スキルシート', '画面設計書', 'プロジェクト'
]);

// Categories from CSV that map to jlpt_vocabulary entries
const JLPT_CATEGORIES = new Set([
  '書き取り', '読解', 'ニュース', '日常', '日常生活', '問題集'
]);

// Categories that are business expressions (skip - handled separately)
const BUSINESS_EXPRESSION_CATEGORIES = new Set([
  '先生', 'ChatGPT'
]);

// Categories that need content-based classification
const CLASSIFY_BY_CONTENT_CATEGORIES = new Set([
  '勉強', '講義', '自習', '会話', 'ドラマ', '歌', 'Youtube'
]);

// ---------------------------------------------------------------------------
// CSV Parser (handles quoted fields with embedded newlines and commas)
// ---------------------------------------------------------------------------

/**
 * Parse a CSV string into an array of row arrays.
 * Handles: quoted fields, embedded newlines within quotes, embedded commas.
 */
function parseCSV(text) {
  const rows = [];
  let currentRow = [];
  let currentField = '';
  let inQuotes = false;
  let i = 0;

  while (i < text.length) {
    const ch = text[i];

    if (inQuotes) {
      if (ch === '"') {
        // Check for escaped quote ""
        if (i + 1 < text.length && text[i + 1] === '"') {
          currentField += '"';
          i += 2;
          continue;
        }
        // End of quoted field
        inQuotes = false;
        i++;
        continue;
      }
      currentField += ch;
      i++;
    } else {
      if (ch === '"') {
        inQuotes = true;
        i++;
      } else if (ch === ',') {
        currentRow.push(currentField);
        currentField = '';
        i++;
      } else if (ch === '\n' || ch === '\r') {
        currentRow.push(currentField);
        currentField = '';
        rows.push(currentRow);
        currentRow = [];
        // Handle \r\n
        if (ch === '\r' && i + 1 < text.length && text[i + 1] === '\n') {
          i += 2;
        } else {
          i++;
        }
      } else {
        currentField += ch;
        i++;
      }
    }
  }

  // Push last field/row
  if (currentField || currentRow.length > 0) {
    currentRow.push(currentField);
    rows.push(currentRow);
  }

  return rows;
}

// ---------------------------------------------------------------------------
// Helper functions
// ---------------------------------------------------------------------------

/**
 * Escape a string for use in SQL single-quoted values.
 */
function sqlEscape(str) {
  if (!str) return '';
  return str.replace(/'/g, "''");
}

/**
 * Extract the Korean meaning from a meaning field.
 * Some entries have format "한국어・中国語" or "한국어 / 日本語説明".
 * We try to extract just the Korean portion.
 */
function extractKoreanMeaning(meaning) {
  if (!meaning) return '';

  let cleaned = meaning.trim();

  // Remove trailing/leading whitespace from each line, collapse multi-line to single
  cleaned = cleaned.split('\n').map(l => l.trim()).filter(l => l.length > 0).join(' ');

  // If contains ・ followed by Chinese characters (中国語 pattern), take the part before ・
  // Pattern: Korean・Chinese (e.g., "설계서・设计书")
  const chineseSeparator = cleaned.match(/^([^・]+)・[\u4e00-\u9fff]/);
  if (chineseSeparator) {
    cleaned = chineseSeparator[1].trim();
  }

  return cleaned;
}

/**
 * Determine if a word/meaning is IT-related for content-based classification.
 */
function isITRelated(word, meaning) {
  const combined = (word || '') + (meaning || '');
  const itKeywords = [
    'システム', 'サーバー', 'データ', 'プログラム', 'コード', '開発',
    '実装', '設計', 'テスト', 'デプロイ', 'API', 'DB', 'SQL',
    'ネットワーク', 'セキュリティ', 'インフラ', 'クラウド', 'フレームワーク',
    'ミドルウェア', '入出力', '疎結合', 'バリデーション', 'ページネーション',
    'エラー', 'バグ', '不具合', '障害', 'リリース', 'デバッグ',
    'ソフトウェア', 'ハードウェア', 'アプリ', 'ブラウザ',
    '仕様', '要件', '画面', '機能', '変数', 'モジュール',
    '환경설정', '프론트', '백엔드', '디버그', '로직',
    '구축', '배포', '검증', '운영', '서버'
  ];
  return itKeywords.some(kw => combined.includes(kw));
}

/**
 * Auto-assign an it_glossary category based on the term content.
 */
function assignItCategory(word, meaning) {
  const combined = (word || '') + (meaning || '');

  if (/設計|仕様|画面|要件|定義書|ワイヤー|プロトタイプ|遷移/.test(combined)) {
    return 'design_doc';
  }
  if (/テスト|品質|障害|バグ|不具合|検証|正常系|異常系|例外系|境界値|カバレッジ/.test(combined)) {
    return 'testing';
  }
  if (/プロジェクト|進捗|工数|管理|スケジュール|マイルストーン|WBS|課題|推進/.test(combined)) {
    return 'project_management';
  }
  if (/契約|派遣|面接|顧客|売上|ビジネス|発注|受注|納期|単価|SES|請求|見積|案件|クライアント|ベンダー|スキルシート|経歴|参画/.test(combined)) {
    return 'business';
  }
  if (/サーバー|セキュリティ|ネットワーク|インフラ|DNS|SSL|VPN|Docker|コンテナ|ストレージ|バックアップ|監視|復旧|冗長|可用性|ロードバランサー/.test(combined)) {
    return 'infrastructure';
  }

  return 'development';
}

/**
 * Determine JLPT level heuristic.
 * N1 for more difficult/rare terms, N2 for most.
 */
function assignJlptLevel(word, meaning) {
  // N1 indicators: rare kanji, literary expressions, 4+ character compounds
  const n1Patterns = [
    /未来永劫/, /俯瞰/, /醸す/, /覆す/, /斡旋/, /仇桜/, /絵空事/,
    /至難/, /銘ずる/, /汎用/, /網羅/, /極論/, /逸材/, /巨匠/,
    /朗らか/, /煙たがる/, /紛れる/, /紛らす/, /妨げる/, /遮る/,
    /色濃い/, /浮き彫り/, /目論む/, /画期的/
  ];

  if (n1Patterns.some(p => p.test(word || ''))) {
    return 'N1';
  }

  return 'N2';
}

/**
 * Determine a basic part_of_speech from the word.
 */
function guessPOS(word) {
  if (!word) return null;

  // Sentences (contain particles or end with verb/desu forms)
  if (word.includes('ください') || word.includes('ます') ||
      word.includes('ました') || word.includes('です') ||
      word.includes('でしょうか') || word.length > 15) {
    return '표현';
  }

  // Suru-verbs
  if (word.endsWith('する') || word.endsWith('させる')) {
    return '동사';
  }

  // Verbs (u-ending)
  if (/[うくすつぬぶむるぐ]$/.test(word)) {
    return '동사';
  }

  // I-adjectives
  if (/[いしくき]$/.test(word) && word.length >= 2) {
    // Check more specific patterns
    if (word.endsWith('しい') || word.endsWith('い') && !/[ましかきくぎ]い$/.test(word)) {
      // Might be adjective, but too ambiguous
    }
  }

  // Na-adjectives
  if (word.endsWith('的') || word.endsWith('的な')) {
    return 'な형용사';
  }

  // Default: noun
  return '명사';
}

// ---------------------------------------------------------------------------
// Main processing
// ---------------------------------------------------------------------------

function main() {
  console.log('=== Employee Vocabulary Import Script ===\n');

  // 1. Read CSV
  if (!fs.existsSync(CSV_PATH)) {
    console.error(`ERROR: CSV file not found at ${CSV_PATH}`);
    process.exit(1);
  }

  const rawCSV = fs.readFileSync(CSV_PATH, 'utf-8');
  const rows = parseCSV(rawCSV);
  console.log(`Total CSV rows parsed: ${rows.length}`);

  // 2. Process rows
  const stats = {
    totalRows: rows.length,
    skippedDuplicate: 0,
    skippedEmpty: 0,
    skippedHeader: 0,
    skippedBusinessExpression: 0,
    skippedExistingItGlossary: 0,
    skippedInternalDuplicate: 0,
    jlptVocab: [],
    itGlossary: [],
    itGlossaryNew: [],
    businessExpressions: [],
  };

  // Track seen words for internal dedup
  const seenWords = new Set();

  for (let i = 0; i < rows.length; i++) {
    const row = rows[i];

    // Need at least 3 columns (col[0], col[1], col[2])
    if (row.length < 3) {
      stats.skippedEmpty++;
      continue;
    }

    const col0 = (row[0] || '').trim();  // empty or "重複削除"
    const col1 = (row[1] || '').trim();  // number
    const col2 = (row[2] || '').trim();  // word
    const col3 = (row[3] || '').trim();  // reading
    const col4 = (row[4] || '').trim();  // meaning
    const col5 = (row[5] || '').trim();  // category
    const col6 = (row[6] || '').trim();  // date
    const col7 = (row[7] || '').trim();  // recorder

    // Skip header rows
    if (col1 === '番号' || col2 === '単語・文' || col0 === '※一日一人3個以上' || col1 === '※一日一人3個以上') {
      stats.skippedHeader++;
      continue;
    }

    // Skip rows where first column is "重複削除"
    if (col0 === '重複削除') {
      stats.skippedDuplicate++;
      continue;
    }

    // Skip rows where word column is empty
    if (!col2) {
      stats.skippedEmpty++;
      continue;
    }

    // Skip internal duplicates (same word appearing multiple times - keep first)
    if (seenWords.has(col2)) {
      stats.skippedInternalDuplicate++;
      continue;
    }
    seenWords.add(col2);

    // Extract Korean meaning
    const koreanMeaning = extractKoreanMeaning(col4);

    // Build entry object
    const entry = {
      word: col2,
      reading: col3,
      meaning: koreanMeaning || col4, // fallback to raw meaning if Korean extraction yields empty
      category: col5,
      date: col6,
      recorder: col7,
    };

    // 3. Categorize by CSV category field
    if (BUSINESS_EXPRESSION_CATEGORIES.has(col5)) {
      stats.skippedBusinessExpression++;
      stats.businessExpressions.push(entry);
      continue;
    }

    if (IT_GLOSSARY_CATEGORIES.has(col5)) {
      // Check if already exists in it_glossary
      if (existingItGlossarySet.has(col2)) {
        stats.skippedExistingItGlossary++;
        continue;
      }
      // New IT glossary term
      entry.itCategory = assignItCategory(col2, col4);
      stats.itGlossary.push(entry);
      stats.itGlossaryNew.push(entry);
      continue;
    }

    if (JLPT_CATEGORIES.has(col5)) {
      stats.jlptVocab.push(entry);
      continue;
    }

    if (CLASSIFY_BY_CONTENT_CATEGORIES.has(col5)) {
      // Classify by content
      if (isITRelated(col2, col4)) {
        if (existingItGlossarySet.has(col2)) {
          stats.skippedExistingItGlossary++;
          continue;
        }
        entry.itCategory = assignItCategory(col2, col4);
        stats.itGlossary.push(entry);
        stats.itGlossaryNew.push(entry);
      } else {
        stats.jlptVocab.push(entry);
      }
      continue;
    }

    // No category or unknown category - treat as JLPT if it has content
    if (col5 === '' || !col5) {
      // No category - classify by content
      if (isITRelated(col2, col4)) {
        if (existingItGlossarySet.has(col2)) {
          stats.skippedExistingItGlossary++;
          continue;
        }
        entry.itCategory = assignItCategory(col2, col4);
        stats.itGlossary.push(entry);
        stats.itGlossaryNew.push(entry);
      } else {
        stats.jlptVocab.push(entry);
      }
      continue;
    }

    // Fallback: unknown category, treat as JLPT
    stats.jlptVocab.push(entry);
  }

  // 4. Generate SQL output files

  // --- JLPT vocabulary seed ---
  let jlptSQL = '';
  jlptSQL += '-- ============================================\n';
  jlptSQL += '-- Employee Vocabulary - JLPT Vocabulary Seed Data\n';
  jlptSQL += `-- Generated from WEAVUS_japanese.csv (${stats.jlptVocab.length} terms)\n`;
  jlptSQL += `-- Generated at: ${new Date().toISOString()}\n`;
  jlptSQL += '-- ============================================\n\n';

  if (stats.jlptVocab.length > 0) {
    jlptSQL += 'INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence) VALUES\n';

    const jlptValues = stats.jlptVocab.map((entry, idx) => {
      const level = assignJlptLevel(entry.word, entry.meaning);
      const pos = guessPOS(entry.word);
      const reading = entry.reading || '';
      const meaning = entry.meaning || '';
      const posStr = pos ? `'${sqlEscape(pos)}'` : 'NULL';
      const comma = idx < stats.jlptVocab.length - 1 ? ',' : ';';

      return `  ('${sqlEscape(entry.word)}', '${sqlEscape(reading)}', '${sqlEscape(meaning)}', '${level}', ${posStr}, NULL)${comma}`;
    });

    jlptSQL += jlptValues.join('\n') + '\n';
  }

  // Also append IT glossary new terms as a comment block for reference
  if (stats.itGlossaryNew.length > 0) {
    jlptSQL += '\n-- ============================================\n';
    jlptSQL += '-- New IT Glossary Terms (for it_glossary table)\n';
    jlptSQL += `-- ${stats.itGlossaryNew.length} new terms not in existing seed\n`;
    jlptSQL += '-- ============================================\n\n';

    jlptSQL += 'INSERT INTO it_glossary (term_ja, reading, term_ko, category, description, example_sentence) VALUES\n';

    const itValues = stats.itGlossaryNew.map((entry, idx) => {
      const reading = entry.reading || '';
      const meaning = entry.meaning || '';
      const readingStr = reading ? `'${sqlEscape(reading)}'` : 'NULL';
      const comma = idx < stats.itGlossaryNew.length - 1 ? ',' : ';';

      return `  ('${sqlEscape(entry.word)}', ${readingStr}, '${sqlEscape(meaning)}', '${entry.itCategory}', NULL, NULL)${comma}`;
    });

    jlptSQL += itValues.join('\n') + '\n';
  }

  // Write output
  fs.writeFileSync(OUTPUT_JLPT_PATH, jlptSQL, 'utf-8');
  console.log(`\nOutput written to: ${OUTPUT_JLPT_PATH}`);

  // 5. Print statistics
  console.log('\n=== Import Statistics ===\n');
  console.log(`Total CSV rows parsed:            ${stats.totalRows}`);
  console.log(`Skipped - header rows:            ${stats.skippedHeader}`);
  console.log(`Skipped - "重複削除" marked:       ${stats.skippedDuplicate}`);
  console.log(`Skipped - empty word:             ${stats.skippedEmpty}`);
  console.log(`Skipped - internal duplicates:    ${stats.skippedInternalDuplicate}`);
  console.log(`Skipped - existing IT glossary:   ${stats.skippedExistingItGlossary}`);
  console.log(`Skipped - business expressions:   ${stats.skippedBusinessExpression} (先生/ChatGPT)`);
  console.log('');
  console.log(`JLPT vocabulary entries:          ${stats.jlptVocab.length}`);
  console.log(`IT glossary entries (new):        ${stats.itGlossaryNew.length}`);
  console.log(`Business expressions (skipped):   ${stats.businessExpressions.length}`);
  console.log('');
  console.log(`Total output entries:             ${stats.jlptVocab.length + stats.itGlossaryNew.length}`);

  // Category breakdown for IT glossary
  if (stats.itGlossaryNew.length > 0) {
    console.log('\n--- IT Glossary Category Breakdown ---');
    const catCounts = {};
    stats.itGlossaryNew.forEach(e => {
      catCounts[e.itCategory] = (catCounts[e.itCategory] || 0) + 1;
    });
    Object.entries(catCounts).sort((a, b) => b[1] - a[1]).forEach(([cat, count]) => {
      console.log(`  ${cat}: ${count}`);
    });
  }

  // JLPT level breakdown
  if (stats.jlptVocab.length > 0) {
    console.log('\n--- JLPT Level Breakdown ---');
    const levelCounts = { N1: 0, N2: 0 };
    stats.jlptVocab.forEach(e => {
      const level = assignJlptLevel(e.word, e.meaning);
      levelCounts[level] = (levelCounts[level] || 0) + 1;
    });
    Object.entries(levelCounts).sort().forEach(([level, count]) => {
      console.log(`  ${level}: ${count}`);
    });
  }

  // Business expressions list (for reference)
  if (stats.businessExpressions.length > 0) {
    console.log('\n--- Skipped Business Expressions (先生/ChatGPT) ---');
    stats.businessExpressions.forEach(e => {
      console.log(`  ${e.word} (${e.category})`);
    });
  }

  console.log('\nDone.');
}

main();
