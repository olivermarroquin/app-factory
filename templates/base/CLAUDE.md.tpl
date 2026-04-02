# CLAUDE.md — {{APP_NAME}}

## What this app is

{{ONE_LINE_DESCRIPTION}}

**Stack:** {{STACK_SUMMARY}}
**Stage:** {{CURRENT_STAGE}} (e.g. MVP build / post-MVP / scaling)

## Docs

All product and technical context lives in `docs/`:

- `docs/product-brief.md` — problem, solution, target user
- `docs/mvp-scope.md` — MVP scope and done criteria
- `docs/architecture.md` — stack decisions and folder structure
- `docs/roadmap.md` — phased plan

Read these before making significant changes.

## Folder structure

```
{{APP_NAME}}/
├── docs/           # Product and technical docs
├── {{FOLDER_1}}/   # {{PURPOSE}}
├── {{FOLDER_2}}/   # {{PURPOSE}}
└── ...
```

## Key conventions

- {{CONVENTION_1}}
- {{CONVENTION_2}}
- {{CONVENTION_3}}

## What to avoid

- {{AVOID_1}}
- {{AVOID_2}}

## Environment

Copy `.env.example` to `.env` and fill in values before running locally.
Required vars: `{{KEY_ENV_VARS}}`

## Commands

```bash
# Install
{{INSTALL_CMD}}

# Dev
{{DEV_CMD}}

# Build
{{BUILD_CMD}}

# Test
{{TEST_CMD}}
```
