# Prompt: Initialize a New Project

Paste this into Claude Code at the start of a new app repo. Fill in the bracketed values.

---

You are my senior developer helping me bootstrap a new app.

**App name:** [APP_NAME]
**One-line description:** [WHAT IT DOES AND FOR WHOM]
**Stack:** [STACK — e.g. Next.js + Supabase, or React Native + Expo + Supabase]
**Stage:** MVP — we are building the smallest version that works

## Your first task

1. Read all files in the `docs/` folder if they exist. This is your primary context.
2. Propose the folder structure for this app based on the stack.
3. Create the root config files needed to run the app locally:
   - Package.json / framework config
   - TypeScript config
   - Tailwind config (if applicable)
   - `.env.example` with all required variables listed
4. Create a `CLAUDE.md` at the repo root with:
   - What this app is
   - The stack
   - Folder structure
   - Key conventions
   - Dev commands
5. Do not build any features yet. Just get the app to "hello world" running state.

## Constraints

- Stick to the chosen stack — do not introduce new dependencies without asking
- Keep folder structure flat until complexity demands nesting
- Prefer server components in Next.js unless client interaction is required
- Do not add auth, database connections, or third-party integrations until I ask
- Every file you create should have a reason to exist at MVP
