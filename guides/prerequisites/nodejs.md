# Node.js & npm

Node.js is the engine that runs your app locally. npm (Node Package Manager) comes bundled with it and handles installing libraries your project depends on.

**Quick download:** [nodejs.org](https://nodejs.org/) — click the **LTS** button

---

## Mac

### Step 1: Download the installer

Go to [nodejs.org](https://nodejs.org/) and click the **LTS** (Long Term Support) download button. This downloads a `.pkg` file.

### Step 2: Run the installer

1. Open the downloaded `.pkg` file
2. Click **Continue** through the prompts
3. Agree to the license
4. Click **Install** (you may need to enter your Mac password)
5. Click **Close** when it's done

### Step 3: Verify the installation

Open **Terminal** (search for "Terminal" in Spotlight, or find it in Applications → Utilities) and run:

```bash
node --version
```

You should see something like `v22.x.x`.

Also verify npm was installed:

```bash
npm --version
```

You should see something like `10.x.x`.

---

## Windows

### Step 1: Download the installer

Go to [nodejs.org](https://nodejs.org/) and click the **LTS** (Long Term Support) download button. This downloads a `.msi` file.

### Step 2: Run the installer

1. Open the downloaded `.msi` file
2. Click **Next** through the prompts
3. Accept the license agreement
4. Leave the default install location
5. On the "Tools for Native Modules" screen, check the box to **Automatically install the necessary tools** (this installs build tools you may need later)
6. Click **Install**, then **Finish**

### Step 3: Restart your terminal

Close and reopen **Windows Terminal** or **PowerShell** so it picks up the new installation.

### Step 4: Verify the installation

Open **Windows Terminal** or **PowerShell** and run:

```bash
node --version
```

You should see something like `v22.x.x`.

Also verify npm was installed:

```bash
npm --version
```

You should see something like `10.x.x`.

---

## Troubleshooting

| Problem                             | Fix                                                                          |
| ----------------------------------- | ---------------------------------------------------------------------------- |
| `node: command not found`           | Restart your terminal. On Windows, you may need to restart your computer.    |
| `npm EACCES` permission error (Mac) | Run: `sudo npm install -g <package>` (enter your Mac password when prompted) |
| Old version showing up              | Uninstall the old version first, then reinstall from nodejs.org              |
| Windows PATH issues                 | Reinstall Node.js and make sure "Add to PATH" is checked during installation |

---

## More details

- [Node.js official docs](https://nodejs.org/en/learn/getting-started/introduction-to-nodejs)
- [npm documentation](https://docs.npmjs.com/)
