#!/usr/bin/env bash
# Install the congressional-advocacy skill for Claude Code and/or Codex.
# Usage: ./install.sh [claude|codex|all]   (default: all)
set -euo pipefail

SKILL="congressional-advocacy"
SRC="$(cd "$(dirname "$0")" && pwd)/skills/$SKILL"
TARGET="${1:-all}"

install_to() {
  local dest="$1/$SKILL"
  mkdir -p "$1"
  rm -rf "$dest"
  cp -R "$SRC" "$dest"
  echo "Installed: $dest"
}

case "$TARGET" in
  claude) install_to "$HOME/.claude/skills" ;;
  codex)  install_to "$HOME/.codex/skills" ;;
  all)    install_to "$HOME/.claude/skills"; install_to "$HOME/.codex/skills" ;;
  *) echo "Usage: $0 [claude|codex|all]" >&2; exit 1 ;;
esac
