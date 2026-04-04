# Vercel

Vercel hosts your app and gives you a live URL. Every time you push code to GitHub, Vercel automatically rebuilds and redeploys your app. No server management required.

**Quick link:** [vercel.com](https://vercel.com/) — sign up with your GitHub account

---

## Step 1: Create a Vercel account

1. Go to [vercel.com](https://vercel.com/)
2. Click **Sign Up**
3. Choose **Continue with GitHub** (recommended — this connects your repos automatically)
4. Authorize Vercel to access your GitHub account

The free **Hobby** plan is all you need for the hackathon.

---

## Step 2: Verify your account

After signing up, you should be able to see your Vercel dashboard at [vercel.com/dashboard](https://vercel.com/dashboard).

No local installation is required — Vercel connects to your GitHub repo and deploys automatically when you push code.

---

## How deployment works

Once your project is connected to Vercel:

```
You write code locally
  → git push to GitHub
  → Vercel detects the push
  → Vercel builds and deploys your app
  → You get a live URL like slow-hackathon.vercel.app
```

Every push creates a new deployment. You can see all deployments in your Vercel dashboard.

---

## Deploying for the first time

You have two options:

### Option A: Use the Vercel dashboard

1. Go to [vercel.com/new](https://vercel.com/new)
2. Click **Import** next to your GitHub repo
3. Vercel auto-detects your framework (Next.js)
4. Add your environment variables (Neon database URL, keys, etc.)
5. Click **Deploy**

### Option B: Tell Claude Code

Open Claude Code in your project and say:

```
Deploy this to Vercel
```

Claude Code will handle the setup for you.

---

## Adding environment variables

Your app needs environment variables (like database credentials) to work in production:

1. Go to your project on [vercel.com](https://vercel.com/)
2. Click **Settings** → **Environment Variables**
3. Add each variable name and value
4. Redeploy for the changes to take effect

---

## Troubleshooting

| Problem                              | Fix                                                                                                                         |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------- |
| Can't see your GitHub repo in Vercel | Make sure you authorized Vercel to access your GitHub account during signup. Go to Settings → Git Integration to reconnect. |
| Deployment fails                     | Check the build logs in your Vercel dashboard — they usually tell you exactly what went wrong.                              |
| App works locally but not on Vercel  | You're probably missing environment variables. Add them in Settings → Environment Variables.                                |
| "Error: No framework detected"       | Make sure your project has a `package.json` with Next.js as a dependency.                                                   |

---

## More details

- [Vercel documentation](https://vercel.com/docs)
- [Deploying Next.js on Vercel](https://vercel.com/docs/frameworks/nextjs)
