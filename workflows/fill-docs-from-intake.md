# Workflow: Fill Docs from Intake

Use this workflow after running `new-app` and before starting the first build session.

**Purpose:** Turn your raw project ideas into filled product docs so the first Claude Code build session starts with real context instead of placeholders.

---

## When to do this

After `new-app` generates your project, before you paste the init prompt into Claude Code.

A filled intake dramatically reduces the manual placeholder work and makes the first build session much more focused.

---

## Steps

### 1. Fill the intake

Open `docs/app-intake.md` in your new project and fill it out.

- Aim for 1–2 sentences per field
- Write specific answers, not vague ones — "freelancers chasing client payments" beats "small business owners"
- Leave a field blank rather than filling it with something vague
- The core workflow section (Section 3) is the most important — spend the most time here

**Time target:** 10–15 minutes.

### 2. Open Claude Code in the new project

```bash
code ~/projects/<your-slug>
```

Then open Claude Code inside VS Code (`Ctrl+Shift+P` → Claude Code, or use the sidebar).

### 3. Paste the fill-docs prompt

Open `app-factory/prompts/fill-docs-from-intake.md`.

Copy everything below the `---` separator and paste it into Claude Code.

Claude will:
- Read `docs/app-intake.md`
- Fill `docs/product-brief.md`, `docs/mvp-scope.md`, `docs/roadmap.md`
- Update the description fields in `README.md` and `CLAUDE.md`
- Flag any gaps that need your attention before building

### 4. Review the output

Read what Claude produced. Look for:

- `<!-- needs input -->` markers — fill these before building
- Any scope that crept in — cut it back to the intake
- Whether the MVP done criteria are testable by a real user

**The MVP scope should feel slightly too small.** If it feels comfortable, it's probably still too big.

### 5. Commit the filled docs

```bash
git add docs/ README.md CLAUDE.md
git commit -m "Fill product docs from intake"
```

### 6. Proceed to the init step

Now paste the init prompt (printed at the end of `new-app` output) into Claude Code.

The init step scaffolds the actual project files. With filled docs, Claude has real context to work from instead of placeholders.

---

## What this step does NOT do

- Does not fill architecture-level decisions (folder names, entities, services) — those come from the init step
- Does not write any code — this is product shaping only
- Does not replace your judgment on scope — it translates your intake into docs, it doesn't make product decisions for you

---

## What stays manual after this step

These fields are not fillable from the intake and should be left for later:

| Field | When to fill |
|-------|-------------|
| Folder structure in `CLAUDE.md` | After the init step creates real files |
| Conventions and avoid list in `CLAUDE.md` | After the first build session |
| Architecture decisions in `architecture.md` | During or after the init step |
| Data entities and fields | During the first build session |
| `APP_URL`, `PROD_URL` | After first deploy |
| Phase 2+ roadmap | After MVP ships |

---

## Revised new-app sequence

```
1. new-app <slug> --preset <preset> --git --open
2. Fill docs/app-intake.md  (10–15 min)
3. Paste fill-docs-from-intake.md prompt into Claude Code
4. Review + commit filled docs
5. Paste init prompt into Claude Code  ← first real build session starts here
```
