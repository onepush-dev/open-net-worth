# Open Net Worth on Railway

Open Net Worth — a self-hosted AI personal-finance ledger and agent: accounts, holdings, net worth and an AI analyst that works on your own books. Deploy on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/TEMPLATE_CODE)

This repository packages the official [Open Net Worth](https://github.com/open-net-worth-ai/open-net-worth) image (`ghcr.io/open-net-worth-ai/open-net-worth:0.1.43`, AGPL-3.0) for Railway. It is an independent community packaging, not affiliated with or endorsed by the Open Net Worth project.

## What you get

- One service from `ghcr.io/onepush-dev/open-net-worth:0.1.43`: the upstream image unmodified plus a start script that fixes volume ownership, drops to the unprivileged `onw` user and listens dual-stack on `$PORT` (8080).
- **Password login from the first second**: `AUTH_PASSWORD` is generated per deploy and seeds the instance password on first boot (no first-visitor setup race). Change it later in Settings → Security; after that the stored password wins.
- **Persistent data** on one Railway volume at `/home/onw`: SQLite ledger, caches, logs, backups and any Claude Code / Codex / OpenCode CLI sign-ins.

## Use it

1. Open `https://<your-domain>/` and sign in with `AUTH_PASSWORD` (service Variables tab).
2. Add an AI provider in **Settings → AI Model** (Anthropic, OpenAI or compatible key), or sign a CLI in over `railway ssh` (e.g. `codex login --device-auth`). The ledger itself works without AI.
3. Optional: set `AUTH_API_TOKEN` for scripted/API access.

## Notes

- Back up the `/home/onw` volume; it is your whole financial book.
- `ONW_DATABASE_URL` can point at Postgres instead of the default SQLite.
