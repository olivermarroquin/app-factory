# Workflow: Start a New App

Follow this checklist every time you create a new app from the factory.

---

## 1. Generate the project

```bash
new-app <slug> --preset <preset> --git --open
```

- [ ] Choose a slug: lowercase, hyphens only (e.g. `invoice-tracker`)
- [ ] Pick a preset — run `new-app --list` to see options
- [ ] Confirm the project was created at `~/projects/<slug>/`

## 2. Fill the intake

- [ ] Open `docs/app-intake.md` in the new project
- [ ] Fill in all sections — aim for 10–15 minutes
- [ ] Be specific: "freelancers chasing payments" beats "small business owners"
- [ ] The core workflow section (Section 3) is the most important — spend time here
- [ ] Leave a field blank rather than writing vague filler

## 3. Fill the docs from intake

- [ ] Open Claude Code inside the new project (`code ~/projects/<slug>`)
- [ ] Paste the prompt from `app-factory/prompts/fill-docs-from-intake.md`
- [ ] Review what Claude produced — look for `<!-- needs input -->` markers
- [ ] Cut any scope that crept in beyond the intake
- [ ] Commit: `git add docs/ README.md CLAUDE.md && git commit -m "Fill docs from intake"`

See `workflows/fill-docs-from-intake.md` for the full detail on this step.

## 4. Bootstrap the project (first build session)

- [ ] Paste the init prompt (printed at end of `new-app` output) into Claude Code
- [ ] If `--describe` was not used: fill in `<ONE_LINE_DESCRIPTION>` in the prompt before pasting
- [ ] Let Claude scaffold the project and get to "hello world"
- [ ] Review and commit the scaffold

## 5. First build session

- [ ] Follow `workflows/first-build.md`
- [ ] Commit working state at the end of every session

## 6. After first use — update the factory

- [ ] Note anything missing, unclear, or that had to be improvised
- [ ] Update the relevant template, prompt, or workflow in this repo
- [ ] Commit: `git commit -m "improve factory after <slug> setup"`
