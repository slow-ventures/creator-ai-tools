# Hackathon Starter: Next.js + Better Auth + Prisma

> **[Show Notes: Tools, APIs & Strategies from the Hackathon](show-notes.md)** — Everything we covered: Ralph loops, Apify, Shopify JSON trick, Twilio, Stripe, data enrichment, mapping, and more.
>
> **[Eric's 201 Talk Slides](slides/slides.md)** — Advanced AI coding: complex apps, Ralph loops, Chrome integration, custom skills, deployment, background jobs, and more.

Pre-configured for the AI Bootcamp with Slow Creator Fund. Uses Better Auth for email/password authentication and Prisma ORM for type-safe database queries. No third-party auth services — everything runs through your own database.

## What's Included

- **Next.js** (App Router) with TypeScript
- **Better Auth** for email/password authentication (database sessions, built-in API endpoints)
- **Prisma ORM** for type-safe database queries (schema-first, auto-syncs to your database)
- **Tailwind CSS** + **shadcn/ui** components
- **Claude Code config** (CLAUDE.md + custom slash commands)
- **Automatic database migrations** on every Vercel deploy
- Ready to deploy on **Vercel**

## Prerequisites

Make sure you have all of these installed before starting. Click the **Setup guide** link for detailed step-by-step instructions.

| Prerequisite | Quick Download | Setup Guide |
| ------------ | -------------- | ----------- |
| **Node.js & npm** | [nodejs.org](https://nodejs.org/) (LTS) | [Step-by-step guide](guides/prerequisites/nodejs.md) |
| **Git** | Mac: `xcode-select --install` · Win: [git-scm.com](https://git-scm.com/) | [Step-by-step guide](guides/prerequisites/git.md) |
| **GitHub & GitHub CLI** | [github.com](https://github.com/) · [cli.github.com](https://cli.github.com/) | [Step-by-step guide](guides/prerequisites/github.md) |
| **VS Code** | [code.visualstudio.com](https://code.visualstudio.com/) | [Step-by-step guide](guides/prerequisites/vscode.md) |
| **Claude Code** | `npm install -g @anthropic-ai/claude-code` | [Step-by-step guide](guides/prerequisites/claude-code.md) |
| **Vercel** | [vercel.com](https://vercel.com/) (sign in with GitHub) | [Step-by-step guide](guides/prerequisites/vercel.md) |
| **Neon** | [neon.tech](https://neon.tech/) | [Step-by-step guide](guides/prerequisites/neon.md) |

Verify your tools are installed:

```bash
node --version    # v22.x.x
npm --version     # 10.x.x
git --version     # 2.x.x
gh --version      # 2.x.x
claude --version
```

## Quick Start

### 1. Clone the template and install

```bash
git clone https://github.com/slow-ventures/creator-ai-tools.git slow-hackathon
cd slow-hackathon
rm -rf .git
npm install
```

The `rm -rf .git` removes the template's git history so you start fresh with your own repo.

### 2. Initialize Git and create a GitHub repository

Your project needs its own Git repository so you can save your work and deploy to Vercel.

Initialize Git and make your first commit:

```bash
git init
git add .
git commit -m "initial commit from hackathon starter"
```

Now you need a GitHub repository to push your code to. Pick **one** of the two options below:

#### Option A: Using the GitHub CLI (if you have it installed)

```bash
gh repo create slow-hackathon --public --source=. --push
```

This creates a new repo on GitHub and pushes your code in one step. Done!

#### Option B: Create the repo on GitHub.com (works for everyone)

1. Go to [github.com/new](https://github.com/new)
2. Enter a **Repository name** (e.g., `slow-hackathon`)
3. Leave it set to **Public**
4. **Do NOT** check "Add a README file" — your project already has files
5. Click **Create repository**
6. GitHub will show you a page with setup instructions. Find the section that says **"…or push an existing repository from the command line"** and copy the URL. It will look like `https://github.com/YOUR-USERNAME/slow-hackathon.git`
7. Back in your terminal, run these two commands (replace the URL with yours):

```bash
git remote add origin https://github.com/YOUR-USERNAME/slow-hackathon.git
git push -u origin main
```

8. Refresh the GitHub page — you should see all your project files

### 3. Configure local environment

```bash
cp .env.example .env
```

Now generate a secret key for authentication. Run this in your terminal:

```bash
openssl rand -base64 32
```

This prints a random secret string. Copy it, open `.env` in your editor, and paste it as the value for `BETTER_AUTH_SECRET`. Leave the file open — you'll fill in the database credentials in the next step.

### 4. Set up Neon

You'll create a **Neon project** with two branches — one for development and one for production. This keeps your dev data completely separate from your live app.

1. Go to [console.neon.tech](https://console.neon.tech/)
2. Create a project named `slow-hackathon`
3. On the project dashboard, go to **Connection Details**
4. Select **Prisma** from the framework dropdown
5. Copy the `DATABASE_URL` and `DIRECT_URL`

> ⚠️ **Important:** You need both URLs. `DATABASE_URL` uses the connection pooler (has `-pooler` in the hostname). `DIRECT_URL` is for migrations and uses the direct connection.

Paste your connection strings into `.env`:
- `DATABASE_URL` — your Neon pooled connection string
- `DIRECT_URL` — your Neon direct connection string

### 5. Push the database schema

```bash
npm run db:push
```

This creates the auth tables in your dev database.

### 6. Seed demo users (optional)

```bash
npm run db:seed
```

This creates 3 demo accounts you can sign in with right away (password for all: `password`):
- alice@example.com
- bob@example.com
- charlie@example.com

### 7. Run it

```bash
npm run dev
```

Open [localhost:3000](http://localhost:3000) in your browser. You can sign up with any email/password.

### 8. Deploy to Vercel

Your project has two branches: `main` (where you work) and `production` (what Vercel deploys). This means you can push code to `main` as much as you want without affecting your live site. When you're ready to go live, you push to `production`.

#### Link your project

```bash
npx vercel link
```

This will ask you to log in (opens a browser), then connects your local project to Vercel. Accept the default settings when prompted.

#### Set the production branch

Go to your project on [vercel.com](https://vercel.com/), then **Settings → Git → Production Branch** and change it from `main` to `production`.

This is the only step that requires the Vercel dashboard — everything else is done from the terminal.

#### Add production environment variables

```bash
npx vercel env add BETTER_AUTH_SECRET production
```

When prompted, paste the same secret you generated in step 3 and press Enter.

```bash
npx vercel env add BETTER_AUTH_URL production
```

Enter your production URL (e.g., `https://slow-hackathon.vercel.app`).

```bash
npx vercel env add DATABASE_URL production
```

Paste your **prod** Neon pooled connection string (has `-pooler` in hostname).

```bash
npx vercel env add DIRECT_URL production
```

Paste your **prod** Neon direct connection string.

#### Deploy

Push your code to the `production` branch to trigger a deploy:

```bash
git push origin main:production
```

This pushes your `main` branch to `production` on GitHub. Vercel will build your app and give you a live URL (e.g., `slow-hackathon.vercel.app`).

Database schema migrations run automatically — the build command runs `prisma db push` before `next build`, so your production database stays in sync with your code.

#### Deploying updates

Every time you want to update your live site, push to `production`:

```bash
git push origin main:production
```

Or use the `/deploy` slash command in Claude Code, which does this for you.

## How It Works: Dev vs Production

```
LOCAL DEVELOPMENT (main branch)
  .env → DATABASE_URL + DIRECT_URL point to your Neon dev branch
  npm run db:push → syncs schema to dev database
  npm run dev → runs app against dev database
  git push → pushes to main (does NOT deploy)

PRODUCTION (production branch → Vercel)
  git push origin main:production → triggers Vercel deploy
  Vercel env vars → DATABASE_URL + DIRECT_URL point to your Neon prod branch
  Vercel builds → prisma db push syncs schema to prod database → next build runs
  Your app and production database are both updated
```

| Environment | Database | How Schema Gets Updated |
|-------------|----------|------------------------|
| **Local dev** | Neon dev branch (from `.env`) | You run `npm run db:push` |
| **Production** | Neon prod branch (from Vercel env vars) | Automatic on every `git push origin main:production` |

## Using Claude Code

This project comes with a `CLAUDE.md` and custom slash commands pre-configured. Open Claude Code in this directory and try:

| Command      | What It Does                                                       |
| ------------ | ------------------------------------------------------------------ |
| `/plan`      | Turn your idea into a requirements + build plan                    |
| `/build`     | Execute the plan step by step                                      |
| `/add-table` | Add a new model to the Prisma schema                               |
| `/add-ai`    | Add an AI feature (image gen, text gen, chat)                      |
| `/design`    | Build or redesign a UI from a description                          |
| `/fix`       | Debug and fix the current error                                    |
| `/snapshot`  | Save a local git checkpoint                                        |
| `/deploy`    | Commit, push to GitHub, and deploy (schema migrates automatically) |
| `/help`      | Show all available commands and tips                                |

## Adding Features

Tell Claude Code what you want to add. Some examples:

- "Add a dashboard page that shows a list of my brand deals"
- "Add image generation using Replicate — let users describe an image and generate it"
- "Add a contact form that saves submissions to the database"
- "Add Stripe checkout so users can buy my digital products"

## Authentication

Authentication uses **Better Auth** with email/password. Sessions are stored in the database (not JWTs), so they can be revoked at any time.

### Get the current user in a Server Component or Server Action

```typescript
import { auth } from "@/lib/auth"
import { headers } from "next/headers"

const session = await auth.api.getSession({
  headers: await headers(),
})
const user = session?.user // { id, name, email, emailVerified, image, createdAt, updatedAt }
```

### Get the current user in a Client Component

```typescript
"use client"
import { authClient } from "@/lib/auth-client"

const { data: session, isPending } = authClient.useSession()
const user = session?.user
```

No `<SessionProvider>` wrapper is needed — Better Auth uses reactive stores internally.

### Route protection

All routes are protected by default — any page you create requires login automatically. Public routes (like the homepage and sign-in pages) are explicitly whitelisted in `proxy.ts`.

To make a new route public, add it to the `publicRoutes` array:

```typescript
// proxy.ts
const publicRoutes = ["/", "/sign-in", "/sign-up", "/api/auth", "/pricing"]
```

For an additional layer of protection, pages inside `app/(authenticated)/` are wrapped by a layout that checks the session server-side. To add a new protected page, just create it inside that folder:

```
app/(authenticated)/dashboard/page.tsx   → /dashboard (protected)
app/(authenticated)/settings/page.tsx    → /settings (protected)
```

The `(authenticated)` folder name is a Next.js route group — it doesn't appear in the URL.

### Add OAuth providers (optional)

To add Google, GitHub, Discord, or other OAuth providers alongside email/password, edit `lib/auth.ts`:

```typescript
import { betterAuth } from "better-auth"

export const auth = betterAuth({
  // ...existing config
  socialProviders: {
    google: {
      clientId: process.env.GOOGLE_CLIENT_ID!,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET!,
    },
  },
})
```

Then add `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` to your `.env`.

## Database with Prisma ORM

Your database schema is defined in `prisma/schema.prisma`. This is the single source of truth for your tables.

### Define a model

```prisma
// prisma/schema.prisma
model Product {
  id        String   @id @default(cuid())
  name      String
  price     Int
  userId    String
  createdAt DateTime @default(now())

  user User @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@map("products")
}
```

Don't forget to add the relation to the User model too:

```prisma
model User {
  // ... existing fields
  products Product[]
}
```

### Sync to database

```bash
npm run db:push
```

This pushes your schema to the dev database (from `.env`). When you deploy to Vercel, the same command runs automatically against the production database.

### Query data

```typescript
import { prisma } from "@/lib/db/prisma"

// Read all
const allProducts = await prisma.product.findMany()

// Insert
await prisma.product.create({
  data: { name: "T-Shirt", price: 2500, userId: session.user.id },
})

// Filter
const cheap = await prisma.product.findMany({
  where: { price: { lt: 1000 } },
})
```

### Browse data

```bash
npm run db:studio
```

Opens Prisma Studio — a visual data browser at localhost:5555.

## Project Structure

```
proxy.ts                        ← Route protection (all routes require login by default)
prisma/
  schema.prisma                 ← Database schema (auth tables + your tables)
  seed.ts                       ← Seed script (demo users)
app/
  page.tsx                      ← Homepage (public)
  layout.tsx                    ← Root layout (fonts, theme)
  globals.css                   ← Tailwind + CSS variables
  sign-in/page.tsx              ← Email/password sign-in form (public)
  sign-up/page.tsx              ← Registration form (public)
  api/auth/[...all]/
    route.ts                    ← Better Auth API route handler
  (authenticated)/
    layout.tsx                  ← Auth check layout (redirects if not signed in)
    protected/
      page.tsx                  ← Example protected page
components/
  ui/                           ← shadcn/ui components (button, card, input, etc.)
  auth-button.tsx               ← Login/user button (switches based on session)
  sign-in-button.tsx            ← Sign in / Sign up links
  user-button.tsx               ← User dropdown with sign-out
lib/
  auth.ts                       ← Better Auth server config (Prisma adapter, session settings)
  auth-client.ts                ← Better Auth client helpers (React hooks)
  db/
    prisma.ts                   ← Database client (Prisma)
  utils.ts                      ← cn() helper for classnames
.claude/
  commands/                     ← Custom Claude Code slash commands
CLAUDE.md                       ← Claude Code project config
.env.example                    ← Environment variable template
```

## Environment Variables

Copy `.env.example` to `.env` and fill in the values you need:

| Variable              | Required              | Where to Get It                            |
| --------------------- | --------------------- | ------------------------------------------ |
| `BETTER_AUTH_SECRET`  | Yes                   | Generate with `openssl rand -base64 32`    |
| `BETTER_AUTH_URL`     | Yes                   | `http://localhost:3000` for dev             |
| `DATABASE_URL`        | Yes                   | Neon console → Connection Details → Prisma |
| `DIRECT_URL`          | Yes                   | Neon console → Connection Details → Prisma |
| `REPLICATE_API_TOKEN` | For image/video gen   | replicate.com/account/api-tokens           |
| `OPENAI_API_KEY`      | For text gen (OpenAI) | platform.openai.com/api-keys               |
| `STRIPE_SECRET_KEY`   | For payments          | dashboard.stripe.com/apikeys               |
| `RESEND_API_KEY`      | For email             | resend.com/api-keys                        |
