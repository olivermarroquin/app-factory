# Workflow: Factory Retro

Run this after every real project setup — ideally within 24 hours while it's fresh.
Time target: under 10 minutes.

Purpose: convert friction into factory improvements before the next project.

---

## Step 1 — Log the friction (5 min)

Answer only what applies. Skip fields that were fine.

**What did I hesitate on or have to look up?**


**What did Claude have to infer that should have been explicit in a template or prompt?**


**Which placeholder(s) did I fill manually that could have been defaulted or derived?**


**Where did the generated repo feel incomplete or wrong on arrival?**


**What did I add, remove, or rewrite that should be in the templates instead?**


**Was the intake the right set of questions? What was missing or unnecessary?**


**Was the preset accurate? What was missing or wrong?**


---

## Step 2 — Triage and fix (5 min)

For each friction point logged above, decide where it belongs and act on it now.

| Friction | Where it belongs | Action |
|----------|-----------------|--------|
| | | |
| | | |
| | | |

**Where it belongs** options:
- `templates/base/` or `templates/docs/` — should be in the generated output
- `presets/<name>.md` — missing or wrong stack replacement value
- `prompts/` — prompt instruction should be clearer or more specific
- `workflows/` — process step is missing, vague, or in the wrong order
- `scripts/` — could be automated
- **leave it manual** — requires app-specific judgment, not improvable by the factory

---

## Step 3 — Commit the improvements

- [ ] Make the changes identified above
- [ ] Commit from inside the `app-factory` repo:

```bash
git add -p
git commit -m "factory: improve after <project-slug> retro"
```

---

## What NOT to defer

If you find yourself writing "I should update X later" — do it now.
The retro only has value if it closes the loop immediately.
A 2-minute template fix now saves 15 minutes on the next project.
