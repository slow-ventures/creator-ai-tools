# Git

Git is a version control system that saves checkpoints of your work so you can always go back. Think of it like an undo history for your entire project.

**Quick download:** Mac: built-in (run `xcode-select --install`) · Windows: [git-scm.com](https://git-scm.com/)

---

## Mac

### Step 1: Install via Xcode Command Line Tools

Open **Terminal** (search for "Terminal" in Spotlight, or find it in Applications → Utilities) and run:

```bash
xcode-select --install
```

A dialog will pop up asking if you want to install developer tools. Click **Install** and wait for it to finish (this may take a few minutes).

### Step 2: Verify the installation

```bash
git --version
```

You should see something like `git version 2.x.x`.

### Step 3: Configure your identity

Tell Git who you are. Use the same email you'll use for your GitHub account:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## Windows

### Step 1: Download the installer

Go to [git-scm.com](https://git-scm.com/) and click the **Download for Windows** button. This downloads a `.exe` file.

### Step 2: Run the installer

1. Open the downloaded `.exe` file
2. Click **Next** through the prompts — the defaults are fine for everything
3. On the "Choosing the default editor" screen, you can leave it as Vim or change it to something friendlier (Notepad is fine — you won't need it much since Claude Code handles editing)
4. On the "Adjusting your PATH" screen, make sure **Git from the command line and also from 3rd-party software** is selected (this is the default)
5. Click **Install**, then **Finish**

### Step 3: Restart your terminal

Close and reopen **Windows Terminal** or **PowerShell**.

### Step 4: Verify the installation

```bash
git --version
```

You should see something like `git version 2.x.x`.

### Step 5: Configure your identity

Tell Git who you are. Use the same email you'll use for your GitHub account:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## Troubleshooting

| Problem                                                               | Fix                                                                                       |
| --------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `git: command not found`                                              | Restart your terminal. On Windows, make sure the PATH option was selected during install. |
| "xcode-select: error: command line tools are already installed" (Mac) | You already have Git — run `git --version` to confirm.                                    |
| Git asks for name/email on every commit                               | Run the `git config --global` commands above to set them once.                            |

---

## More details

- [Git official documentation](https://git-scm.com/doc)
- [Git basics in 10 minutes (video)](https://www.youtube.com/watch?v=USjZSNILzSg)
