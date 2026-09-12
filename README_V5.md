# Warrior Aspirants V5 — Continuous Update Architecture

This version separates **app features** from **changeable study content**.

## What updates without a new APK
- Topics/theory/tricks/examples
- Questions
- Daily tasks
- Videos/references when represented in cloud content
- Future current affairs/content packs

## Architecture
- Android app: native Java, no runtime dependency required for cloud sync.
- Content API: `server/server.js` (Express + JSON storage for the starter setup).
- Private admin panel: `admin/index.html`.

## One-time setup
1. Deploy `server/` + `content.json` to a small Node host.
2. Set environment variable `ADMIN_TOKEN` to a strong secret.
3. Put the server URL in `app/src/main/res/values/strings.xml` as `content_api_url`.
4. Build/install Warrior Aspirants V5 once.
5. Open the admin panel, load content, edit JSON, and press **PUBLISH UPDATE**.

After that, content changes are pulled by the app at startup; no APK rebuild is required for content-only updates.

## Important
This ZIP is **cloud-ready**, but I cannot deploy a private server into your account or create credentials without access to your hosting/database account. The app falls back to its built-in starter content until `content_api_url` points to your deployed API.

FIGHTER remains a UI/foundation in this build; live AI should use a secure backend and never expose an API key in the APK.


## FIGHTER live AI (new in V5)
The app now calls the secure server endpoint `/api/fighter`. Keep the OpenAI API key ONLY on the server, never inside the APK. Set these environment variables on your server: `OPENAI_API_KEY=your_key` and optionally `FIGHTER_MODEL=gpt-5.6-luna`. The Android app uses the same `content_api_url` base URL for both content sync and FIGHTER.
