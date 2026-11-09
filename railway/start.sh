#!/bin/sh
set -eu
H=/home/onw
mkdir -p "$H/.open-net-worth" "$H/.claude" "$H/.codex" "$H/.local/share/opencode"
chown -R onw:onw "$H" 2>/dev/null || true
if [ -z "${AUTH_PASSWORD:-}" ] && [ -z "${AUTH_PASSWORD_HASH:-}" ] && [ ! -s "$H/.open-net-worth/data/auth.json" ]; then
  echo "onw-railway: AUTH_PASSWORD is empty and no password is stored yet; nobody could sign in. Set AUTH_PASSWORD." >&2
  exit 1
fi
export HOME="$H"
exec setpriv --reuid=onw --regid=onw --init-groups -- "$@"
