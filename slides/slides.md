---
theme: default
title: "Slow Hackathon 201 - Advanced AI Coding"
---

# Slow Hackathon 201

## Advanced AI Coding

---

# How to Build Complex Apps

- Building on real frameworks — [Bullet Train](https://bullettrain.co/)
- MVC architecture with background workers — [Sidekiq](https://sidekiq.org/)
- [Postgres](https://www.postgresql.org/), [Redis](https://redis.io/), Hosting
- Authentication and authorization — [Devise](https://github.com/heartcombo/devise)
- Modules / Gems / Packages
- Migrations
- File storage & handling — [Active Storage](https://guides.rubyonrails.org/active_storage_overview.html), [S3](https://aws.amazon.com/s3/)
- CI suite — [GitHub Actions](https://github.com/features/actions)
- [Tailwind](https://tailwindcss.com/) and [ShadCN](https://ui.shadcn.com/)
- Real product process

---

# Discuss the Feature in Depth

<div class="flex gap-8 items-center mt-8">
  <div class="flex-1">
    <a href="https://superwhisper.com/download">
      <img src="/images/superwhisper.png" class="h-48 rounded shadow" />
    </a>
    <p class="text-sm mt-2 opacity-70"><a href="https://superwhisper.com/download">Superwhisper</a></p>
  </div>
  <div class="flex-1">
    <a href="https://otter.ai">
      <img src="/images/otter.png" class="h-48 rounded shadow" />
    </a>
    <p class="text-sm mt-2 opacity-70"><a href="https://otter.ai">Otter.ai</a> / <a href="https://fathom.video">Fathom</a></p>
  </div>
</div>

---

# Plan It

- Plan mode, reading and discussing the plan
- [Mermaid](https://mermaid.js.org/) diagrams and database structure
- Commit the plan to `./docs`
- Ticket-sized chunks (todowrite, beads, [Linear](https://linear.app/), etc)

<img src="/images/mermaid.png" class="absolute bottom-4 right-8 h-80 rounded shadow" />

---

# Build It

- `/ralph-loop`
- Autonomous coding with guardrails
- Iterate on implementation

---

# Test It

- `/run-ci-local`
- Smoke test with Chrome
- QA it yourself

---

# Chrome Integration

Two options for browser testing:

**Claude in Chrome** (recommended) — uses the [Chrome extension](https://chromewebstore.google.com/detail/claude/fcoeoabgfenejglbffodgkkbkcdhcgfn)

```bash
claude --chrome
```

**Chrome DevTools MCP** — uses [chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp)

```bash
claude mcp add chrome-devtools -- npx chrome-devtools-mcp@latest
```

Both let Claude navigate pages, click, fill forms, read console errors, take screenshots, and run Lighthouse audits.

---

# Chrome in Action

```text
Open localhost:3000, try submitting the login form
with invalid data, and check if the error messages
appear correctly.
```

```text
Check the console for errors on the dashboard page.
```

```text
Record a GIF showing the checkout flow from cart
to confirmation.
```

Shares your browser's login state — works with authenticated apps.

---

# Making a Custom Skill: `/run-ci-local`

Create `.claude/skills/run-ci-local/SKILL.md`:

```yaml
---
name: run-ci-local
description: Run the full local CI suite
allowed-tools: Bash Read Grep
---
```

Then add instructions in markdown:

```md
Run these checks in order, report results for each:

1. Formatting — pnpm prettier --check .
2. Type checking — pnpm run type-check
3. Tests — bundle exec rspec
```

Invoke with `/run-ci-local` — Claude runs each step and reports a summary.

---

# Skill Anatomy

```yaml
---
name: run-ci-local # the /slash-command name
description: Run local CI # shown in menu, used for auto-invocation
allowed-tools: Bash Read Grep # restrict what tools Claude can use
disable-model-invocation: true # only YOU can trigger it
---
```

- Markdown body = instructions Claude follows when invoked
- Lives in `.claude/skills/<name>/SKILL.md` — checked into git, shared with your team
- Can use `$ARGUMENTS` for parameters: `/run-ci-local spec/models`
- Can inject live context: `` Branch: !`git branch --show-current` ``

---

# Ship It

- Pull request
- Code review
- Deploy

---

# Deploy with Vercel

**Step 1** — Add the [Vercel MCP](https://vercel.com/docs/agent-resources/vercel-mcp):

```bash
claude mcp add --transport http vercel https://mcp.vercel.com
```

**Step 2** — Deploy:

```text
Deploy this project to Vercel as a preview.
```

On first use, your browser opens for OAuth — authorize and you're connected. Claude handles the deploy, reads build logs, and fixes errors in one loop.

---

# Vercel MCP Capabilities

Beyond deploying, Claude can:

- Check deployment status and build logs
- Debug failed deployments and fix the code
- Manage environment variables
- Search [Vercel docs](https://vercel.com/docs) for you

Project-specific URL for auto-context:

```text
https://mcp.vercel.com/<team-slug>/<project-slug>
```

---

# Complex Patterns and Solutions

---

# Background Jobs & Scheduling

**Rails** — [Sidekiq](https://sidekiq.org/) + Redis, [Solid Queue](https://github.com/rails/solid_queue), [Sidekiq-Cron](https://github.com/sidekiq-cron/sidekiq-cron)

**Next.js on Vercel:**

- [Trigger.dev](https://trigger.dev/) — define tasks, call from your app, runs on their infra (no timeouts). Closest to Sidekiq. Free tier: 1k runs/mo.
- [Vercel Cron Jobs](https://vercel.com/docs/cron-jobs) — built-in, hits a route on a schedule. Good for periodic tasks.
- `after()` — fire-and-forget work after sending a response. Built into Next.js.

Vercel functions have a hard timeout (60s Hobby / 300s Pro) — use Trigger.dev for anything longer.

---

# Media & Communications

- Image and video thumbnails — [Active Storage](https://guides.rubyonrails.org/active_storage_overview.html), [libvips](https://www.libvips.org/)
- Phone / text — [Twilio](https://twilio.com/)
- Email — [SendGrid](https://www.twilio.com/en-us/sendgrid), [Postmark](https://postmarkapp.com/)
- Push notifications — [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging), [OneSignal](https://onesignal.com/)

---

# Integrating AI

- Image generation — [DALL-E](https://platform.openai.com/docs/guides/images), [Stable Diffusion](https://stability.ai/)
- Video generation — [Runway](https://runwayml.com/), [Kling](https://klingai.com/)
- Speech to text / Text to speech — [Whisper](https://platform.openai.com/docs/guides/speech-to-text), [ElevenLabs](https://elevenlabs.io/)
- Document understanding — [Claude](https://docs.anthropic.com/en/docs/build-with-claude/pdf-support)
- Chatbots on site
- Image understanding — [Claude Vision](https://docs.anthropic.com/en/docs/build-with-claude/vision)

---

# Performance & APIs

- N+1 queries — [Bullet gem](https://github.com/flyerhzm/bullet)
- Database indexes
- REST and [GraphQL](https://graphql-ruby.org/) APIs
- Agents and communication channels
- Training classic ML models using generated training sets

---

# Further Topics

---

# Idea to Product

Building the whole product: going from idea to PRD to build

---

# Embedded Agents

Building agents into your SaaS apps with APIs and tool use

- [Anthropic SDK](https://docs.anthropic.com/en/docs/initial-setup), [Slack](https://api.slack.com/), [Discord](https://discord.com/developers/docs)
- How to keep context (threads!)

---

# The Centaur Model

Combining traditional code, database backend, and an agentic frontend for super-powerful bots

- YesCoach, Nines, etc

---

# Blitzdesign

Using skills to emulate an agency from brand to logo to videos to finished site

- ReturnTech and client review processes

---

# Claude at Agency Scale

How we're using Claude across 1000+ hours of billable a month at our dev shop

- Dev process, pull requests, testing and accountability
- Impedance matching speed and flexibility vs risks
- Automating security scans and performance tuning

---

# Image Gen at Scale

Scaling production of AI imagery to brand-approved site assets across hundreds of SKUs

- Workflows, human-in-the-loop reviewers
- Automated AI QA review and agents
- Nines demo

---

# Claude Code for Non-Coders

Why you should run your life from the terminal and git repos

- Bizdev
- PM process
- Creative writing
