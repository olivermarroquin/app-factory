#!/usr/bin/env python3
"""
create_project.py — App Factory project generator (v1)

Bootstraps a new app repo from the factory templates.

Usage:
    python scripts/create_project.py <slug>

Example:
    python scripts/create_project.py my-new-startup

Creates:
    ~/projects/my-new-startup/
        README.md
        CLAUDE.md
        .env.example
        .gitignore
        docs/
            product-brief.md
            mvp-scope.md
            architecture.md
            roadmap.md
        .tmp/
"""

import re
import sys
from datetime import date
from pathlib import Path


# ─── Paths ────────────────────────────────────────────────────────────────────

FACTORY_ROOT  = Path(__file__).parent.parent
PROJECTS_DIR  = Path.home() / "projects"

TEMPLATES_BASE = FACTORY_ROOT / "templates" / "base"
TEMPLATES_DOCS = FACTORY_ROOT / "templates" / "docs"

# template source dir → destination path relative to project root
TEMPLATE_MAP = [
    (TEMPLATES_BASE, ""),        # templates/base/*  → project root
    (TEMPLATES_DOCS, "docs"),    # templates/docs/*  → docs/
]

# Extra empty dirs to create in the new project (beyond what templates produce)
EXTRA_DIRS = [".tmp"]


# ─── Helpers ──────────────────────────────────────────────────────────────────

def slug_to_title(slug: str) -> str:
    """my-new-startup  →  My New Startup"""
    return " ".join(word.capitalize() for word in slug.replace("_", "-").split("-"))


def build_replacements(slug: str) -> dict:
    today = date.today()
    title = slug_to_title(slug)
    return {
        "APP_SLUG":  slug,
        "APP_NAME":  title,
        "APP_TITLE": title,
        "DATE":      today.isoformat(),   # 2026-04-02
        "YEAR":      str(today.year),     # 2026
    }


def render(content: str, replacements: dict) -> str:
    """Replace every {{KEY}} in content using the replacements dict."""
    for key, value in replacements.items():
        content = content.replace(f"{{{{{key}}}}}", value)
    return content


def strip_tpl(name: str) -> str:
    """CLAUDE.md.tpl → CLAUDE.md  |  .gitignore.tpl → .gitignore"""
    return name[:-4] if name.endswith(".tpl") else name


def find_unfilled(content: str) -> list:
    """Return sorted unique list of {{PLACEHOLDER}} patterns still present."""
    return sorted(set(re.findall(r"\{\{[A-Z_0-9]+\}\}", content)))


# ─── Validation ───────────────────────────────────────────────────────────────

def validate_slug(slug: str) -> None:
    pattern = r"^[a-z][a-z0-9\-]*$"
    if not re.match(pattern, slug):
        abort(
            f"Invalid slug: '{slug}'\n"
            "Slugs must be lowercase, start with a letter, and contain only letters, numbers, or hyphens.\n"
            "Example: my-new-startup"
        )


def validate_templates() -> None:
    for src, _ in TEMPLATE_MAP:
        if not src.is_dir():
            abort(f"Templates directory not found: {src}\nRun this script from the app-factory repo.")


def validate_target(project_dir: Path) -> None:
    if project_dir.exists():
        abort(
            f"Directory already exists: {project_dir}\n"
            "Choose a different slug or remove the existing directory first."
        )


def abort(message: str) -> None:
    print(f"\nError: {message}\n", file=sys.stderr)
    sys.exit(1)


# ─── Generator ────────────────────────────────────────────────────────────────

def generate(slug: str) -> None:
    project_dir  = PROJECTS_DIR / slug
    replacements = build_replacements(slug)

    validate_slug(slug)
    validate_templates()
    validate_target(project_dir)

    print(f"\nGenerating project '{slug}'")
    print(f"Location: {project_dir}\n")

    unfilled = {}   # relative file path → list of remaining placeholders

    # Render and write template files
    for src_dir, dst_subdir in TEMPLATE_MAP:
        dst_dir = project_dir / dst_subdir if dst_subdir else project_dir
        dst_dir.mkdir(parents=True, exist_ok=True)

        for tpl_file in sorted(src_dir.iterdir()):
            if not tpl_file.is_file() or not tpl_file.name.endswith(".tpl"):
                continue

            raw      = tpl_file.read_text(encoding="utf-8")
            rendered = render(raw, replacements)
            out_name = strip_tpl(tpl_file.name)
            out_path = dst_dir / out_name

            out_path.write_text(rendered, encoding="utf-8")

            rel = out_path.relative_to(project_dir)
            print(f"  created  {rel}")

            remaining = find_unfilled(rendered)
            if remaining:
                unfilled[str(rel)] = remaining

    # Create extra dirs
    for d in EXTRA_DIRS:
        (project_dir / d).mkdir(exist_ok=True)

    print_summary(project_dir, unfilled)


# ─── Output ───────────────────────────────────────────────────────────────────

def print_summary(project_dir: Path, unfilled: dict) -> None:
    width = 60

    print(f"\n{'─' * width}")
    print(f"  Project created at {project_dir}")
    print(f"{'─' * width}")

    if unfilled:
        print("\n  Placeholders to fill in manually:\n")
        for filepath, placeholders in unfilled.items():
            print(f"  {filepath}")
            for p in placeholders:
                print(f"    {p}")

    print(f"\n  Next steps:")
    print(f"    1. cd {project_dir}")
    print( "    2. Fill in the placeholders listed above")
    print( "    3. Pick a stack preset:  cat app-factory/presets/next-supabase.md")
    print( "    4. Open in VS Code:      code .")
    print( "    5. Paste init prompt:    app-factory/prompts/init-project.md")
    print(f"\n{'─' * width}\n")


# ─── Entry point ──────────────────────────────────────────────────────────────

def main() -> None:
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    slug = sys.argv[1].strip().lower()
    generate(slug)


if __name__ == "__main__":
    main()
