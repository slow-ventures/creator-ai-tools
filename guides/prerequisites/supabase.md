# Supabase

Supabase is an open-source backend platform that provides a PostgreSQL database, authentication, file storage, and more. For this hackathon, we use it as the database for your app.

**Quick link:** [supabase.com](https://supabase.com/) — sign up for free

---

## Step 1: Create a Supabase account

1. Go to [supabase.com](https://supabase.com/)
2. Click **Start your project**
3. Sign up with **GitHub** (recommended — keeps all your accounts connected) or email

The free plan includes 2 projects, which is exactly what you need (one for development, one for production).

---

## Step 2: Create your first project

1. From the [Supabase dashboard](https://supabase.com/dashboard), click **New Project**
2. Select your organization (or create one)
3. Give your project a name (e.g., `slow-hackathon-dev`)
4. Set a **database password** — save this somewhere, you'll need it for your connection string
5. Choose a **region** close to you (e.g., US East for San Francisco is fine)
6. Click **Create new project**

It takes about 30 seconds to set up.

---

## Step 3: Get your credentials

Depending on which template you're using, you'll need different credentials:

### For the Auth.js + Prisma template

1. Go to **Connect** (top of the page)
2. Click the **ORMs** tab
3. Select **Prisma**
4. Copy the `DATABASE_URL` and `DIRECT_URL` values

### For the Supabase template

1. Go to **Settings** → **API**
2. Copy your **Project URL** (`NEXT_PUBLIC_SUPABASE_URL`)
3. Copy your **anon/publishable key** (`NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`)

---

## Step 4: Create a production project (optional, for deployment)

For the hackathon, it's recommended to have separate dev and production databases:

1. Click **New Project** again
2. Name it `slow-hackathon-prod`
3. Use the same steps to get credentials
4. Add the production credentials to your Vercel environment variables

---

## Troubleshooting

| Problem                          | Fix                                                                                                                                 |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| "Password authentication failed" | Go to **Project Settings → Database → Reset database password** and update the password in your connection string.                  |
| Can't find the connection string | Go to **Connect** (top of page) → **ORMs** tab → select Prisma or Drizzle.                                                          |
| Free plan project limit reached  | You can delete an unused project, or upgrade to the Pro plan ($25/mo).                                                              |
| Database not responding          | Check the Supabase status page. If your project has been paused (free tier pauses after inactivity), restart it from the dashboard. |

---

## More details

- [Supabase documentation](https://supabase.com/docs)
- [Supabase + Next.js quickstart](https://supabase.com/docs/guides/getting-started/quickstarts/nextjs)
- [Database connection strings explained](https://supabase.com/docs/guides/database/connecting-to-postgres)
