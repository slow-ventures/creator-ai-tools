# Neon

Neon is a serverless PostgreSQL database built for the cloud. It provides instant branching, autoscaling, and a generous free tier. For this hackathon, we use it as the database for your app.

**Quick link:** [neon.tech](https://neon.tech/) — sign up for free

---

## Step 1: Create a Neon account

1. Go to [neon.tech](https://neon.tech/)
2. Click **Sign Up**
3. Sign up with **GitHub** (recommended — keeps all your accounts connected) or email

The free plan includes plenty of projects and branches for the hackathon.

---

## Step 2: Create your project

1. From the [Neon console](https://console.neon.tech/), click **New Project**
2. Give your project a name (e.g., `slow-hackathon`)
3. Choose a **region** close to you (e.g., US East 2 for the east coast)
4. Click **Create Project**

Your project is ready instantly — no waiting.

---

## Step 3: Get your credentials

1. On your project dashboard, find **Connection Details**
2. Select **Prisma** from the framework/ORM dropdown
3. Copy the `DATABASE_URL` and `DIRECT_URL` values

The `DATABASE_URL` uses the connection pooler (the hostname contains `-pooler`). The `DIRECT_URL` is for migrations and schema pushes.

---

## Step 4: Set up a production branch (optional, for deployment)

Neon supports database branching — like git branches, but for your database. This is great for keeping dev and production data separate:

1. Go to **Branches** in the left sidebar
2. Click **Create Branch**
3. Name it `production`
4. Use the connection strings from this branch for your Vercel environment variables

Alternatively, you can create a second Neon project for production — both approaches work fine.

---

## Troubleshooting

| Problem                          | Fix                                                                                                                              |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| "Password authentication failed" | Go to your project → **Connection Details** and verify the password. You can reset it from **Settings → Reset Password**.        |
| Can't find the connection string | Go to your project dashboard → **Connection Details** → select Prisma from the dropdown.                                        |
| Connection timeout               | Make sure you're using the correct region. Check the [Neon status page](https://neonstatus.com/) for any outages.                |
| Database not responding          | Neon databases scale to zero after inactivity on the free tier. The next connection wakes them automatically (may take ~1 second). |

---

## More details

- [Neon documentation](https://neon.tech/docs)
- [Neon + Next.js quickstart](https://neon.tech/docs/guides/nextjs)
- [Neon + Prisma guide](https://neon.tech/docs/guides/prisma)
- [Neon branching](https://neon.tech/docs/introduction/branching)
