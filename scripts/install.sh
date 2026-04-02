#!/usr/bin/env bash
# install.sh — Add the `new-app` command to ~/.zshrc
#
# Usage:
#   bash scripts/install.sh
#
# What it does:
#   - Detects the absolute path of this app-factory repo
#   - Appends a new-app() zsh function to ~/.zshrc (once — safe to re-run)
#   - Prints instructions for activating and testing the command
#
# To undo:
#   Open ~/.zshrc and remove the block between the two marker lines:
#     # >>> app-factory <<<
#     ...
#     # <<< app-factory <<<

set -euo pipefail

# ─── Config ──────────────────────────────────────────────────────────────────

MARKER="# >>> app-factory <<<"
ZSHRC="$HOME/.zshrc"

# Resolve factory root from the location of this script
FACTORY_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SCRIPT_PATH="$FACTORY_DIR/scripts/create_project.py"

# ─── Checks ──────────────────────────────────────────────────────────────────

# Verify the generator script exists at the expected path
if [[ ! -f "$SCRIPT_PATH" ]]; then
    echo ""
    echo "Error: generator script not found at:"
    echo "  $SCRIPT_PATH"
    echo ""
    echo "Run this script from inside the app-factory repo:"
    echo "  bash scripts/install.sh"
    exit 1
fi

# Create ~/.zshrc if it doesn't exist
if [[ ! -f "$ZSHRC" ]]; then
    echo ""
    echo "Creating $ZSHRC (it did not exist)..."
    touch "$ZSHRC"
fi

# ─── Deduplication check ─────────────────────────────────────────────────────

if grep -qF "$MARKER" "$ZSHRC"; then
    echo ""
    echo "  new-app is already installed in $ZSHRC"
    echo ""
    echo "  To update the factory path (if you moved the repo), remove the"
    echo "  block between the marker lines and re-run this script:"
    echo ""
    echo "    $MARKER"
    echo "    ..."
    echo "    # <<< app-factory <<<"
    echo ""
    exit 0
fi

# ─── Append the function block ────────────────────────────────────────────────

cat >> "$ZSHRC" << EOF

$MARKER
# App Factory — project generator
# Source: $FACTORY_DIR
# To remove: delete this block from ~/.zshrc
new-app() {
    python3 "$SCRIPT_PATH" "\$@"
}
# <<< app-factory <<<
EOF

# ─── Done ────────────────────────────────────────────────────────────────────

echo ""
echo "  Installed new-app → $SCRIPT_PATH"
echo ""
echo "  Activate it now:"
echo "    source ~/.zshrc"
echo ""
echo "  Then test it:"
echo "    new-app --list"
echo "    new-app my-startup --preset next-supabase --git --open"
echo ""
