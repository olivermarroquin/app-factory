#!/usr/bin/env bash
# install.sh — Add app-factory shell commands to ~/.zshrc
#
# Installs:
#   new-app    — scaffold a new app project
#   fill-docs  — generate a ready-to-paste doc-fill prompt from a filled intake
#
# Usage:
#   bash scripts/install.sh
#
# Safe to re-run — each function is installed at most once.
#
# To undo:
#   Remove the blocks between their marker lines in ~/.zshrc:
#     # >>> app-factory <<<  ...  # <<< app-factory <<<
#     # >>> app-factory fill-docs <<<  ...  # <<< app-factory fill-docs <<<

set -euo pipefail

# ─── Config ───────────────────────────────────────────────────────────────────

ZSHRC="$HOME/.zshrc"

NEW_APP_MARKER="# >>> app-factory <<<"
FILL_DOCS_MARKER="# >>> app-factory fill-docs <<<"

# Resolve factory root from location of this script
FACTORY_DIR="$(cd "$(dirname "$0")/.." && pwd)"
NEW_APP_SCRIPT="$FACTORY_DIR/scripts/create_project.py"
FILL_DOCS_SCRIPT="$FACTORY_DIR/scripts/render_fill_docs_prompt.py"

# ─── Checks ───────────────────────────────────────────────────────────────────

if [[ ! -f "$NEW_APP_SCRIPT" ]]; then
    echo ""
    echo "Error: script not found: $NEW_APP_SCRIPT"
    echo "Run this from inside the app-factory repo: bash scripts/install.sh"
    exit 1
fi

if [[ ! -f "$FILL_DOCS_SCRIPT" ]]; then
    echo ""
    echo "Error: script not found: $FILL_DOCS_SCRIPT"
    echo "Run this from inside the app-factory repo: bash scripts/install.sh"
    exit 1
fi

if [[ ! -f "$ZSHRC" ]]; then
    echo ""
    echo "Creating $ZSHRC (it did not exist)..."
    touch "$ZSHRC"
fi

# ─── Install new-app ──────────────────────────────────────────────────────────

if grep -qF "$NEW_APP_MARKER" "$ZSHRC"; then
    echo ""
    echo "  new-app   already in $ZSHRC"
else
    cat >> "$ZSHRC" << EOF

$NEW_APP_MARKER
# App Factory — project generator
# Source: $FACTORY_DIR
# To remove: delete this block from ~/.zshrc
new-app() {
    python3 "$NEW_APP_SCRIPT" "\$@"
}
# <<< app-factory <<<
EOF
    echo ""
    echo "  new-app   installed → $NEW_APP_SCRIPT"
fi

# ─── Install fill-docs ────────────────────────────────────────────────────────

if grep -qF "$FILL_DOCS_MARKER" "$ZSHRC"; then
    echo "  fill-docs already in $ZSHRC"
else
    cat >> "$ZSHRC" << EOF

$FILL_DOCS_MARKER
# App Factory — doc-fill prompt generator
# Source: $FACTORY_DIR
# To remove: delete this block from ~/.zshrc
fill-docs() {
    python3 "$FILL_DOCS_SCRIPT" "\${1:-.}"
}
# <<< app-factory fill-docs <<<
EOF
    echo "  fill-docs installed → $FILL_DOCS_SCRIPT"
fi

# ─── Done ─────────────────────────────────────────────────────────────────────

echo ""
echo "  Activate:"
echo "    source ~/.zshrc"
echo ""
echo "  Usage:"
echo "    new-app my-startup --preset next-supabase --git --open"
echo "    fill-docs                  # from inside the project"
echo "    fill-docs ~/projects/my-startup  # from anywhere"
echo ""
