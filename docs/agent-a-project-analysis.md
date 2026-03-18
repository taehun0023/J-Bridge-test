# Agent A Project Analysis

## Purpose
This document summarizes the current project structure relevant to adding static, interpretation-focused content specs for the `CS knowledge` and `development practical skills` categories.

## Current Structure
- The app uses Next.js App Router under `src/app`.
- Category hub pages are rendered through a shared component:
  - `src/app/(main)/cs/page.tsx`
  - `src/app/(main)/dev/page.tsx`
  - `src/components/ui/CategoryHubPage.tsx`
- Category definitions and child routes are centralized in `src/lib/navigation.ts`.

## Routing Shape
### CS
- Hub: `/cs`
- Current children:
  - `/cs/quiz`
  - `/cs/basic-theory`
  - `/cs/algorithms`
  - `/cs/data-structures`
  - `/cs/computer-architecture`
  - `/cs/database`
  - `/cs/networking`
  - `/cs/security`

### Development
- Hub: `/dev`
- Current children:
  - `/dev/quiz`
  - `/dev/java`
  - `/dev/javascript`
  - `/dev/spring-boot`
  - `/dev/react`
  - `/dev/nextjs`
  - `/dev/python`
  - `/dev/sql`

## Current Content Patterns
### CS
- Current CS pages are glossary and quiz oriented.
- Example: `src/app/(main)/cs/basic-theory/page.tsx`
- Data source pattern:
  - Supabase query against `cs_terms`
  - Difficulty filter
  - Search and mastery filters
- Interpretation:
  - The current CS experience is term-centric rather than lesson-centric.
  - Static explanatory content does not yet appear to be the primary delivery model for CS.

### Development
- Current Dev category pages route into course list pages.
- Example: `src/app/(main)/dev/java/page.tsx`
- Shared rendering path:
  - `src/components/ui/SubcourseListPage.tsx`
  - `getCoursesWithProgress(...)`
- Interpretation:
  - The current Dev experience is course-centric and progress-aware.
  - It already has a stronger concept of subject grouping than CS.

## Reusable Components And Patterns
- `CategoryHubPage`
  - Good for top-level subject hub rendering.
- `SubcourseListPage`
  - Good for subject-level listing if future content is mapped into course records.
- `MarkdownRenderer`
  - Candidate for rendering static explanatory content if MD/MDX is adopted in-app.
- `LessonContentToggle`
  - Candidate if one lesson later needs multiple static views.
- `Card`, `Badge`, `Pagination`, `EmptyState`
  - Reusable for index and list pages.

## Existing Static Content Pipeline
The repository already contains a content production pipeline:
- `data/training-content-factory/README.md`
- `data/training-content-factory/templates/lesson_template.mdx`
- `data/training-content-factory/templates/evidence_template.md`

Observed lesson package shape:
- lesson MDX
- localized lesson MDX
- quiz JSON
- lab markdown
- evidence markdown

Interpretation:
- The project already has a viable filesystem convention for structured static content.
- For this task, that pipeline can be referenced as a structural model without requiring dynamic generation.

## Constraints For This Work
- `CS knowledge` and `development practical skills` must remain separate category systems.
- `understanding tests` must not become a standalone subject.
- Content must be static and explanatory, not simulator-driven or dynamic-first.
- Each content unit must be designed so later exam items can be extracted from it.
- `development practical skills` must explicitly include `common workplace fundamentals`.

## Recommended Information Architecture
### CS Knowledge
- Treat each subject as a concept system.
- Primary delivery unit: static explanatory lesson.
- Secondary metadata: extractable checkpoints for later exam drafting.

Suggested subject list:
- Basic Theory
- Data Structures
- Algorithms
- Computer Architecture
- Operating Systems
- Database
- Networking
- Security

### Development Practical Skills
- Treat each subject as an applied work capability area.
- Primary delivery unit: static explanatory lesson with practical reading context.
- Secondary metadata: extractable checkpoints for later exam drafting.

Suggested subject list:
- Common Workplace Fundamentals
- Java
- JavaScript
- Python
- SQL
- Spring Boot
- React
- Next.js

## Recommended Content Unit Contract
Each static content unit should include:
- `id`
- `category`
- `subject`
- `topic`
- `learning_objectives`
- `core_explanation`
- `key_points`
- `misconceptions`
- `check_questions`
- `exam_extractables`

### exam_extractables
At minimum:
- `fact_candidates`
- `concept_contrast_candidates`
- `scenario_candidates`
- `common_wrong_answer_patterns`

## Recommended File Targets For This Task
- `docs/agent-a-project-analysis.md`
- `docs/cs-knowledge-work-instruction-draft.md`
- `docs/dev-practical-skills-work-instruction-draft.md`

## Risks
- If CS keeps its current glossary-first delivery, lesson-style content may feel structurally inconsistent unless a dedicated static lesson layer is introduced later.
- If Dev keeps its current course DB dependency, pure filesystem-first content may need a later mapping step into course records.
- Existing quiz routes should not be treated as subject definitions. They are assessment entry points, not curriculum axes.

## Decision Summary
- Keep CS and Dev separated at the document, subject, and metadata level.
- Define content around static lesson units.
- Treat question extraction as metadata inside each lesson, not as a separate subject or product surface.
