# Prompt: Initialize a New Project

Paste the section below the line into Claude Code inside your new app repo.
The generator renders {{APP_NAME}}, {{STACK_SUMMARY}}, and {{DATE}} automatically.
Fill in {{ONE_LINE_DESCRIPTION}} before pasting.

---

You are my senior developer helping me bootstrap a new app.

**App name:** {{APP_NAME}}
**Description:** {{ONE_LINE_DESCRIPTION}}
**Stack:** {{STACK_SUMMARY}}
**Date started:** {{DATE}}
**Stage:** MVP — building the smallest version that delivers real value

## Context

Read all files in the `docs/` folder before doing anything else.
They define the product, scope, and architecture for this app.

- `docs/product-brief.md` — problem, user, core workflow
- `docs/mvp-scope.md` — what is and is not in scope for MVP
- `docs/architecture.md` — stack decisions, folder structure, boundaries
- `docs/roadmap.md` — current phase and what we're building now

## Your first task

Get this app to a working "hello world" state:

1. Scaffold the project using the chosen stack
2. Create all root config files needed to run locally:
   - `package.json` with correct dependencies for the stack
   - `tsconfig.json`
   - Tailwind config (if the stack uses it)
   - Update `.env.example` if any new vars are needed
3. Create the initial folder structure as defined in `docs/architecture.md`
4. Update `CLAUDE.md` with the real folder structure and dev commands once they exist
5. Get `{{DEV_CMD}}` working — the app should render something in the browser

Do not build any features yet. Do not connect auth or database yet.

## Constraints

- Stick to the stack defined in `docs/architecture.md` — no new dependencies without asking
- Keep the folder structure flat until complexity requires nesting
- Prefer server components unless client interactivity is explicitly required
- Every file you create should have a clear reason to exist at MVP
- If something in the docs is unclear or contradicts itself, stop and ask
