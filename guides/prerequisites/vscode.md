# VS Code

VS Code (Visual Studio Code) is a free code editor from Microsoft. Claude Code runs in the terminal, but VS Code is useful for browsing your project files, viewing changes, and reading code.

**Quick download:** [code.visualstudio.com](https://code.visualstudio.com/)

---

## Mac

### Step 1: Download the installer

Go to [code.visualstudio.com](https://code.visualstudio.com/) and click the **Download for macOS** button. This downloads a `.zip` file.

### Step 2: Install

1. Open the downloaded `.zip` file — it extracts to `Visual Studio Code.app`
2. Drag **Visual Studio Code.app** into your **Applications** folder
3. Open it from Applications (or search for "Visual Studio Code" in Spotlight)

### Step 3: Add the `code` command to your terminal

This lets you open VS Code from the terminal by typing `code .`.

1. Open VS Code
2. Press `Cmd + Shift + P` to open the command palette
3. Type `shell command` and select **Shell Command: Install 'code' command in PATH**
4. Restart your terminal

### Step 4: Verify

```bash
code --version
```

You should see a version number. You can also open a project folder:

```bash
code slow-hackathon
```

---

## Windows

### Step 1: Download the installer

Go to [code.visualstudio.com](https://code.visualstudio.com/) and click the **Download for Windows** button. This downloads a `.exe` file.

### Step 2: Run the installer

1. Open the downloaded `.exe` file
2. Accept the license agreement
3. Leave the default install location
4. On the "Select Additional Tasks" screen, check these boxes:
   - **Add "Open with Code" action to Windows Explorer file context menu**
   - **Add "Open with Code" action to Windows Explorer directory context menu**
   - **Add to PATH** (this should be checked by default)
5. Click **Install**, then **Finish**

### Step 3: Restart your terminal

Close and reopen **Windows Terminal** or **PowerShell** so it picks up the new PATH.

### Step 4: Verify

```bash
code --version
```

You should see a version number. You can also open a project folder:

```bash
code slow-hackathon
```

---

## Useful settings for the hackathon

Once VS Code is open, you can use it alongside Claude Code in the terminal:

- **Open a folder:** File → Open Folder (or `code .` from the terminal)
- **Open the built-in terminal:** `` Ctrl + ` `` (backtick) — you can run Claude Code from here
- **View side-by-side:** Drag a file tab to the right side of the editor to split the view

---

## Troubleshooting

| Problem                              | Fix                                                                                                                              |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| `code: command not found` (Mac)      | Open VS Code, press `Cmd + Shift + P`, type "shell command", and select "Install 'code' command in PATH". Restart your terminal. |
| `code: command not found` (Windows)  | Reinstall VS Code and make sure "Add to PATH" is checked. Restart your terminal.                                                 |
| VS Code opens but looks overwhelming | Don't worry — you mostly just need File → Open Folder. Claude Code handles the editing.                                          |

---

## More details

- [VS Code Getting Started](https://code.visualstudio.com/docs/getstarted/introvideos)
- [VS Code keyboard shortcuts (Mac)](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf)
- [VS Code keyboard shortcuts (Windows)](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)
