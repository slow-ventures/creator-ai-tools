# Claude Code

Claude Code is your AI coding partner. You describe what you want to build in plain English, and it writes the code, runs commands, and manages your project. It's the core tool for the hackathon.

**Quick install:** `npm install -g @anthropic-ai/claude-code` (requires Node.js)

---

## Prerequisites

You need **Node.js & npm** installed first. See the [Node.js guide](nodejs.md) if you haven't done that yet.

You also need an active **Claude Max** subscription ($200/mo) from [claude.ai](https://claude.ai/).

---

## Mac & Windows

The install process is the same on both platforms.

### Step 1: Install Claude Code

Open your terminal and run:

```bash
npm install -g @anthropic-ai/claude-code
```

On Mac, if you get a permission error, run:

```bash
sudo npm install -g @anthropic-ai/claude-code
```

### Step 2: Start Claude Code

```bash
claude
```

A browser window will open asking you to sign in with your Anthropic account.

### Step 3: Authenticate

1. Sign in with the account that has a **Claude Max** subscription
2. Approve the connection in your browser
3. Return to the terminal — you should see Claude Code's prompt ready for input

### Step 4: Verify

Ask Claude Code a quick question to make sure it's working:

```
What version of Node am I running?
```

It should read your system info and respond with your Node.js version.

You can also check the version from outside Claude Code:

```bash
claude --version
```

---

## How to use Claude Code

Once it's running, just type what you want in plain English:

- `"Create a new page called Dashboard with a list of items from the database"`
- `"Fix the error I'm seeing when I try to log in"`
- `"Add a button that lets users upload a profile photo"`
- `"Deploy this to Vercel"`

Claude Code reads your project files, writes code, runs terminal commands, and explains what it's doing along the way.

### Slash commands

This project includes custom slash commands that give Claude Code specific instructions:

| Command      | What It Does                                    |
| ------------ | ----------------------------------------------- |
| `/plan`      | Turn your idea into a requirements + build plan |
| `/build`     | Execute the plan step by step                   |
| `/add-table` | Add a new database table/model                  |
| `/add-ai`    | Add an AI feature (image gen, text gen, chat)   |
| `/fix`       | Debug and fix the current error                 |
| `/deploy`    | Commit, push, and deploy                        |
| `/help`      | Show all available commands                     |

---

## Troubleshooting

| Problem                                  | Fix                                                                                                    |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `claude: command not found`              | Restart your terminal. If it still doesn't work, reinstall: `npm install -g @anthropic-ai/claude-code` |
| Authentication fails                     | Make sure you have an active Claude Max subscription. Try `claude logout` then `claude` again.         |
| "npm EACCES" permission error (Mac)      | Use `sudo npm install -g @anthropic-ai/claude-code`                                                    |
| Claude Code is slow or unresponsive      | Check your internet connection. Claude Code requires an active connection to work.                     |
| "This model requires a Max subscription" | Upgrade to Claude Max at [claude.ai/settings](https://claude.ai/settings)                              |

---

## More details

- [Claude Code documentation](https://docs.anthropic.com/en/docs/claude-code/overview)
- [Claude Max plans](https://claude.ai/pricing)
