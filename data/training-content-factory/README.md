# Training Content Factory (Java + Spring Boot + Oracle SQL)

This repository is a *content production pipeline*:
- You provide: curriculum skeleton (YAML) + per-lesson evidence packs (10–14 bullets).
- Claude Code generates: lesson MDX + quiz JSON + lab spec + (optional) runnable lab projects.

## 0) Lock versions (edit once)
- Java: 17
- Spring Boot: 3.x
- Oracle DB: 19c/21c (choose one and keep it)

## 1) Put sources here (raw docs, internal guides, example code)
- `sources/java/...`
- `sources/spring/...`
- `sources/sql/...`
Then register each source in `sources/_index.yaml`.

## 2) Define curriculum here (IDs are stable)
- `content/java/track.yaml` + `content/java/modules/*/module.yaml`
- `content/spring/...`
- `content/sql/...`

## 3) For EACH lesson create evidence pack (the only manual writing you must do)
- `evidence/<LESSON_ID>.md`
Format is in `templates/evidence_template.md`.

## 4) Ask Claude Code to generate lesson package
Use prompts in `prompts/`:
- `01_build_curriculum_skeleton.txt`
- `02_build_evidence_pack.txt`
- `03_generate_lesson_package.txt`
- `04_generate_lab_project.txt`

## 5) Quality gates
- Quiz schema: `scripts/validate_quiz_schema.js`
- Optional lint: ensure each explanation references Evidence tags (E1..)

---

If you follow the pipeline, you do NOT paste entire docs into prompts.
You only point Claude to local files + the evidence pack.
