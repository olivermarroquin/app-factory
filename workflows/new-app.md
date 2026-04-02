# Workflow: Start a New App

Follow this checklist every time you create a new app from the factory.

---

## 1. Define the app

- [ ] Write one sentence: what does this app do and who is it for?
- [ ] Name the app (used for repo name, folder name, and branding)
- [ ] Choose a stack preset from `presets/` — commit to it before you start

## 2. Create the repo

- [ ] Create a new folder or GitHub repo named after the app
- [ ] Run `git init` (or create via GitHub UI)
- [ ] Copy `templates/base/.gitignore.tpl` → `.gitignore`

## 3. Set up root files

- [ ] Copy `templates/base/CLAUDE.md.tpl` → `CLAUDE.md`, fill in placeholders
- [ ] Copy `templates/base/README.md.tpl` → `README.md`, fill in placeholders
- [ ] Copy `templates/base/.env.example.tpl` → `.env.example`, add app-specific vars

## 4. Create the docs folder

- [ ] Copy `templates/docs/product-brief.md.tpl` → `docs/product-brief.md`, fill in
- [ ] Copy `templates/docs/mvp-scope.md.tpl` → `docs/mvp-scope.md`, fill in
- [ ] Copy `templates/docs/architecture.md.tpl` → `docs/architecture.md`, fill in
- [ ] Copy `templates/docs/roadmap.md.tpl` → `docs/roadmap.md`, fill in

## 5. Bootstrap with Claude Code

- [ ] Open Claude Code in the new repo
- [ ] Paste the `prompts/init-project.md` prompt (fill in app name + stack)
- [ ] Let Claude generate the initial folder structure and config files
- [ ] Review and commit the scaffold

## 6. First build session

- [ ] Follow `workflows/first-build.md`
- [ ] Commit working state at the end of every session

## 7. After first use — update the factory

- [ ] Note anything missing, unclear, or improvised during setup
- [ ] Update the relevant template, doc, or workflow in this repo
- [ ] Commit the update: `git commit -m "improve factory after {app-name} setup"`
