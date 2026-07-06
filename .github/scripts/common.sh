#!/usr/bin/env bash
set -euo pipefail

CONFIG_PATH="${CONFIG_PATH:-.github/agent-prompts/config.yml}"

log() { echo "[agentic-sdlc] $*"; }

require_file() {
  local f="$1"
  [[ -f "$f" ]] || { echo "Missing file: $f"; exit 1; }
}

yaml_get() {
  local key="$1"
  python3 - "$CONFIG_PATH" "$key" <<'PY'
import sys, yaml
cfg_path, key = sys.argv[1], sys.argv[2]
with open(cfg_path, "r", encoding="utf-8") as f:
    data = yaml.safe_load(f)
cur = data
for part in key.split('.'):
    if isinstance(cur, dict) and part in cur:
        cur = cur[part]
    else:
        cur = ""
        break
if isinstance(cur, bool):
    print("true" if cur else "false")
elif cur is None:
    print("")
else:
    print(cur)
PY
}

ensure_dir() { mkdir -p "$1"; }

slugify() {
  local s="$1"
  echo "$s" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g'
}