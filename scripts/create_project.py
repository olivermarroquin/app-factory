#!/usr/bin/env python3
"""
create_project.py — App Factory project generator (v4)

Usage:
    python scripts/create_project.py <slug> [--preset <name>] [--describe "..."] [--git] [--open]
    python scripts/create_project.py --list

Examples:
    python scripts/create_project.py my-startup
    python scripts/create_project.py my-startup --preset next-supabase
    python scripts/create_project.py my-startup --preset next-supabase --git --open
    python scripts/create_project.py my-startup --preset next-supabase --describe "A tool for recruiters to shortlist candidates without spreadsheets" --git --open
    python scripts/create_project.py --list
"""

import argparse
import re
import subprocess
import sys
from datetime import date
from pathlib import Path


# ─── Paths ────────────────────────────────────────────────────────────────────

FACTORY_ROOT   = Path(__file__).parent.parent
PROJECTS_DIR   = Path.home() / "projects"
PRESETS_DIR    = FACTORY_ROOT / "presets"
TEMPLATES_BASE = FACTORY_ROOT / "templates" / "base"
TEMPLATES_DOCS = FACTORY_ROOT / "templates" / "docs"
INIT_PROMPT    = FACTORY_ROOT / "prompts" / "init-project.md"

# (source dir, destination subdir relative to project root)
TEMPLATE_MAP = [
    (TEMPLATES_BASE, ""),       # templates/base/*  →  project root
    (TEMPLATES_DOCS, "docs"),   # templates/docs/*  →  docs/
]

# Extra empty dirs to always create
EXTRA_DIRS = [".tmp"]


# ─── Preset loading ───────────────────────────────────────────────────────────

def list_presets():
    """Return sorted list of available preset names (stems of .md files)."""
    return sorted(p.stem for p in PRESETS_DIR.glob("*.md"))


def load_preset(name):
    """
    Parse key=value frontmatter from a preset .md file.

    Frontmatter format (at the very top of the file):

        ---
        # optional comment
        KEY = value
        KEY = value
        ---

    Returns a dict of {KEY: value} strings.
    """
    preset_file = PRESETS_DIR / f"{name}.md"
    if not preset_file.exists():
        available = ", ".join(list_presets()) or "none"
        abort(f"Preset '{name}' not found.\nAvailable: {available}")

    lines    = preset_file.read_text(encoding="utf-8").splitlines()
    data     = {}
    in_block = False

    for line in lines:
        stripped = line.strip()

        if stripped == "---":
            if not in_block:
                in_block = True
                continue
            else:
                break   # end of frontmatter

        if not in_block:
            abort(
                f"Preset '{name}' has no frontmatter.\n"
                "Expected a --- ... --- block at the top with KEY = value pairs.\n"
                "See presets/next-supabase.md for the correct format."
            )

        if stripped and not stripped.startswith("#") and "=" in stripped:
            key, _, value = stripped.partition("=")
            data[key.strip()] = value.strip()

    if not data:
        abort(f"Preset '{name}' frontmatter parsed but contained no key=value pairs.")

    return data


# ─── Replacements ─────────────────────────────────────────────────────────────

def slug_to_title(slug):
    """my-new-startup  →  My New Startup"""
    return " ".join(word.capitalize() for word in slug.replace("_", "-").split("-"))


def build_replacements(slug, preset_data, description=None):
    """
    Merge base replacements with preset data.
    Base identity values (APP_NAME, APP_SLUG, DATE, YEAR) always win.
    Optional description fills ONE_LINE_DESCRIPTION if provided.
    """
    today = date.today()
    title = slug_to_title(slug)

    base = {
        "APP_SLUG":      slug,
        "APP_NAME":      title,
        "APP_TITLE":     title,
        "DATE":          today.isoformat(),
        "YEAR":          str(today.year),
        "CURRENT_STAGE": "MVP build",
    }

    if description:
        base["ONE_LINE_DESCRIPTION"] = description

    return {**preset_data, **base}


# ─── Rendering ────────────────────────────────────────────────────────────────

def render(content, replacements):
    """Replace every {{KEY}} occurrence using the replacements dict."""
    for key, value in replacements.items():
        content = content.replace(f"{{{{{key}}}}}", value)
    return content


