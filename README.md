# App Factory

A reusable bootstrap system for spinning up new app projects quickly and consistently.

## What this is

This repo is not an app. It is a factory for generating app repos. It contains:

- **Templates** — files to copy directly into a new app repo
- **Doc templates** — structured product, MVP, architecture, and roadmap docs
- **Stack presets** — pre-decided tech combinations to avoid decision fatigue
- **Prompts** — paste-ready Claude Code prompts for bootstrapping and planning
- **Workflows** — step-by-step checklists for starting a new app

## How to use it

### Starting a new app (Stage 1 — manual)

1. Read `workflows/new-app.md` — follow the checklist
2. Pick a stack preset from `presets/`
3. Copy templates from `templates/` into your new repo
4. Fill in doc templates from `docs/`
5. Use prompts from `prompts/` to accelerate with Claude Code

### Repo structure

```
app-factory/
├── templates/      # Files to copy into new app repos
├── docs/           # Doc templates (product, MVP, architecture, roadmap)
├── presets/        # Stack presets (tech decisions pre-made)
├── prompts/        # Claude Code starter prompts
├── workflows/      # Step-by-step process checklists
└── scripts/        # Stage 2 automation (not yet built)
```

## Stages

| Stage | What it enables |
|-------|----------------|
| 1     | Manual use — copy templates, follow checklists, paste prompts |
| 2     | Scripts — `new-app.sh` automates the copy/scaffold process |
| 3     | Full CLI — interactive generator with stack selection |

Currently on: **Stage 1**
