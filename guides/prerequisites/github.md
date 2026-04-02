# GitHub & GitHub CLI

GitHub is where your code lives online. Other services like Vercel connect to it to deploy your app. The GitHub CLI (`gh`) lets you create repos and manage GitHub from the terminal.

**Quick links:** [github.com](https://github.com/) (account) · [cli.github.com](https://cli.github.com/) (CLI download)

---

## Step 1: Create a GitHub account

1. Go to [github.com](https://github.com/)
2. Click **Sign up**
3. Follow the prompts — a free account is all you need
4. Use the same email you configured with Git (`git config --global user.email`)

---

## Step 2: Install the GitHub CLI

The GitHub CLI (`gh`) lets you create repositories, push code, and manage GitHub without leaving the terminal.

### Mac

**Option A: Homebrew (recommended if you have it)**

```bash
brew install gh
```

**Option B: Download the installer**

1. Go to [cli.github.com](https://cli.github.com/)
2. Click **Download for macOS**
3. Open the downloaded `.pkg` file and follow the prompts

### Windows

1. Go to [cli.github.com](https://cli.github.com/)
2. Click **Download for Windows**
3. Run the downloaded `.msi` installer
4. Click through the prompts with defaults
5. Restart your terminal after installation

---

## Step 3: Verify the installation

```bash
gh --version
```

You should see something like `gh version 2.x.x`.

---

## Step 4: Authenticate the CLI

Run:

```bash
gh auth login
```

Follow the prompts:

1. **Where do you use GitHub?** → `GitHub.com`
2. **What is your preferred protocol?** → `HTTPS`
3. **Authenticate Git with your GitHub credentials?** → `Yes`
4. **How would you like to authenticate?** → `Login with a web browser`
5. Copy the one-time code shown in the terminal
6. Press Enter — a browser window opens
7. Paste the code and click **Authorize**

You're now authenticated. You can create repos and push code from the terminal.

---

## Using the GitHub CLI

Once authenticated, the most important command for the hackathon is creating a new repo:

```bash
gh repo create slow-hackathon --public --source=. --push
```

This creates a new repository on your GitHub account from the current folder and pushes all your code to it in one step.

---

## Troubleshooting

| Problem                           | Fix                                                                                                                                 |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `gh: command not found`           | Restart your terminal. On Windows, make sure to close and reopen after installing.                                                  |
| Authentication fails              | Run `gh auth logout` then `gh auth login` to start fresh.                                                                           |
| "Permission denied" when pushing  | Make sure you selected "Authenticate Git with your GitHub credentials" during `gh auth login`. Run `gh auth login` again if needed. |
| Browser doesn't open during login | Copy the URL shown in the terminal and paste it into your browser manually.                                                         |

---

## More details

- [GitHub CLI documentation](https://cli.github.com/manual/)
- [GitHub Getting Started guide](https://docs.github.com/en/get-started)
