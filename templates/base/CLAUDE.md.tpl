# CLAUDE.md — {{APP_NAME}}

## What this app is

{{ONE_LINE_DESCRIPTION}}

**Stack:** {{STACK_SUMMARY}}
**Stage:** {{CURRENT_STAGE}}

## Docs

Read these before making significant changes:

- `docs/product-brief.md` — problem, user, core workflow
- `docs/mvp-scope.md` — what is in and out of scope, done criteria
- `docs/architecture.md` — stack decisions, folder structure, boundaries
- `docs/roadmap.md` — current phase and priorities

## Folder structure

```
{{APP_NAME}}/
├── docs/             # Product and technical context
├── {{FOLDER_1}}/     # {{PURPOSE_1}}
├── {{FOLDER_2}}/     # {{PURPOSE_2}}
├── {{FOLDER_3}}/     # {{PURPOSE_3}}
└── ...
```

## Commands

```bash
{{INSTALL_CMD}}   # install dependencies
{{DEV_CMD}}       # start dev server
{{BUILD_CMD}}     # production build
{{TEST_CMD}}      # run tests
```

---

## How to work in this repo

### Before starting any task

1. Read the relevant doc in `docs/` if you haven't this session
2. Identify which files will be affected before writing any code
3. For changes touching more than 3 files or crossing architectural boundaries — propose first, then wait for confirmation

### Build philosophy

- **Vertical slices over horizontal layers.** Build one complete user-facing feature at a time (UI → logic → data). Do not build full layers in isolation.
- **MVP first.** If a feature is not in `docs/mvp-scope.md`, do not build it unless explicitly asked.
- **Simple over clever.** Prefer readable, obvious code. Abstractions earn their place — do not create them speculatively.
- **Small, testable units.** Functions should do one thing. Side effects should be explicit and isolated.
- **Server-side by default** (for Next.js apps). Use client components only when interactivity requires it.

### When to stop and ask

Stop and ask before:
- Adding a new dependency not already in the project
- Creating a new top-level folder or changing the folder structure
- Changing how auth, routing, or data fetching works across the app
- Making a decision that would require migrating existing data or sessions
- Anything that would take more than one session to undo

Do not ask before:
- Writing a new component, route, or server action within the established patterns
- Adding a type, utility, or helper that stays within its module
- Fixing a bug in an isolated area
- Updating a doc after a decision has been made

### Handling uncertainty

- If the task is ambiguous, restate your interpretation before proceeding
- If two approaches are valid, recommend one and explain the tradeoff briefly — do not present a menu
- If something in the docs contradicts the code, flag it immediately

### Docs discipline

Update `docs/` when:
- A stack decision changes
- The MVP scope changes
- The folder structure changes significantly
- A key tradeoff was made that future-you needs to understand

Do not let docs drift from reality. A wrong doc is worse than no doc.

---

## Key conventions

- {{CONVENTION_1}}
- {{CONVENTION_2}}
- {{CONVENTION_3}}

## What to avoid

- {{AVOID_1}}
- {{AVOID_2}}
- Do not add error handling for cases that cannot happen
- Do not add backwards-compatibility shims — change the code
- Do not abstract across features until a pattern is proven in at least two places

## Environment

Copy `.env.example` → `.env` and fill in values.
See `docs/architecture.md` for notes on each service.