def strip_tpl(name):
    """CLAUDE.md.tpl → CLAUDE.md  |  .gitignore.tpl → .gitignore"""
    return name[:-4] if name.endswith(".tpl") else name


def find_unfilled(content):
    """Return sorted unique list of {{PLACEHOLDER}} patterns still in content."""
    return sorted(set(re.findall(r"\{\{[A-Z_0-9]+\}\}", content)))


def placeholders_to_hints(text):
    """
    Convert remaining {{PLACEHOLDER}} patterns to <placeholder> for display.
    Makes rendered prompts easier to read when pasting into Claude Code.
    """
    return re.sub(r"\{\{([A-Z_0-9]+)\}\}", r"<\1>", text)


# ─── Init prompt ──────────────────────────────────────────────────────────────

def render_init_prompt(replacements):
    """
    Read prompts/init-project.md, render known placeholders, and return the
    prompt body (the section after the first --- separator).

    The file structure is:
        [factory header / instructions]
        ---
        [the actual prompt to paste into Claude Code]

    Only the part after --- is returned.
    """
    if not INIT_PROMPT.exists():
        return None

    raw = INIT_PROMPT.read_text(encoding="utf-8")

    # Split on the first --- separator — take everything after it
    parts = raw.split("---", maxsplit=1)
    if len(parts) < 2:
        return None   # no separator found, skip

    prompt_body = parts[1].strip()

    # Render known placeholders
    rendered = render(prompt_body, replacements)

    # Convert any remaining {{PLACEHOLDERS}} to <hints> for readability
    return placeholders_to_hints(rendered)


# ─── Git ──────────────────────────────────────────────────────────────────────

def run_git(project_dir):
    """Run git init, add, and initial commit inside project_dir."""
    steps = [
        ["git", "init"],
        ["git", "add", "."],
        ["git", "commit", "-m", "Initial scaffold"],
    ]
    for cmd in steps:
        result = subprocess.run(cmd, cwd=project_dir, capture_output=True, text=True)
        if result.returncode != 0:
            abort(
                f"Git command failed: {' '.join(cmd)}\n"
                + result.stderr.strip()
            )


