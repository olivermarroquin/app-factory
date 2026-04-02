# Prompt: Generate Docs from Context

Paste this into Claude Code when you want to generate or fill in the docs for an app. Works best after you've described the app verbally or have some existing code.

---

You are my senior developer helping me document a new app before or during the build.

**App name:** [APP_NAME]
**Stack:** [STACK]

## Context

[Paste a description of the app here — what it does, who it's for, key features, any decisions already made]

## Your task

Using the context above, generate or fill in the following docs. Use the `{{PLACEHOLDER}}` format for anything you are unsure about — I will fill those in.

Create or update these files:

### `docs/product.md`
- Problem statement (specific, not generic)
- Solution summary
- Target user (one primary persona)
- 2-3 success metrics
- What is explicitly out of scope

### `docs/mvp.md`
- One-sentence MVP definition
- 3-5 core features (only what's needed to deliver value)
- List of features explicitly cut from MVP
- Done criteria (how we'll know MVP is complete)

### `docs/architecture.md`
- Stack table with reasoning for each choice
- Proposed folder structure
- Key data entities (conceptual, not schema)
- Any key architecture decisions already made

### `docs/roadmap.md`
- Phase 1 (MVP) with tasks and target date if known
- Phase 2 outline
- Backlog of ideas (don't schedule yet)

## Constraints

- Be opinionated — don't hedge everything with "it depends"
- Prefer small and focused over comprehensive
- Flag anything that seems unclear or contradictory in my context
