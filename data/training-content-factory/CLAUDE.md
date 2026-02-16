# Claude Code Rules (Content Factory)

You are generating internal training content.

## Output language & format
- Explanations: Japanese (日本語)
- Code: English identifiers, Java conventions
- Java target: 17
- Spring Boot target: 3.x
- Keep each lesson concise: roughly 800–1400 words in Japanese.

## Lesson output contract
For a lesson `<LESSON_ID>` you MUST generate exactly these files:
1) `content/<track>/modules/<MODULE_ID>/lessons/<LESSON_ID>.mdx`
2) `content/<track>/modules/<MODULE_ID>/lessons/<LESSON_ID>.quiz.json`
3) `content/<track>/modules/<MODULE_ID>/lessons/<LESSON_ID>.lab.md`

MDX must contain these sections in order:
1) 要点まとめ（5行）
2) 概念
3) 例（2つ）
4) よくあるミス／落とし穴（5つ）
5) チェックリスト
6) 次へ

## Evidence rule (non-negotiable)
- Use `evidence/<LESSON_ID>.md` as the single source of truth.
- Do NOT invent facts beyond evidence.
- Every quiz explanation MUST cite evidence tags like `(Evidence: E3, E7)`.

## Quiz rules
- Must follow schema in `templates/quiz_schema.json`.
- 10 questions total by default unless prompt overrides.
- All questions must be original.

## Lab rules
- Labs must be auto-gradable in principle.
- If generating runnable labs, use Maven + JUnit5.
- Do not require network access.

## ID stability
- Do not rename IDs or move files without explicit instruction.