def open_in_vscode(project_dir):
    """
    Open project_dir in VS Code. Non-fatal — warns if 'code' is not in PATH
    but does not abort since the project was already created successfully.
    """
    result = subprocess.run(
        ["code", str(project_dir)],
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        print(f"\n  Warning: could not open VS Code.")
        print(f"  Make sure 'code' is in your PATH (VS Code: Cmd+Shift+P → 'Install code command').")
        print(f"  Run manually: code {project_dir}")
        return False
    return True


# ─── Validation ───────────────────────────────────────────────────────────────

def validate_slug(slug):
    if not re.match(r"^[a-z][a-z0-9\-]*$", slug):
        abort(
            f"Invalid slug: '{slug}'\n"
            "Must be lowercase, start with a letter, hyphens allowed.\n"
            "Example: my-new-startup"
        )


def validate_templates():
    for src, _ in TEMPLATE_MAP:
        if not src.is_dir():
            abort(f"Templates directory not found: {src}")


def validate_target(project_dir):
    if project_dir.exists():
        abort(
            f"Directory already exists: {project_dir}\n"
            "Choose a different slug or remove the existing directory first."
        )


def abort(message):
    print(f"\nError: {message}\n", file=sys.stderr)
    sys.exit(1)


# ─── Generator ────────────────────────────────────────────────────────────────

def generate(slug, preset_name, use_git, use_open, description=None):
    validate_slug(slug)
    validate_templates()

    project_dir  = PROJECTS_DIR / slug
    validate_target(project_dir)

    preset_data  = load_preset(preset_name) if preset_name else {}
    replacements = build_replacements(slug, preset_data, description)

    print()
    print(f"  slug    {slug}")
    print(f"  preset  {preset_name or '(none)'}")
    if description:
        print(f"  desc    {description}")
    print(f"  git     {'yes' if use_git else 'no'}")
    print(f"  open    {'yes' if use_open else 'no'}")
    print(f"  output  {project_dir}")
    print()

    unfilled = {}

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

            rel       = out_path.relative_to(project_dir)
            remaining = find_unfilled(rendered)

            status = f"  created  {rel}"
            if remaining:
                status += f"  ({len(remaining)} placeholders)"
                unfilled[str(rel)] = remaining
            print(status)

    for d in EXTRA_DIRS:
        (project_dir / d).mkdir(exist_ok=True)

    # Git — must succeed before we open VS Code
    git_ok = False
    if use_git:
        print("\n  Running git init...")
        run_git(project_dir)
        git_ok = True
        print("  git init + initial commit done")

    # Open VS Code — non-fatal, runs after everything else
    if use_open:
        print("\n  Opening VS Code...")
        open_in_vscode(project_dir)

    # Render the init prompt now so it's ready for print_summary
    init_prompt = render_init_prompt(replacements)

    print_summary(project_dir, preset_name, git_ok, unfilled, init_prompt)


# ─── Summary ──────────────────────────────────────────────────────────────────

def print_summary(project_dir, preset_name, git_ok, unfilled, init_prompt):
    w = 62

    # ── Status block ──
    print()
    print("─" * w)
    print(f"  Project  {project_dir}")
    if preset_name:
        print(f"  Preset   {preset_name}")
    print(f"  Git      {'initialized' if git_ok else 'skipped  (--git to enable)'}")
    print("─" * w)

    # ── Unfilled placeholders ──
    if unfilled:
        total = sum(len(v) for v in unfilled.values())
        print(f"\n  {total} placeholder(s) still need manual values:\n")
        for filepath, placeholders in unfilled.items():
            print(f"  {filepath}")
            for p in placeholders:
                print(f"    {p}")
    else:
        print("\n  All placeholders resolved.")

    # ── Next steps ──
    step = 1
    print("\n  Next steps:")
    print(f"    {step}.  cd {project_dir}") ; step += 1
    if unfilled:
        print(f"    {step}.  Fill in the placeholders above") ; step += 1
    if not git_ok:
        print(f"    {step}.  git init && git add . && git commit -m 'Initial scaffold'") ; step += 1
    print(f"    {step}.  Open VS Code: code .") ; step += 1
    print(f"    {step}.  Paste the init prompt below into Claude Code") ; step += 1

    # ── Init prompt ──
    if init_prompt:
        print()
        print("═" * w)
        print("  INIT PROMPT — copy everything below into Claude Code")
        print("═" * w)
        print()
        print(init_prompt)
        print()
        print("═" * w)
    print()


# ─── CLI ──────────────────────────────────────────────────────────────────────

def parse_args():
    parser = argparse.ArgumentParser(
        prog="create_project.py",
        description="App Factory — bootstrap a new app project from templates",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "examples:\n"
            "  python scripts/create_project.py my-startup\n"
            "  python scripts/create_project.py my-startup --preset next-supabase\n"
            "  python scripts/create_project.py my-startup --preset next-supabase --git --open\n"
            '  python scripts/create_project.py my-startup --preset next-supabase --describe "A tool for X" --git --open\n'
            "  python scripts/create_project.py --list"
        ),
    )
    parser.add_argument(
        "slug",
        nargs="?",
        help="project slug, e.g. my-new-startup",
    )
    parser.add_argument(
        "--preset",
        metavar="NAME",
        help="stack preset to apply (use --list to see options)",
    )
    parser.add_argument(
        "--git",
        action="store_true",
        help="run git init and create an initial commit after generation",
    )
    parser.add_argument(
        "--open",
        action="store_true",
        help="open the generated project in VS Code after generation",
    )
    parser.add_argument(
        "--describe",
        metavar="TEXT",
        help="one-line description of the app (fills ONE_LINE_DESCRIPTION in all templates)",
    )
    parser.add_argument(
        "--list",
        action="store_true",
        help="list available presets and exit",
    )
    return parser.parse_args()


def main():
    args = parse_args()

    if args.list:
        presets = list_presets()
        print("\nAvailable presets:\n")
        for p in presets:
            print(f"  {p}")
        print()
        sys.exit(0)

    if not args.slug:
        print(__doc__)
        sys.exit(1)

    generate(
        slug=args.slug.strip().lower(),
        preset_name=args.preset,
        use_git=args.git,
        use_open=args.open,
        description=args.describe,
    )


if __name__ == "__main__":
    main()
