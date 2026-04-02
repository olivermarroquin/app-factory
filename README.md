# App Factory

A reusable bootstrap system for spinning up new app projects quickly and consistently.

## What this is

This repo is not an app. It is a factory for generating app repos. It contains:

- **Templates** — files rendered into every new app repo
- **Presets** — pre-decided stack combinations (Next.js + Supabase, React Native + Expo, etc.)
- **Prompts** — paste-ready Claude Code prompts for bootstrapping and planning
- **Workflows** — step-by-step checklists for starting and building a new app
- **Generator** — a Python script that scaffolds new projects from the templates

---

## Installation

Run once to install the `new-app` command in your shell:

```bash
bash scripts/install.sh
source ~/.zshrc
```

Then test it:

```bash
new-app --list
```

**What the installer does:** appends a `new-app()` zsh function to `~/.zshrc` that points to this repo's generator script. It is safe to re-run — it will not duplicate the entry. To uninstall, remove the block between the `# >>> app-factory <<<` markers in `~/.zshrc`.

---

## Usage

```bash
# List available stack presets
new-app --list

# Scaffold a project (no preset — slug and date filled automatically)
new-app my-startup

# With a stack preset — fills stack placeholders automatically
new-app my-startup --preset next-supabase

# Full daily-use command — scaffold, git init, open in VS Code
new-app my-startup --preset next-supabase --git --open
```

The generator creates `~/projects/<slug>/` with:

```
my-startup/
├── README.md
├── CLAUDE.md
├── .env.example
├── .gitignore
├── docs/
│   ├── product-brief.md
│   ├── mvp-scope.md
│   ├── architecture.md
│   └── roadmap.md
└── .tmp/
```

After generation, the terminal prints:
- which files still have manual placeholders to fill
- a ready-to-paste Claude Code init prompt with your app name and stack pre-filled

---

## Repo structure

```
app-factory/
├── templates/
│   ├── base/         # Root-level files for new app repos (.tpl)
│   └── docs/         # Doc templates for new app repos (.tpl)
├── presets/          # Stack presets with frontmatter (KEY = value)
├── prompts/          # Claude Code starter prompts
├── workflows/        # Step-by-step process checklists
├── scripts/
│   ├── create_project.py   # Project generator (v3)
│   └── install.sh          # Installs the new-app shell command
└── examples/         # Filled-in examples (reference)
```

---

## Available presets

| Preset | Stack |
|--------|-------|
| `next-supabase` | Next.js (App Router) + Supabase + Vercel |
| `next-firebase` | Next.js (App Router) + Firebase + Vercel |
| `react-native-expo` | React Native + Expo + EAS |

To add a new preset: copy any file from `presets/`, update the frontmatter `KEY = value` block and the human-readable docs below it.

---

## Stages

| Stage | What it enables | Status |
|-------|----------------|--------|
| 1 | Manual use — copy templates, follow checklists, paste prompts | done |
| 2 | Generator — `new-app` command scaffolds projects from templates | **current** |
| 3 | Full CLI — interactive prompts, GitHub repo creation, CI setup | planned |
