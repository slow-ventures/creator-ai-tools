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

### Instagram Scraping

- **Apify** — Web scraping and automation platform with pre-built "actors" for scraping Instagram profiles, posts, captions, metadata, and more. Pay-as-you-go pricing starts at ~$5 to get going. Handles the hard parts of scraping (rate limits, login, pagination) so you don't have to.
  - Site: https://apify.com
  - Instagram scraper: https://apify.com/apify/instagram-scraper
  - Docs: https://docs.apify.com
  - Note: Getting actual video content analysis is more expensive, but profile/post metadata and captions are cheap.

---

### Shopify Product Data (No Scraping Needed)

- **Shopify `.json` trick** — If a brand is on Shopify, you can get all their product data without scraping. Just append `.json` to any product page URL and you get structured JSON with product descriptions, images (high-res), variants, pricing, and more. Shopify publishes this so Google can index it — and you can use it too.
  - Example: `https://example-brand.com/products/cool-shirt` → `https://example-brand.com/products/cool-shirt.json`
  - Returns: product title, description, images (with CDN URLs), variants, prices, tags, etc.
  - Also works on collection pages: `https://example-brand.com/collections/all.json`
  - Tip: Use this instead of image scraping when the brand runs on Shopify — you get high-res images directly from their CDN.

---

### Messaging & WhatsApp Integration

- **Twilio** — Cloud communications platform for SMS, WhatsApp, voice, email, and more. Use their API to send and receive messages programmatically. Supports WhatsApp Business API, Facebook Messenger, and other messaging channels.
  - Site: https://www.twilio.com
  - WhatsApp docs: https://www.twilio.com/docs/whatsapp
  - SMS docs: https://www.twilio.com/docs/sms
  - Note: For local development, pair with **ngrok** (below) so Twilio webhooks can reach your localhost.

- **ngrok** — Tunneling tool that exposes your local development server to the internet with a public URL. Essential for testing webhooks (Stripe, Twilio, etc.) during local development. Once you deploy to production, you won't need it anymore.
  - Site: https://ngrok.com
  - Install (macOS): `brew install ngrok`
  - Usage: `ngrok http 3000` (creates a public URL that forwards to your localhost:3000)
  - Free tier available for basic use.

---

### Cloud Hosting

- **Vercel** — Where most hackathon participants deployed. Connects to your GitHub repo and deploys on every push — no servers or Docker to deal with. Using a managed platform like this means you're not debugging infrastructure when you should be building. Going forward, we'll add the database through Vercel's Neon integration so there's less to set up and fewer moving parts — one marketplace, one dashboard.
  - Site: https://vercel.com
  - Docs: https://vercel.com/docs
  - Neon Postgres via Vercel Marketplace: https://vercel.com/marketplace/neon

- **Digital Ocean** — Cloud infrastructure provider. Simpler and more beginner-friendly alternative to AWS. Good for deploying apps, databases, and background workers.
  - Site: https://www.digitalocean.com
  - App Platform docs: https://docs.digitalocean.com/products/app-platform/

---

### AI Company & Operations Tools

- **General Intelligence** — A new startup building an AI-powered platform that claims to let you create and run a company within their product, including marketing and operations handled by AI agents. Still very early stage but worth watching.
  - Site: https://generalintelligence.com

---

### Development Workflows & Strategies

- **Ralph Loops** — A Claude Code development workflow named after Ralph Wiggum ("just dumb, but he'll keep trying"). The idea: give Claude a task, and when it fails, it checks its own work and retries automatically. The key trifecta workflow:
  1. **Plan** — Break the feature into bite-sized chunks
  2. **Ticket** — Create Linear tickets for each chunk
  3. **Smoke test** — Define what "done" looks like
  4. **Ralph Loop** — Let Claude keep trying until each chunk passes its smoke test
  - This lets you prompt just a few times and then let Claude grind through the implementation. Multiple participants cited this as the biggest unlock from the hackathon.

- **Linear + Claude Code workflow** — Use Claude to create tickets in Linear from your implementation plan, then knock them out one by one with Claude Code. Keeps work organized and gives you a clear backlog to work through.

---

### Hardware

- **Espresso Display** — Portable 4K touchscreen monitor. Touch input lets you circle things and draw on screen, which is helpful for vibe coding sessions. Lightweight and easy to bring to hackathons.
  - Site: https://espres.so

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

### Design Tweaks

- **Design in the Browser** — Tool for making small design tweaks directly in the browser. Helpful for quick visual adjustments without jumping back to code.
  - Site: https://designinthebrowser.com/

---

### Web Scraping & Content Extraction

- **Firecrawl** — Web scraping and crawling API that extracts clean content from websites. Particularly useful for getting past strict AI blockers on sites like Net-a-Porter and other fashion/e-commerce sites that aggressively block scrapers.
  - Site: https://www.firecrawl.dev/

---

## TAs — Tanooki Labs

Need help? Reach out to the TAs from [Tanooki Labs](https://tanookilabs.com):

| Name | Contact |
|------|---------|
| Dave Renz | dave `[at]` tanookilabs `[dot]` com |
| Eric Skiff | eric `[at]` tanookilabs `[dot]` com |
