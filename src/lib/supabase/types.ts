export type UserRole = 'mentee' | 'mentor' | 'admin'
export type JlptLevel = 'N5' | 'N4' | 'N3' | 'N2' | 'N1'
export type CodingRank = 'S' | 'A' | 'B' | 'C' | 'D'
export type Difficulty = 'beginner' | 'intermediate' | 'advanced'
export type ProblemDifficulty = 'easy' | 'medium' | 'hard'
export type CodingLanguage = 'java' | 'javascript'

export type CourseCategory =
  | 'jlpt_prep'
  | 'it_japanese'
  | 'core_programming'
  | 'framework'
  | 'algorithm'
  | 'project'
  | 'attitude_culture'

export type ContentType = 'video' | 'text' | 'quiz' | 'coding_exercise' | 'role_play'

export type QuizType =
  | 'jlpt_vocab'
  | 'jlpt_grammar'
  | 'jlpt_reading'
  | 'jlpt_listening'
  | 'jlpt_kanji'
  | 'it_terminology'
  | 'role_play_scenario'
  | 'attitude_culture'
  | 'core_programming'
  | 'framework'
  | 'sentence_pattern'
  | 'business_expression'
  | 'keigo'
  | 'cs_knowledge'

export type SubmissionStatus =
  | 'pending'
  | 'running'
  | 'accepted'
  | 'wrong_answer'
  | 'time_limit'
  | 'memory_limit'
  | 'runtime_error'
  | 'compile_error'

export type TaskAssignmentStatus = 'pending' | 'in_progress' | 'completed' | 'overdue'

export type GrammarCategory =
  | 'permission' | 'obligation' | 'desire' | 'ability' | 'condition'
  | 'reason' | 'contrast' | 'conjecture' | 'change' | 'degree'
  | 'time' | 'manner' | 'listing' | 'emphasis' | 'formal'

export interface JlptGrammar {
  id: string
  pattern: string
  meaning_ko: string
  meaning_ja: string
  jlpt_level: JlptLevel
  formation: string
  formation_detail: string | null
  category: GrammarCategory | null
  example_sentences: { ja: string; ko: string; highlight: string }[]
  related_patterns: string[] | null
  common_mistakes: string | null
  usage_notes: string | null
  sort_order: number
  created_at: string
}

export type ReadingPassageType = 'notice' | 'email' | 'article' | 'advertisement' | 'instruction' | 'essay' | 'letter' | 'report'
export type ListeningScriptType = 'dialogue' | 'monologue' | 'announcement' | 'instruction' | 'meeting' | 'phone_call'

export interface JlptReadingPassage {
  id: string
  title: string
  passage: string
  passage_type: ReadingPassageType
  jlpt_level: JlptLevel
  word_count: number
  topic: string | null
  vocabulary_notes: { word: string; reading: string; meaning_ko: string }[]
  grammar_notes: string[] | null
  translation_ko: string | null
  comprehension: { question: string; options: string[]; answer: number } | null
  sort_order: number
  created_at: string
}

export interface JlptListeningScript {
  id: string
  title: string
  script: string
  script_type: ListeningScriptType
  jlpt_level: JlptLevel
  speakers: string[] | null
  situation: string | null
  vocabulary_notes: { word: string; reading: string; meaning_ko: string }[]
  translation_ko: string | null
  comprehension: { question: string; options: string[]; answer: number } | null
  sort_order: number
  created_at: string
}

export type AccessRequestStatus = 'pending' | 'approved' | 'denied'

export type NotificationType = 'task_assigned' | 'exam_requested' | 'exam_approved' | 'exam_denied' | 'exam_completed' | 'retake_requested' | 'feedback_received' | 'feedback_reply' | 'assignment_completed' | 'assignment_confirmed' | 'assignment_overdue' | 'assignment_reassigned' | 'assignment_cancelled' | 'vocab_submitted' | 'vocab_approved' | 'vocab_rejected' | 'study_pattern_alert' | 'monthly_overdue_alert' | 'progress_low_alert' | 'mock_not_taken_alert'
export type LearningAssignmentStatus = 'pending' | 'in_progress' | 'awaiting_confirmation' | 'completed' | 'overdue'
export type ComprehensiveExamStatus = 'requested' | 'approved' | 'denied' | 'in_progress' | 'completed' | 'failed'

export interface Notification {
  id: string
  user_id: string
  type: NotificationType
  title: string
  message: string | null
  link: string | null
  is_read: boolean
  related_id: string | null
  created_at: string
}

export interface LearningAssignment {
  id: string
  assigned_by: string
  assigned_to: string
  category: string
  subcategory: string
  content_level: string | null
  title: string
  description: string | null
  due_date: string | null
  status: LearningAssignmentStatus
  required_quiz_ids: string[]
  passed_quiz_ids: string[]
  created_at: string
  completed_at: string | null
  confirmed_by: string | null
  confirmed_at: string | null
  overdue_reason: string | null
  overdue_reason_at: string | null
}

