#!/usr/bin/env bash
set -e

MODE="${1:-global}"
ROOT="$(pwd)"

echo "=== Dotfiles Doctor ($MODE) ==="
echo "Location: $ROOT"
echo

# ---------------------------------------------------------
# Project mode
# ---------------------------------------------------------
if [ "$MODE" = "--project" ]; then
  RESULT=0

  # 1. Check mise config
  if [ ! -f ".mise.toml" ]; then
    echo "[FAIL] .mise.toml not found"
    echo "       This project has no runtime contract"
    RESULT=1
  else
    echo "[OK]   .mise.toml found"
  fi

  # 2. Check direnv
  if [ ! -f ".envrc" ]; then
    echo "[FAIL] .envrc not found"
    RESULT=1
  else
    echo "[OK]   .envrc found"
  fi

  # 3. Check direnv allowed
  if command -v direnv >/dev/null; then
    if ! direnv status | grep -q "Found RC allowed true"; then
      echo "[WARN] direnv not allowed yet"
      echo "       Run: direnv allow"
    else
      echo "[OK]   direnv allowed"
    fi
  fi

  # 4. Check mise active
  if command -v mise >/dev/null; then
    if ! mise current >/dev/null 2>&1; then
      echo "[FAIL] mise not active in this shell"
      RESULT=1
    else
      echo "[OK]   mise active"
      mise current
    fi
  fi

  echo
  if [ "$RESULT" -eq 0 ]; then
    echo "Project runtime: HEALTHY"
  else
    echo "Project runtime: BROKEN"
    exit 1
  fi

  exit 0
fi

echo "Unknown mode: $MODE"
exit 1
