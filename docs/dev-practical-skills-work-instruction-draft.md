# Development Practical Skills Work Instruction Draft

## 1. Document Purpose
This instruction defines how to produce static, interpretation-focused content for the `development practical skills` category.

This category is for understanding applied development work through structured explanatory content. It must remain independent from `CS knowledge` and must not be positioned as an extension of that category.

## 2. Scope
### In Scope
- Static explanatory lessons about practical development work
- Subject-based reading content for language, framework, and workflow understanding
- Real-world interpretation of common development situations
- Metadata for future exam item extraction

### Out Of Scope
- Standalone `understanding test` subjects
- Dynamic coding playgrounds as required lesson components
- Interactive labs as the primary delivery mode
- Direct links that merge this category with `CS knowledge`
- Pure glossary-only pages without interpretation

## 3. Subject Structure
The `development practical skills` category must use the following subjects:

1. Common Workplace Fundamentals
2. Java
3. JavaScript
4. Python
5. SQL
6. Spring Boot
7. React
8. Next.js

## 4. Subject Intent
### 4.1 Common Workplace Fundamentals
- Covers practical baseline knowledge shared across development work.
- Include reading-based content on source control habits, issue understanding, logs, API reading, environment separation, code review basics, documentation reading, and delivery communication.

### 4.2 Java
- Covers language features, code-reading ability, error interpretation, and practical usage boundaries.

### 4.3 JavaScript
- Covers browser and runtime behavior, asynchronous flow, language semantics, and common work situations.

### 4.4 Python
- Covers scripting-oriented reasoning, data handling patterns, and readable practical usage.

### 4.5 SQL
- Covers query writing interpretation, result reasoning, schema reading, and operational caution points.

### 4.6 Spring Boot
- Covers application structure, dependency flow, controller-service-repository roles, configuration, and practical backend reasoning.

### 4.7 React
- Covers component thinking, state flow, rendering behavior, and UI implementation reasoning.

### 4.8 Next.js
- Covers App Router structure, server/client boundaries, data fetching shape, and project-level organization.

## 5. Content Design Principles
- Every lesson must be static and explanation-first.
- Lessons must help the learner interpret practical situations, not execute dynamic exercises.
- Lessons must support future exam item extraction from within the lesson itself.
- `Common Workplace Fundamentals` is mandatory and must be treated as a full subject, not an appendix.
- The category must not depend on `CS knowledge` references to make its lessons understandable.

## 6. Standard Content Unit
Each lesson must be authored as one `Content Unit`.

Required metadata:
- `id`
- `category: dev-practical-skills`
- `subject`
- `topic`
- `estimated_read_minutes`
- `difficulty`

Required sections:
1. Learning Objectives
2. Work Context
3. Core Explanation
4. Practical Reading Scenario
5. Common Mistakes Or Misreadings
6. Check Questions
7. Exam Extraction Notes

## 7. Detailed Lesson Template
### 7.1 Learning Objectives
- 3 to 5 measurable objectives
- Must be phrased around explanation, reading, interpretation, or decision-making

### 7.2 Work Context
- Short section describing where the topic appears in actual development work
- Must remain static and descriptive

### 7.3 Core Explanation
- Main body
- Explain role, purpose, moving parts, tradeoffs, and boundaries
- Avoid step-by-step interactive exercise dependency

### 7.4 Practical Reading Scenario
- Include 1 to 2 scenarios
- Scenarios must be understandable without running code
- Good examples:
  - interpreting an error message
  - reading a pull request diff
  - deciding where a configuration belongs
  - understanding why an API response shape causes a bug

### 7.5 Common Mistakes Or Misreadings
- Include at least 3 items
- Each item must explain why the interpretation fails

### 7.6 Check Questions
- Include 4 to 6 embedded questions
- These are not a separate subject
- Good question types:
  - code reading interpretation
  - scenario judgment
  - role distinction
  - tradeoff choice

### 7.7 Exam Extraction Notes
Must include:
- `fact_candidates`
- `practical_judgment_candidates`
- `error_interpretation_candidates`
- `scenario_candidates`
- `wrong_answer_patterns`

## 8. Exam Extraction Rules
Every lesson must support later item drafting.

Required design rules:
- Include at least 2 explicit practical rules or principles.
- Include at least 1 work scenario where the learner must choose the better interpretation.
- Include at least 2 common mistakes that can be turned into distractors.
- Include at least 1 comparison between similar tools, responsibilities, or concepts.
- Include stable statements that can become objective or short-answer items.

## 9. Common Workplace Fundamentals Rules
This subject must exist in the category and must include at least these topic families:
- version control basics
- issue and task reading
- log and error interpretation
- configuration and environment separation
- API request and response reading
- code review basics
- documentation reading
- delivery and reporting basics

This subject is still static explanatory content. It is not a checklist-only onboarding module.

## 10. Writing Rules
- Use Korean explanatory prose with practical examples.
- Keep examples static and readable.
- Prefer code snippets only when they clarify interpretation.
- Avoid requiring the learner to run the snippet.
- Explain not only how something looks, but how to reason about it in work context.
- Do not assume prior reading from `CS knowledge`.

## 11. Prohibited Patterns
- Do not create `이해도 테스트` as its own subject.
- Do not merge this category with `CS knowledge`.
- Do not define the category around dynamic labs or editors.
- Do not write subjects as quiz collections only.
- Do not omit `Common Workplace Fundamentals`.

## 12. Quality Checklist
- The subject is one of the approved development practical skills subjects.
- The lesson is static and interpretation-focused.
- The lesson contains practical reading scenarios.
- The lesson contains embedded check questions.
- The lesson contains exam extraction notes.
- The lesson does not depend on CS category linking.
- The lesson can be understood without executing code.

## 13. Suggested File Structure
Recommended document layout:

```text
docs/
  dev-practical-skills-work-instruction-draft.md
data/
  training-content-factory/
    content/
      dev-practical-skills/
        common-workplace-fundamentals/
        java/
        javascript/
        python/
        sql/
        spring-boot/
        react/
        nextjs/
```

If this is later integrated into the content factory, keep the category and subject folders separate from `cs-knowledge`.

## 14. Example Unit Outline
Example subject: Common Workplace Fundamentals
Example topic: How to read an error report before asking for help

The lesson should include:
- what information matters first
- how to separate symptom from cause
- what environment details must be checked
- what makes a vague report unhelpful
- check questions based on realistic reporting situations
- distractor notes for common low-quality interpretations

## 15. Acceptance Criteria
- A writer can produce a lesson with no missing structural decisions.
- A reviewer can verify whether the lesson supports later exam extraction.
- The category contains `Common Workplace Fundamentals`.
- The category stays independent from `CS knowledge`.
