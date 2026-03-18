# CS Knowledge Work Instruction Draft

## 1. Document Purpose
This instruction defines how to produce static, interpretation-focused content for the `CS knowledge` category.

This category is for explaining core computing concepts in a way that supports later exam item extraction. It is not a coding practice category and it must not be connected to `development practical skills` in structure, naming, or progression.

## 2. Scope
### In Scope
- Static explanatory lessons
- Concept comparison content
- Terminology explained in context
- Architecture and mechanism interpretation
- Metadata for future exam item extraction

### Out Of Scope
- Standalone `understanding test` subjects
- Dynamic simulators
- Auto-generated interactive labs
- Curriculum links to development practical skills
- Project implementation guides centered on framework usage

## 3. Subject Structure
The `CS knowledge` category must use the following subjects:

1. Basic Theory
2. Data Structures
3. Algorithms
4. Computer Architecture
5. Operating Systems
6. Database
7. Networking
8. Security

## 4. Subject Intent
### 4.1 Basic Theory
- Covers abstraction, data representation, logic, complexity basics, and foundational computing models.

### 4.2 Data Structures
- Covers how data is organized, stored, traversed, and selected depending on access patterns and constraints.

### 4.3 Algorithms
- Covers procedural reasoning, problem-solving patterns, efficiency tradeoffs, and representative algorithm families.

### 4.4 Computer Architecture
- Covers CPU, memory, storage, instruction flow, and hardware-level execution concepts.

### 4.5 Operating Systems
- Covers process and thread models, scheduling, memory management, filesystems, and system resource control.

### 4.6 Database
- Covers relational concepts, normalization, indexing, transactions, concurrency, and data integrity.

### 4.7 Networking
- Covers protocol layering, addressing, routing, transport semantics, and communication reliability.

### 4.8 Security
- Covers authentication, authorization, cryptography fundamentals, attack surfaces, and defensive principles.

## 5. Content Design Principles
- Every content unit must be static and readable without any dynamic feature.
- Every lesson must explain meaning, boundaries, and distinctions, not just definitions.
- Each lesson must contain enough structured checkpoints to support future exam item extraction.
- Content must be independently understandable at the lesson level.
- Cross-subject references are allowed only within the `CS knowledge` category.
- Lessons must not redirect the learner toward `development practical skills`.

## 6. Standard Content Unit
Each lesson must be authored as one `Content Unit`.

Required metadata:
- `id`
- `category: cs-knowledge`
- `subject`
- `topic`
- `estimated_read_minutes`
- `difficulty`

Required sections:
1. Learning Objectives
2. Why This Concept Matters
3. Core Explanation
4. Structure Or Mechanism Breakdown
5. Comparison With Similar Concepts
6. Common Misunderstandings
7. Check Questions
8. Exam Extraction Notes

## 7. Detailed Lesson Template
Use the following structure for every lesson.

### 7.1 Learning Objectives
- 3 to 5 measurable objectives
- Must be phrased as what the learner should be able to explain or distinguish

### 7.2 Why This Concept Matters
- One short section
- Must explain where this concept becomes important in reasoning or system understanding

### 7.3 Core Explanation
- Main explanatory body
- Must focus on mechanism, flow, purpose, and limitation
- Avoid one-line glossary style only

### 7.4 Structure Or Mechanism Breakdown
- Break the concept into steps, components, or layers
- Use numbered sequences when the concept has flow

### 7.5 Comparison With Similar Concepts
- Compare against 1 to 3 nearby concepts
- Must explicitly state confusion boundaries

### 7.6 Common Misunderstandings
- Include at least 3 misconceptions
- Each misconception must include why it is wrong

### 7.7 Check Questions
- Include 4 to 6 short questions
- These are embedded comprehension checks, not a separate subject
- Question types can be:
  - definition precision
  - distinction
  - cause and effect
  - scenario interpretation

### 7.8 Exam Extraction Notes
Must include:
- `fact_candidates`
- `contrast_candidates`
- `mechanism_sequence_candidates`
- `scenario_candidates`
- `wrong_answer_patterns`

## 8. Exam Extraction Rules
Future exam items will be drafted from lessons, so each lesson must support extraction.

Required design rules:
- Include at least 3 explicit claim statements that can become objective questions.
- Include at least 2 contrast pairs.
- Include at least 1 scenario that requires interpreting the concept in context.
- Include at least 2 common wrong assumptions.
- If a lesson explains a sequence, that sequence must be stable enough to become ordering or causality questions.

## 9. Writing Rules
- Prefer explanatory prose over checklist-only writing.
- Define terms in plain Korean first, then refine technically.
- Keep examples conceptual rather than framework-specific.
- Avoid implementation walkthroughs.
- Avoid product-brand dependency unless it is essential to the concept.
- Avoid mixing CS lesson goals with interview prep phrasing.

## 10. Prohibited Patterns
- Do not create `이해도 테스트` as its own subject.
- Do not add Java, Spring, React, SQL framework practice guidance as part of this category.
- Do not write lessons as if the learner will execute code inside the lesson.
- Do not use dynamic widgets as a required understanding path.
- Do not collapse the lesson into glossary terms only.

## 11. Quality Checklist
- The subject is one of the approved CS subjects.
- The lesson is static and explanatory.
- The lesson includes misconception handling.
- The lesson includes embedded check questions.
- The lesson includes exam extraction notes.
- The lesson does not reference development practical skills.
- The lesson can stand alone without a dynamic tool.

## 12. Suggested File Structure
Recommended document layout:

```text
docs/
  cs-knowledge-work-instruction-draft.md
data/
  training-content-factory/
    content/
      cs-knowledge/
        <subject>/
          <lesson-id>.mdx
          <lesson-id>.meta.json
```

If the existing content factory is extended later, keep `cs-knowledge` isolated from all development tracks.

## 13. Example Unit Outline
Example subject: Database
Example topic: Why indexes improve some queries but slow some writes

The lesson should include:
- what an index is conceptually
- why lookup cost changes
- why write amplification happens
- when an index is not beneficial
- confusion boundary between index, primary key, and constraint
- scenario-based check questions about read-heavy versus write-heavy workloads

## 14. Acceptance Criteria
- A writer can create a lesson without inventing the structure.
- A reviewer can verify whether the lesson supports future exam extraction.
- A later implementer can map the lesson into a static MDX pipeline.
- The category remains separate from development practical skills at every level.
