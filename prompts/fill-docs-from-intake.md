# Prompt: Fill Docs from Intake

Paste this into Claude Code inside a generated app repo after filling in `docs/app-intake.md`.

---

You are my senior developer and product advisor helping me shape a new app before we start building.

## Your task

Read `docs/app-intake.md` first. That is your primary source of truth.

Then update the following files using the intake as input. Work through them in order.

---

### 1. `docs/product-brief.md`

Fill in every placeholder using intake answers:

- **Problem** — use the user's problem statement, not a generic rewrite
- **Who** — use the exact persona described, with their context and workaround
- **Solution** — derive from the description + problem + workaround, not just the description alone
- **Core workflow** — use the workflow steps from the intake directly
- **Why now** — use the intake answer verbatim or lightly edited
- **Success metrics** — derive from the "how will you know MVP is working" field; make them observable
- **Out of scope** — use the "cut from MVP" list from the intake

If any section has no useful intake data, write `<!-- needs input: [what's missing] -->` rather than inventing content.

---

### 2. `docs/mvp-scope.md`

- **MVP sentence** — use or refine the intake's one-sentence MVP definition
- **Auth decision** — use the intake's auth answer exactly; do not soften or expand it
- **Primary user flow** — derive from the core workflow steps; add any implied steps the intake omits
- **In-scope features** — use the intake's 3 MVP features; add a "Why it's required" rationale for each
- **Out of scope** — use the intake's cut list; for each, add a "When to reconsider" note (e.g. "after MVP ships" or "if users request it")
- **Done criteria** — write 3 observable, testable outcomes based on the workflow and success metric
- **What this MVP validates** — identify the 1–2 core assumptions the MVP is designed to test

Do not add features that aren't in the intake. If the intake is thin, write `<!-- needs input -->` rather than padding.

---

### 3. `docs/roadmap.md`

- **Current focus** — set to the first unbuilt step of the primary user flow
- **Phase 1 tasks** — derive from the 3 MVP features; break each into 1–3 concrete build tasks
- **Demo milestone** — use the intake's target date / demo goal
- **Phase 1 done criteria** — use the done criteria you wrote in mvp-scope.md
- **Phase 2** — leave mostly blank; add `<!-- fill after MVP ships -->` note; optionally move the cut features here as starting suggestions
- **Backlog** — populate from the intake's cut list if items weren't placed in Phase 2

---

### 4. `README.md`

Update only these fields:

- **One-line description** — from intake
- **Short description** — 2–3 sentences: what it does, who it's for, what problem it solves
- **Current phase** — set to "MVP build"

Do not change the stack table or setup commands — those are correct.

---

### 5. `CLAUDE.md`

Update only these fields:

- **One-line description** — from intake
- **Current stage** — set to "MVP build"

Do not change the folder structure, commands, or behavioral directives — those will be updated after the init step creates real project files.

---

## Rules

- **Do not hallucinate specifics.** If the intake doesn't say it, don't invent it. Use `<!-- needs input: [what] -->` instead.
- **Do not expand scope.** If the intake cuts a feature, keep it cut.
- **Do not rewrite the intake.** Translate it into the docs — don't editorialize.
- **Flag high-impact gaps** explicitly. If the intake is missing something that will block the first build session (e.g. auth decision is blank, core workflow has fewer than 3 steps), say so at the top of your response before filling any docs.
- **Preserve existing content** that is already filled in correctly. Only replace placeholders and `<!-- needs input -->` markers.

## After filling the docs

List:
1. Which files were updated and what changed
2. Any gaps you flagged and why they matter
3. One sentence on whether the MVP scope looks tight or needs cutting
