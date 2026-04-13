export type BackupGroup = 'user' | 'step1' | 'step2' | 'step3' | 'step4' | 'step5' | 'common'

export interface TableConfig {
  label: string
  columns: string
  group: BackupGroup
}

export interface ExportTableInfo {
  key: string
  label: string
  group: BackupGroup
}

export const TABLE_CONFIGS: Record<string, TableConfig> = {
  // ── ユーザー情報 ──
  profiles: {
    label: 'ユーザー',
    columns: 'id, email, full_name, role, mentor_specialty, created_at, updated_at',
    group: 'user',
  },
  comprehensive_exams: {
    label: '総合試験結果',
    columns: 'id, user_id, category, subcategory, content_level, status, score, passed, passing_score, total_questions, started_at, completed_at',
    group: 'user',
  },
  quiz_attempts: {
    label: '理解度テスト結果',
    columns: 'id, user_id, quiz_id, score, passed, started_at, completed_at',
    group: 'user',
  },
  dispatch_readiness_scores: {
    label: '5軸スコア',
    columns: 'id, user_id, jlpt_score, it_japanese_score, core_programming_score, framework_score, attitude_culture_score, overall_score, recorded_at',
    group: 'user',
  },
  japanese_skills: {
    label: '日本語スキル',
    columns: 'id, user_id, jlpt_level, vocab_mastery, grammar_mastery, reading_mastery, listening_mastery, jlpt_normalized, it_terminology_score, doc_reading_score, business_conv_score, it_japanese_normalized, updated_at',
    group: 'user',
  },
  coding_skills: {
    label: 'コーディングスキル',
    columns: 'id, user_id, java_score, javascript_score, sql_score, algorithm_score, core_normalized, spring_boot_score, react_score, db_design_score, project_score, framework_normalized, updated_at',
    group: 'user',
  },
  attitude_culture_skills: {
    label: '態度・文化スキル',
    columns: 'id, user_id, punctuality_score, horenso_score, teamwork_score, business_manner_score, attitude_normalized, updated_at',
    group: 'user',
  },
  user_rankings: {
    label: 'ランキング',
    columns: 'id, season_id, user_id, overall_score, jlpt_score, coding_score, attitude_score, coding_rank, overall_rank, jlpt_rank, coding_rank_position, attitude_rank, recorded_at',
    group: 'user',
  },
  coding_exam_attempts: {
    label: 'コーディング試験',
    columns: 'id, user_id, exam_id, score, passed, achieved_rank, started_at, completed_at',
    group: 'user',
  },
  learning_assignments: {
    label: '学習課題',
    columns: 'id, assigned_by, assigned_to, category, subcategory, content_level, title, description, status, due_date, created_at',
    group: 'user',
  },
  task_assignments: {
    label: '課題配信',
    columns: 'id, assigned_by, assigned_to, target_type, target_id, title, description, status, due_date, created_at',
    group: 'user',
  },
  admin_feedbacks: {
    label: 'フィードバック',
    columns: 'id, admin_id, user_id, category, content, created_at',
    group: 'user',
  },

  // ── 生活日本語 コンテンツ ──
  jlpt_vocabulary: {
    label: 'JLPT語彙',
    columns: 'id, word, reading, meaning_ko, jlpt_level, part_of_speech, example_sentence, created_at',
    group: 'step1',
  },
  jlpt_grammar: {
    label: 'JLPT文法',
    columns: 'id, pattern, meaning_ko, meaning_ja, jlpt_level, formation, category, sort_order, created_at',
    group: 'step1',
  },
  jlpt_reading_passages: {
    label: 'JLPT読解',
    columns: 'id, title, passage, passage_type, jlpt_level, word_count, topic, translation_ko, sort_order, created_at',
    group: 'step1',
  },
  jlpt_listening_scripts: {
    label: 'JLPT聴解',
    columns: 'id, title, script, script_type, jlpt_level, speakers, situation, translation_ko, sort_order, created_at',
    group: 'step1',
  },

  // ── ビジネス日本語 コンテンツ ──
  it_glossary: {
    label: 'IT用語集',
    columns: 'id, term_ja, reading, term_ko, term_en, category, description, example_sentence, created_at',
    group: 'step2',
  },
  // ── CS知識 コンテンツ ──
  cs_terms: {
    label: 'CS用語',
    columns: 'id, term_ja, reading, term_ko, term_en, category, difficulty_level, description, sort_order, created_at',
    group: 'step3',
  },

}

/** Course categories per axis for filtered course/lesson export */
export const COURSE_CATEGORY_GROUPS: Record<string, { group: BackupGroup; categories: string[] }> = {
  step1: { group: 'step1', categories: ['jlpt_prep'] },
  step2: { group: 'step2', categories: ['it_japanese'] },
  step3: { group: 'step3', categories: ['core_programming', 'algorithm'] },
  step4: { group: 'step4', categories: ['framework', 'project'] },
  step5: { group: 'step5', categories: ['attitude_culture'] },
}

export const QUIZ_TYPE_GROUPS: Record<string, { label: string; group: BackupGroup; quizTypes: string[] }> = {
  step1: { label: '生活日本語', group: 'step1', quizTypes: ['jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji'] },
  step2: { label: 'ビジネス日本語', group: 'step2', quizTypes: ['it_terminology', 'sentence_pattern', 'business_expression', 'keigo'] },
  step3: { label: 'CS知識', group: 'step3', quizTypes: ['cs_knowledge'] },
  step4: { label: '開発実務', group: 'step4', quizTypes: ['core_programming', 'framework'] },
  step5: { label: 'ビジネスリテラシー', group: 'step5', quizTypes: ['attitude_culture'] },
}

export const GROUP_LABELS: Record<BackupGroup, string> = {
  user: 'ユーザー情報',
  step1: '生活日本語',
  step2: 'ビジネス日本語',
  step3: 'CS知識',
  step4: '開発実務',
  step5: 'ビジネスリテラシー',
  common: '共通',
}

export const GROUP_FOLDER_NAMES: Record<BackupGroup, string> = {
  user: 'user',
  step1: 'step1_seikatsu',
  step2: 'step2_business_jp',
  step3: 'step3_cs',
  step4: 'step4_dev',
  step5: 'step5_business_lit',
  common: 'common',
}

export const GROUP_ORDER: BackupGroup[] = ['user', 'step1', 'step2', 'step3', 'step4', 'step5']

export interface ExportGroupInfo {
  tables: ExportTableInfo[]
  hasQuizExport: boolean
  hasCourseExport: boolean
}

export function getExportGroups(): Record<BackupGroup, ExportGroupInfo> {
  const result: Record<BackupGroup, ExportGroupInfo> = {
    user: { tables: [], hasQuizExport: false, hasCourseExport: false },
    step1: { tables: [], hasQuizExport: true, hasCourseExport: true },
    step2: { tables: [], hasQuizExport: true, hasCourseExport: true },
    step3: { tables: [], hasQuizExport: true, hasCourseExport: true },
    step4: { tables: [], hasQuizExport: true, hasCourseExport: true },
    step5: { tables: [], hasQuizExport: true, hasCourseExport: true },
    common: { tables: [], hasQuizExport: false, hasCourseExport: false },
  }

  for (const [key, cfg] of Object.entries(TABLE_CONFIGS)) {
    result[cfg.group].tables.push({ key, label: cfg.label, group: cfg.group })
  }

  return result
}
