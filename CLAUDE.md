# CLAUDE.md — App Factory

## What this repo is

This is an App Factory — a bootstrap system for generating new app repos. It is not an app itself.

When working in this repo, Claude Code is helping build and maintain the factory, not building an app.

## Primary goals

- Keep templates, docs, presets, and prompts up to date and reusable
- Avoid over-engineering — prefer simple, copy-pasteable files over complex automation
- Build in stages: manual first, then scripted, then automated

## Folder purposes

| Folder | Purpose |
|--------|---------|
| `templates/base/` | Root-level files for new app repos (CLAUDE.md, README, .env.example, .gitignore) |
| `templates/docs/` | Doc templates for new app repos (product-brief, mvp-scope, architecture, roadmap) |
| `presets/` | Curated stack decisions — avoid re-deciding on every new project |
| `prompts/` | Paste-ready prompts for Claude Code — must work without modification or with minimal fills |
| `workflows/` | Human-runnable checklists — must be executable without any tooling |
| `examples/` | Filled-in examples of completed templates (for reference) |
| `scripts/` | Stage 2+ automation scripts — keep minimal and well-commented |
| `.tmp/` | Scratch space — never committed, gitignored |

## Conventions

- Use `{{PLACEHOLDER}}` syntax for values to be filled in when using a template
- Every template file should have a brief header comment explaining its purpose
- Presets should list: stack, rationale, tradeoffs, and first setup steps
- Prompts should be self-contained — include context needed to work from a fresh conversation
- Workflows use checkbox format: `- [ ] step`

## What to avoid

- Do not add app-specific code to this repo
- Do not create abstractions for things that only need to happen once
- Do not automate before the manual version has been validated

## When updating this factory

After using the factory to create a new app, note anything that was missing, unclear, or had to be improvised. Update the relevant template, doc, or workflow immediately so the next use is smoother.