export interface ComprehensiveExam {
  id: string
  user_id: string
  category: string
  subcategory: string
  content_level: string | null
  status: ComprehensiveExamStatus
  requested_at: string
  approved_at: string | null
  approved_by: string | null
  started_at: string | null
  completed_at: string | null
  time_limit_minutes: number
  total_questions: number
  score: number | null
  passed: boolean | null
  passing_score: number
}

export interface MentorMenteeAssignment {
  id: string
  mentor_id: string
  mentee_id: string
  assigned_by: string
  created_at: string
}

export type MentorSpecialty = 'japanese' | 'technical'

export interface Profile {
  id: string
  email: string
  full_name: string | null
  avatar_url: string | null
  role: UserRole
  mentor_specialty: MentorSpecialty | null
  jlpt_level: JlptLevel | null
  years_of_experience: number
  target_dispatch_date: string | null
  bio: string | null
  target_jlpt_level: JlptLevel | null
  target_coding_area: CodingLanguage | null
  it_certifications: string | null
  coding_rank: CodingRank
  is_onboarded: boolean
  is_japanese: boolean
  onboarding_step: number
  created_at: string
  updated_at: string
}

export interface JapaneseSkills {
  id: string
  user_id: string
  jlpt_level: JlptLevel | null
  vocab_mastery: number
  grammar_mastery: number
  reading_mastery: number
  listening_mastery: number
  jlpt_normalized: number
  it_terminology_score: number
  doc_reading_score: number
  business_conv_score: number
  it_japanese_normalized: number
  updated_at: string
}

export interface CodingSkills {
  id: string
  user_id: string
  java_score: number
  javascript_score: number
  sql_score: number
  algorithm_score: number
  core_normalized: number
  spring_boot_score: number
  react_score: number
  db_design_score: number
  project_score: number
  framework_normalized: number
  updated_at: string
}

export interface AttitudeCultureSkills {
  id: string
  user_id: string
  punctuality_score: number
  horenso_score: number
  teamwork_score: number
  business_manner_score: number
  business_culture_score: number
  it_security_score: number
  attitude_normalized: number
  updated_at: string
}

export interface DispatchReadinessScore {
  id: string
  user_id: string
  jlpt_score: number | null
  it_japanese_score: number | null
  core_programming_score: number
  framework_score: number
  attitude_culture_score: number
  overall_score: number | null
  is_japanese: boolean
  recorded_at: string
}

export interface Course {
  id: string
  title: string
  description: string | null
  category: CourseCategory
  thumbnail_url: string | null
  instructor_id: string | null
  difficulty: Difficulty
  is_published: boolean
  sort_order: number
  created_at: string
  updated_at: string
}

export interface Lesson {
  id: string
  course_id: string
  title: string
  content_type: ContentType
  content_url: string | null
  content_body: string | null
  duration_minutes: number | null
  sort_order: number
  is_free_preview: boolean
  created_at: string
  updated_at: string
}

export interface CodingProblem {
  id: string
  lesson_id: string | null
  title: string
  description: string
  difficulty: ProblemDifficulty
  language: CodingLanguage
  starter_code: string | null
  solution_code: string | null
  time_limit_ms: number
  memory_limit_mb: number
  created_at: string
}

export interface CodingSkillExam {
  id: string
  title: string
  target_rank: CodingRank
  language: CodingLanguage
  description: string | null
  time_limit_minutes: number
  passing_score: number
  is_published: boolean
  sort_order: number
  created_at: string
  updated_at: string
}

export interface RankingSeason {
  id: string
  name: string
  start_date: string
  end_date: string
  is_active: boolean
  created_at: string
}

export interface UserRanking {
  id: string
  season_id: string
  user_id: string
  overall_score: number
  jlpt_score: number
  coding_score: number
  attitude_score: number
  coding_rank: CodingRank
  overall_rank: number | null
  jlpt_rank: number | null
  coding_rank_position: number | null
  attitude_rank: number | null
  recorded_at: string
}

export interface TaskAssignment {
  id: string
  assigned_by: string
  assigned_to: string
  target_type: 'quiz' | 'coding_problem' | 'coding_exam' | 'project'
  target_id: string
  title: string | null
  description: string | null
  due_date: string | null
  status: TaskAssignmentStatus
  created_at: string
  completed_at: string | null
}

/**
 * Helper for typing Supabase queries that include foreign-table joins.
 *
 * Supabase's generated types don't propagate `.select('a, foreign_table(b)')`
 * shape inference reliably, so call sites typically need a manual structural
 * type. Use `Joined<T>` instead of `as unknown as T` to make intent explicit.
 *
 * Example:
 *   const { data } = await supabase
 *     .from('quiz_attempts')
 *     .select('id, quizzes(quiz_type)')
 *   const rows = data as Joined<{ id: string; quizzes: { quiz_type: string } | null }>[]
 */
export type Joined<T> = T

/**
 * Single row variant — equivalent to `Joined<T>` but reads naturally for
 * `.single()` / `.maybeSingle()` query results.
 */
export type JoinedRow<T> = T
