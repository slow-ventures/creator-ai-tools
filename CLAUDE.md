# Project

This is a Next.js app built at the Slow Ventures Creator Fund AI Hackathon. The user is likely a beginner — be helpful, explain what you're doing, and keep things simple.

# Stack

- **Framework**: Next.js 15 (App Router) with TypeScript
- **Styling**: Tailwind CSS + shadcn/ui (New York style, lucide icons)
- **Auth**: Auth.js (NextAuth v5) — email/password with bcrypt, JWT sessions
- **Database**: Prisma ORM → PostgreSQL on Supabase
- **Hosting**: Vercel (auto-deploys on git push)

# Key files

- `auth.ts` — Auth.js config (providers, callbacks, JWT)
- `proxy.ts` — route protection middleware (all routes require login by default)
- `prisma/schema.prisma` — database schema (single source of truth for tables)
- `lib/db/prisma.ts` — Prisma client singleton
- `lib/actions/auth.ts` — sign-up and sign-in server actions
- `components/ui/` — shadcn/ui components
- `.env` — environment variables (never commit this)

# Slash commands

This project has custom slash commands the user may invoke. When they do, follow the instructions in the corresponding `.claude/commands/` file.

| Command | What it does |
| ------- | ------------ |
| `/plan` | Turn an idea into requirements.md + implementation-plan.md |
| `/build` | Execute the implementation plan step by step |
| `/new-page` | Create a new page with navigation |
| `/add-table` | Add a Prisma model, push schema, create server action |
| `/add-ai` | Add an AI feature (Replicate, Vercel AI SDK) |
| `/design` | Build or redesign UI from a description |
| `/fix` | Debug and fix the current error |
| `/research` | Research a topic, API, or product before building |
| `/snapshot` | Git commit (local save point, does NOT push) |
| `/push` | Push commits to GitHub (backup only, does NOT deploy) |
| `/deploy` | Commit + push to GitHub + Vercel deploys automatically |
| `/help` | Show all commands and tips |

# Rules

## General

- The user is a beginner. Briefly explain what you're doing and why before making changes.
- When creating something new, tell the user how to see it (e.g., "Open localhost:3000/dashboard to see your new page").
- After making changes, suggest the logical next step or ask what to do next.
- Commit frequently — remind the user to run /snapshot after completing a feature.

## Server actions (not API routes)

- Use Server Actions (`"use server"`) for all backend logic. Do not create API routes under `app/api/` (except the existing Auth.js route).
- Server actions go in `lib/actions/` or co-located with the page that uses them.

## Authentication

- Use `auth()` from `@/auth` to get the current session in Server Components and Server Actions.
- Use `useSession()` from `next-auth/react` to get the session in Client Components (wrapped in `<SessionProvider>`).
- The current user's ID is `session.user.id`.
- All routes are protected by default via `proxy.ts`. New pages require login automatically.
- To make a route public, add it to the `publicRoutes` array in `proxy.ts`.
- Do not modify the Auth.js model field names (User, Account, Session, VerificationToken) — Auth.js expects them exactly as defined.
- You CAN add new fields to the User model (e.g., `bio`, `avatarUrl`). Just don't rename existing ones.

## Database (Prisma)

- All models are defined in `prisma/schema.prisma`. This is the single source of truth.
- After changing the schema, always run `npm run db:push` to sync to the database.
- After adding new models, run `npm run postinstall` (which runs `prisma generate`) to update the TypeScript types.
- Use `prisma` from `lib/db/prisma.ts` for all database reads and writes.
- When a model belongs to a user, add `userId String` with a relation to the User model and filter queries by `userId: session.user.id`.
- Use `@@map("table_name")` on every model to set the Postgres table name (lowercase, snake_case, plural).
- Browse data with `npm run db:studio` (opens Prisma Studio at localhost:5555).

## UI and styling

- Use shadcn/ui components for all UI elements. Install new ones with: `pnpm dlx shadcn@latest add <component>`
- Available components: Button, Card, Input, Label, Checkbox, Badge, DropdownMenu. Install more as needed (Dialog, Table, Select, Tabs, Textarea, etc.).
- Use Tailwind CSS for all styling. Never use inline styles or raw CSS.
- Use the theme's CSS variables (e.g., `bg-background`, `text-foreground`, `bg-primary`, `text-muted-foreground`). Do not use arbitrary hex colors.
- Use `cn()` from `lib/utils` when conditionally combining class names.
- Use `lucide-react` for icons.
- Keep layouts responsive — use Tailwind's responsive prefixes (`sm:`, `md:`, `lg:`).

## Pages and routing

- File paths are routes: `app/dashboard/page.tsx` → `/dashboard`
- Pages inside `app/(authenticated)/` get an extra server-side auth check via the layout.
- The `(authenticated)` folder name is a Next.js route group — it doesn't appear in the URL.
- When creating a new page, add a navigation link so the user can reach it.

## Deployment

- This project uses two branches: `main` (working branch) and `production` (deploys to Vercel).
- Pushing to `main` does NOT deploy. Pushing to `production` triggers a Vercel build.
- To deploy: `git push origin main:production` (this pushes main's code to the production branch).
- The build command is: `prisma generate && prisma db push && next build` — database schema syncs to production automatically.
- Environment variables for production are managed with `npx vercel env add <NAME> production` or in Vercel → Settings → Environment Variables.
- Production uses a separate Supabase project (prod) from local development (dev).
- The /deploy slash command handles the full commit → push to main → push to production flow.

## Environment variables

- All secrets go in `.env` (never committed to git).
- Required: `AUTH_SECRET`, `DATABASE_URL`, `DIRECT_URL`
- Optional: `REPLICATE_API_TOKEN`, `OPENAI_API_KEY`, `STRIPE_SECRET_KEY`, `RESEND_API_KEY`
- When adding a new API integration, remind the user to add the key to both `.env` (local) and Vercel Settings (production).

# Common patterns

## Create a new model + page

1. Add the model to `prisma/schema.prisma` (with user relation if needed)
2. Run `npm run db:push`
3. Create a server action in `lib/actions/` to create/read/update/delete
4. Create a page in `app/(authenticated)/` to display the data
5. Add navigation link

## Add an AI feature

1. Install the package (`npm install replicate` or `npm install ai @ai-sdk/openai`)
2. Add the API key to `.env`
3. Create a server action that calls the API
4. Build a UI with loading states and error handling

## Make a page public

Add the path to `publicRoutes` in `proxy.ts`:
```typescript
const publicRoutes = ["/", "/sign-in", "/sign-up", "/api/auth", "/your-new-public-page"]
```
