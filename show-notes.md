# Slow Creator Hackathon - Show Notes

## Teams

---

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

*(links coming soon)*

---

### Personal Workflow Management

*(links coming soon)*

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

## Links Mentioned
