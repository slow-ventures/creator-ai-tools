# Slow Creator Hackathon - Show Notes


### Social Analytics Tracking & Analysis

- **Windsor.ai** — No-code data integration platform with 325+ connectors (Instagram, Facebook, TikTok Ads, YouTube, Threads, etc.). Has a Claude MCP server so you can query your social media analytics in natural language inside Claude.
  - Site: https://windsor.ai/
  - MCP docs: https://windsor.ai/documentation/windsor-mcp/
  - Claude integration guide: https://windsor.ai/documentation/windsor-mcp/how-to-integrate-data-into-claude/
  - GitHub: https://github.com/windsor-ai/windsor_mcp

- **TikApi** — Commercial unofficial TikTok API for scraping TikTok data (video metadata, comments, engagement, user profiles, hashtags, live streams). Offers JavaScript and Python SDKs.
  - Site: https://tikapi.io
  - GitHub SDK: https://github.com/tikapi-io/tiktok-api
  - Note: TikApi doesn't have its own MCP server, but see **tiktok-mcp** below for a Claude MCP option.

- **tiktok-mcp** (by Seym0n) — A Claude MCP server for read-only TikTok content analysis (video subtitles/transcripts, post details, search). Uses TikNeuron as its backend.
  - GitHub: https://github.com/Seym0n/tiktok-mcp

- **Phyllo** — Creator economy data infrastructure. Unified API to access creator profiles, content, engagement metrics, audience demographics, and earnings across 20+ platforms (Instagram, YouTube, TikTok, Twitch, X, LinkedIn, Pinterest, etc.). Also offers Phyllo IQ for influencer discovery across 250M+ creators.
  - Site: https://www.getphyllo.com/
  - API docs: https://docs.getphyllo.com
  - Social Data API: https://www.getphyllo.com/social-data-api
  - GitHub: https://github.com/getphyllo

---

### Media Tagging and Reuse

- **Gemini 3 Flash Preview** (`gemini-3-flash-preview`) — Google's multimodal model with strong image understanding. Use it for auto-tagging photos and videos with descriptions, categories, objects, people, locations, etc. Fast and cheap for bulk media analysis.
  - API docs: https://ai.google.dev/gemini-api/docs
  - Model ID: `gemini-3-flash-preview`

- **Gemini 3.1 Flash Image Preview** (`gemini-3.1-flash-image-preview`) — AKA "Nano Banana 2". Gemini model that can *generate* images in addition to understanding them. Useful for creating thumbnails, variations, or styled versions of existing media.
  - API docs: https://ai.google.dev/gemini-api/docs
  - Model ID: `gemini-3.1-flash-image-preview`

---

### Personal Workflow Management

- **Apollo.io** — Sales intelligence and engagement platform. Access a database of 270M+ contacts and 60M+ companies for lead enrichment, email finding, and outreach automation. Has a REST API for programmatic lookups.
  - Site: https://www.apollo.io
  - API docs: https://apolloio.github.io/apollo-api-docs/

- **People Data Labs (PDL)** — Person and company data API for enrichment, search, and identity resolution. Access 3B+ person profiles with emails, jobs, social links, education, and more. Great for enriching CRM records or building audience profiles.
  - Site: https://www.peopledatalabs.com
  - API docs: https://docs.peopledatalabs.com
  - GitHub: https://github.com/peopledatalabs

---

### Showing Data on a Map

- **Leaflet.js** — Lightweight open-source JavaScript library for interactive maps (~42 KB gzipped). Supports tile layers, markers, popups, polygons, and more. Mobile-friendly and works across all major browsers.
  - Site: https://leafletjs.com
  - GitHub: https://github.com/Leaflet/Leaflet
  - **react-leaflet** — React wrapper for Leaflet, the standard way to use it in Next.js apps.
    - Site: https://react-leaflet.js.org
    - GitHub: https://github.com/PaulLeCam/react-leaflet
    - Install: `npm install leaflet react-leaflet @types/leaflet`
    - Note: Requires `"use client"` and `dynamic(() => import(...), { ssr: false })` in Next.js since Leaflet needs the browser DOM.

---

### Stripe Payments

- **Stripe** — Payment processing platform for internet businesses. Handles subscriptions, one-time payments, invoicing, payouts, and more.
  - Site: https://stripe.com
  - Docs: https://docs.stripe.com

- **Stripe CLI** — Command-line tool for testing and managing your Stripe integration locally. Lets you trigger webhook events, tail API logs, and create test resources without leaving the terminal.
  - Install (macOS): `brew install stripe/stripe-cli/stripe`
  - Docs: https://docs.stripe.com/stripe-cli
  - Login: `stripe login` (authenticates with your Stripe account)

- **Stripe Claude Skills** — Pre-built Claude Code skills for working with Stripe. Adds slash commands and tools so Claude can help you build Stripe integrations, create checkout sessions, manage subscriptions, and more.
  - Install all skills: `npx skills add --all https://docs.stripe.com`
  - Docs: https://docs.stripe.com/claude-code

---

## TAs — Tanooki Labs

Need help? Reach out to the TAs from [Tanooki Labs](https://tanookilabs.com):

| Name | Contact |
|------|---------|
| Dave Renz | dave `[at]` tanookilabs `[dot]` com |
| Eric Skiff | eric `[at]` tanookilabs `[dot]` com |
