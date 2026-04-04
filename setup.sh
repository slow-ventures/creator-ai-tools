#!/bin/bash
set -e

# ═══════════════════════════════════════════════════════════════
# Creator AI Tools — Project Setup Script
# Beautiful TUI walkthrough for hackathon prerequisite setup.
# Run with: bash setup.sh
# ═══════════════════════════════════════════════════════════════

# ── Pre-TUI helpers (used before gum is available) ────────────

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

pre_ok()   { echo -e "  ${GREEN}✓${NC} $1"; }
pre_warn() { echo -e "  ${YELLOW}!${NC} $1"; }
pre_fail() { echo -e "  ${RED}✗${NC} $1"; }

pre_confirm() {
  local prompt="$1"
  local answer
  while true; do
    read -rp "  $prompt (y/n): " answer
    case "$answer" in
      [Yy]|[Yy][Ee][Ss]) return 0 ;;
      [Nn]|[Nn][Oo]) return 1 ;;
      *) echo "  Please answer y or n." ;;
    esac
  done
}

# ── TUI helpers (used after gum is installed) ─────────────────

TOTAL_STEPS=11
CURRENT_STEP=0

header() {
  CURRENT_STEP=$((CURRENT_STEP + 1))
  echo ""
  gum style \
    --border rounded \
    --border-foreground 99 \
    --padding "0 2" \
    --margin "0 0" \
    --bold \
    "Step $CURRENT_STEP of $TOTAL_STEPS  ·  $1"
  echo ""
}

ok() {
  gum style --foreground 76 "  ✓ $1"
}

warn() {
  gum style --foreground 214 "  ! $1"
}

fail() {
  gum style --foreground 196 --bold "  ✗ $1"
}

info() {
  gum style --foreground 111 "  → $1"
}

divider() {
  gum style --foreground 240 "  ─────────────────────────────────────────────────"
}

# Styled confirm — returns 0 (yes) or 1 (no)
confirm() {
  gum confirm --prompt.foreground 255 --selected.background 99 --unselected.background 240 "$1"
}

# Styled text input
input() {
  gum input --prompt "  > " --prompt.foreground 99 --placeholder "$1" --width 50
}

# Run a command with a spinner
spin() {
  local title="$1"
  shift
  gum spin --spinner dot --spinner.foreground 99 --title "  $title" -- "$@"
}

# ── Banner art ────────────────────────────────────────────────

show_raccoon() {
  cat << 'EOF'

    ████████████████████████████████████████████████████████████████████████████████████████████████████
    ██████████████████████████████████████████████████████▓▓▓███████████████████████████████████████████
    ████████████████████████████▀▀▀╟▄▄▄▄▄▄▄▄▄▄▄╟╙▀▀▓▀╠▄▄▓▓▓▓▓▌▄▄╠▀██████████████████████████████████████
    ██████████████▀▄▄▌▓▌▄▄▄▀▀▄▄▓▓█████████████████▓▓██████████████▄▀████████████████████████████████████
    █████████████▌▐████████████████████████████████████████████████─████████████████████████████████████
    █████████████▌▐████████████████████████████████████████████████N╫███████████████████████████████████
    █████████████▓'████████████████████████████████████████████████M╫███████████████████████████████████
    ██████████████─▓██████████████████████▓▓▓▀╬╬╬╢╢╬╬╬╬╫▓▓▓▓███████ ████████████████████████████████████
    ██████████████"╫█▀Ñ▒▒▒Ü╩╬▀▓██████▓▓╬ÑÖ╚ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ╠╬▀▓███▌╓████████████████████████████████████
    █████████████"▓Ñ▒▒▒▒▒ÜÜÜÜÜÜ╩╬▓▓╬ÖÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ▒▒▒ÜÜ╬█ █████████████████████████████████████
    ████████████"▓Ñ╬╫▀▀▀▓▌▒▒▒▒▒▒Ü╚▒ÜÜÜÜÜÜÜÜÜ▓▓▓▓▌▄▄ÜÜÜÜÜÜÜÜ▒▒▒▒ÜÜ╫▄╫████████████████████████████████████
    ███████████Ñ╫▓▓▓▓█▓▓██▓▓Ñ▒▒▒▒▒▒▒▒▒▒▒ÜÜ▒▄▓▓▓▓▓▓▓▓▌▒ÜÜÜÜÜÜ▒▒▒▒ÜÜ█ ████████████████████████████████████
    ███████████ █████M╔▌▄████╠▒▒▒▒▒▒▒▒▒▒╟▓█▌▄▌⌐╫██████▓▄ÜÜÜÜÜ▒▒▒▒Ü▓⌐▓███████████████████████████████████
    ███████████ █████ ╣██╫██▓▒▒▒▒▒▒▒▒▒▒▒███M██▌ ████████▓▒ÜÜÜ▒▒▒▒Ü╫▌╟███████████████████████████████████
    ███████████ █████▄╙▀▄██▓É▒▒▒▒▒▒▒▒ÜÜÜ███▓╙▀"▓██████████▒ÜÜ▒▒▒▒Ü║▌▐███████████████████████████████████
    ███████████ ██████▓▓█▓Ñ▒▒ÜÜÜÜÜÜÜÜÜÜÜ╣████▓█████████████ÑÜÜ▒▒▒Ü╟▌▐███████████████████████████████████
    ███████████▌╟██████▓Ñ▒▒ÜÜÜÜÜÜÜÜÜÜÜÜÜÜ█████████████████▓▓▒Ü▒▒▒Ü╫N╫███████████████████████████████████
    ████████████ ████▀Ñ▒▒ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ╣████████████████▓▓ÑÜ▒▒▒Ü▓ ▓███████████████████████████████████
    ████████████M▄▓Ñ▒▒▒▒ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ████████████████▓▓▌Ü▒▒▒Ü█ ████████████████████████████████████
    ███████████"▓Ñ▒▒ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ▓███████████████▓▓▌Ü▒▒Ü▓"▓████████████████████████████████████
    █████████▀▄▓É▒▒ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ▓███████████████▓▓▒▒▒Ü╫▀▐█████████████████████████████████████
    ███████▀▄▓▓@▒▒ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ▒▓███████████████▓▓ÑÜÜÜ▓▀▐██████████████████████████████████████
    ██████▓'███▓ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ▄ÜÜÜÉ▓▓███████████████▓▓ÑÜÜ▄█▄ª███████████████████████████████████████
    ████████▌╙▀▌▄▒▒▒▒ÜÜÜÜÜÜÜÜÜÜ▄▌ÑÜ▄▓▓███████████████████▓█▀╙─ ╙▀▄╙█████████████████████████████████████
    ██████████▓▄▄╟▀▀▀▀▀▀ÑÑÑ▌▓▓▓▓▓▓████████████████▀▀▀╙ ▄▀╨       ╙▌╙█████████████▓▀▀╟▄▄▄▄▄╨▀████████████
    █████████████████▓▓▓▓─╫"███████████████▀▀╙└   _╥╗▓▀`          █ █████████▓▀▄▄▀▀▓█▓▓▓▓███▌▄▀█████████
    ███████████████████▓▀▐N▌▐▓███████▌╬▄     ,w∞^"▄▄▀            ▄▌▐██████▓▀▄▌▀ÑÜÜÜÜ╬▓▓▓▓▓▓▓▓█▓└▓███████
    ███████████████▀╙▄▓▓▓▓▌ ▌ ▓███╨ ▀  └▄═$▄▄▄▄▓▀▀─▀▄           ▄▀▐█████▀▄▓██▓▌▒Ü▒▒▒▒Ö▓▓▓▓▓▓▓███µ▀██████
    ██████████████Ñ▄██▓╬╠╫   └▓▀─▄∞"└   ╓▓██████▄   ▓⌐        ╓▓▀▄╫███╨▄▓█▓█████▌▒▒▒▒▒▒▓▓▓▓▓▓▓███⌐▓█████
    ██████████████ ███▒╠╠▌  _█▌Γ╥═...═─╒█████████   '█     _▄▌Ñ_ █ █╨▄▓ÑÜÜ╬▓█████▓▒▒▒▒▒Ö▓▓▓▓▓▓████"█████
    ██████████████▌╙██▌╠▓  _█▄  ╙═...╥L╘█████████    █ ╓▄#▀Ñ¬``  ▓⌐▄▓ÑÜÜ▒▒▒Ü▓█████▓▒▒▒▒▒╫███▓█████ █████
    ███████████████▓▄▀▓█▌  █"▀" 'o▓▌,╜  ╙████████   _█Ñ┘-`¬¬¬`   ▐███▌▒▒▒▒▒▒▒▓█████Ñ╠╠╠╠╠████████▌▐█████
    ██████████████████▌┌⌐ ▐▌              ╙▀▀▀╙▀▀▀▀▀╨¬¬¬¬¬``      ████▓▒▒▒▒▒▒╬█████▌╠╠╠╠╠████████"▓█████
    ██████████████████▌▐  ▓                    __`  ¬¬`          _█████Ñ▒▒▒▒▒╠█████▓╠╠╠╠▒███████▀▐██████
    ██████████████████▓J"W█▓▄▄▄_              _`¬¬¬`           ```█████▌▒▒▒╠╠╠█████▓╩╠▒Ö╠██████Ñ▄███████
    ██████████████████Ñ▄██████████▌▄         `¬¬¬`           ````╥█████▌╠╠╠╠╠╠█████▓▒▒▒▒╫████▀╥▓████████
    █████████████████▌╓█▀▀▓██████████▄        ``      `````╓▄▄▓██▀▀████É╚╚╩╩╩Ö█████▌▒▄▌▌▀▀▀▄▄███████████
    █████████████████▌╫▌ÜÜÜÜ╬███████████▓▓#æ▄▄▄▄▄▄▄φ#▓▓██████████▄▐▌▄▄╫▀▀▀▀▀▀▀▀▀▀▀▀▄▄▄▄▓▓███████████████
    █████████████████▌▐█ÜÜÜÜÜÜ▓███████████▌▒▒▒ÜÜ▄▄▀███████████████ █████████████████████████████████████
    ██████████████████╕▀▌ÜÜÜÜÜÜ███████████ÑÜ▄▌▀▀▄▄▄╙█████████████▀▐█████████████████████████████████████
    ███████████████████▄▀▓▒ÜÜÜÜ╫██████████▀╠▄▄▓████▌▄▀█████████▓╙▄██████████████████████████████████████
    ████████████████████▌└▀▌▒ÜÜ╫███████▀▄▄▓██████████▓▄▄╟╨▀▀╟▄▄▓████████████████████████████████████████
    ██████████████████████▌╙▀▓▓█████▀╨▄▓████████████████████████████████████████████████████████████████
    █████████████████████████▌▄▄▄▄▄▄▓███████████████████████████████████████████████████████████████████
    ████████████████████████████████████████████████████████████████████████████████████████████████████
    ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

EOF
}

# Boot sequence animation — typewriter-style status lines
boot_sequence() {
  local G="\033[0;32m"
  local BG="\033[1;32m"
  local R="\033[0m"
  local lines=(
    "Initializing..."
    "Loading Kernel..."
    "Mascot Verified..."
    "Labs Active..."
  )
  for line in "${lines[@]}"; do
    echo -ne "  ${G}[ ${BG}OK${G} ] ${line}${R}"
    sleep 0.3
    echo ""
  done
}

# ── Confetti animation ─────────────────────────────────────────

confetti() {
  local cols
  cols=$(tput cols 2>/dev/null || echo 80)
  local rows=8
  local frames=12
  local pieces=("🎉" "🎊" "✨" "⭐" "🌟" "💫" "🎯" "🚀" "💜" "🟣")
  local colors=(196 208 226 76 51 99 213 214 255)

  # Hide cursor
  tput civis 2>/dev/null || true

  for (( f=0; f<frames; f++ )); do
    # Move up if not first frame
    if [[ $f -gt 0 ]]; then
      for (( r=0; r<rows; r++ )); do
        tput cuu1 2>/dev/null || echo -ne "\033[1A"
      done
    fi

    for (( r=0; r<rows; r++ )); do
      local line=""
      for (( c=0; c<cols-1; c++ )); do
        if (( RANDOM % 12 == 0 )); then
          local piece="${pieces[$((RANDOM % ${#pieces[@]}))]}"
          line+="$piece"
          c=$((c + 1))  # emoji takes 2 cols
        else
          line+=" "
        fi
      done
      echo -e "$line"
    done

    sleep 0.12
  done

  # Clear confetti
  for (( r=0; r<rows; r++ )); do
    tput cuu1 2>/dev/null || echo -ne "\033[1A"
    tput el 2>/dev/null || echo -ne "\033[2K"
    echo ""
  done
  # Move back up after clearing
  for (( r=0; r<rows; r++ )); do
    tput cuu1 2>/dev/null || echo -ne "\033[1A"
  done

  # Show cursor
  tput cnorm 2>/dev/null || true
}

# ═════════════════════════════════════════════════════════════════
# Phase 0: Bootstrap — Homebrew + gum (before TUI is available)
# ═════════════════════════════════════════════════════════════════

echo ""
echo -e "${BOLD}Creator AI Tools — Project Setup${NC}"
echo ""
echo "  Checking for required bootstrap tools..."
echo ""

# ── Homebrew ───────────────────────────────────────────────────

if command -v brew &>/dev/null; then
  pre_ok "Homebrew found"
else
  echo ""
  echo "  Homebrew is the Mac package manager. We need it to install"
  echo "  everything else. This is safe — it won't affect your system."
  echo ""
  if pre_confirm "Install Homebrew?"; then
    echo "  Installing Homebrew (this takes a minute)..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ -f /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
      SHELL_PROFILE=""
      if [[ -f "$HOME/.zshrc" ]]; then
        SHELL_PROFILE="$HOME/.zshrc"
      elif [[ -f "$HOME/.bash_profile" ]]; then
        SHELL_PROFILE="$HOME/.bash_profile"
      fi
      if [[ -n "$SHELL_PROFILE" ]] && ! grep -q 'homebrew' "$SHELL_PROFILE" 2>/dev/null; then
        echo '' >> "$SHELL_PROFILE"
        echo '# Homebrew' >> "$SHELL_PROFILE"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$SHELL_PROFILE"
      fi
    fi

    if command -v brew &>/dev/null; then
      pre_ok "Homebrew installed"
    else
      pre_fail "Homebrew install failed. Restart your terminal and try again."
      exit 1
    fi
  else
    pre_fail "Homebrew is required. Please install it and re-run."
    exit 1
  fi
fi

# ── gum (our TUI toolkit) ─────────────────────────────────────

if ! command -v gum &>/dev/null; then
  echo "  Installing TUI toolkit..."
  brew install gum &>/dev/null
fi

if ! command -v gum &>/dev/null; then
  pre_fail "Could not install gum. Exiting."
  exit 1
fi

pre_ok "TUI ready"
echo ""

# ═════════════════════════════════════════════════════════════════
# Welcome screen
# ═════════════════════════════════════════════════════════════════

clear

show_raccoon

echo ""
gum style --foreground 252 --margin "0 4" \
  "This script will install your tools, connect your accounts," \
  "and set up your project so you're ready to build." \
  "" \
  "You'll be in control at every step — nothing happens" \
  "without your approval."

echo ""
gum style --foreground 240 --margin "0 4" \
  "Steps:" \
  "  1. Node.js & npm           7. Initialize git repo" \
  "  2. GitHub CLI & login      8. Push to GitHub" \
  "  3. Git identity setup      9. Link Vercel project" \
  "  4. Vercel CLI & login     10. Provision Neon databases" \
  "  5. Neon CLI & login       11. Claude handoff" \
  "  6. Name your project"

echo ""
if ! confirm "  Ready to start?"; then
  gum style --foreground 240 "  No worries — run this script again when you're ready."
  exit 0
fi

# ═════════════════════════════════════════════════════════════════
# Step 1: Node.js & npm
# ═════════════════════════════════════════════════════════════════

header "Node.js & npm"

if command -v node &>/dev/null && command -v npm &>/dev/null; then
  NODE_VERSION=$(node --version)
  NPM_VERSION=$(npm --version)
  ok "Node.js $NODE_VERSION"
  ok "npm v$NPM_VERSION"

  NODE_MAJOR=$(echo "$NODE_VERSION" | sed 's/v//' | cut -d. -f1)
  if [[ "$NODE_MAJOR" -lt 18 ]]; then
    warn "Node 18+ is required. Yours is $NODE_VERSION."
    if confirm "  Upgrade Node.js via Homebrew?"; then
      spin "Upgrading Node.js..." brew install node
      ok "Node.js upgraded to $(node --version)"
    fi
  fi
else
  info "Node.js is the runtime that powers this project."
  echo ""
  if confirm "  Install Node.js via Homebrew?"; then
    spin "Installing Node.js..." brew install node
    if command -v node &>/dev/null; then
      ok "Node.js $(node --version) installed"
      ok "npm v$(npm --version)"
    else
      fail "Node.js installation failed. Try: brew install node"
      exit 1
    fi
  else
    fail "Node.js is required."
    exit 1
  fi
fi

# ═════════════════════════════════════════════════════════════════
# Step 2: GitHub CLI + authentication
# ═════════════════════════════════════════════════════════════════

header "GitHub CLI & authentication"

info "GitHub stores your code and lets you collaborate."
info "You'll need a free account: https://github.com/signup"
echo ""

if ! confirm "  Do you have a GitHub account?"; then
  echo ""
  warn "Please create an account at https://github.com/signup"
  info "Press Enter once you've signed up."
  read -rp ""
fi

if command -v gh &>/dev/null; then
  ok "GitHub CLI installed"
else
  if confirm "  Install GitHub CLI?"; then
    spin "Installing GitHub CLI..." brew install gh
    if command -v gh &>/dev/null; then
      ok "GitHub CLI installed"
    else
      fail "GitHub CLI installation failed."
      exit 1
    fi
  else
    fail "GitHub CLI is required."
    exit 1
  fi
fi

divider

if gh auth status &>/dev/null 2>&1; then
  ok "Already logged in to GitHub"
else
  info "Let's log you in. A browser window will open."
  echo ""
  if confirm "  Open browser to log in to GitHub?"; then
    gh auth login --web --git-protocol https
    if gh auth status &>/dev/null 2>&1; then
      ok "Logged in to GitHub!"
    else
      fail "GitHub login failed. Try: gh auth login"
      exit 1
    fi
  else
    fail "GitHub authentication is required."
    exit 1
  fi
fi

# Fetch GitHub profile info for the git identity step
GH_USER=$(gh api user --jq '.login' 2>/dev/null || echo "")
GH_NAME=$(gh api user --jq '.name // empty' 2>/dev/null || echo "")
GH_PRIMARY_EMAIL=$(gh api user/emails --jq '.[] | select(.primary==true) | .email' 2>/dev/null || echo "")
GH_ALL_EMAILS=$(gh api user/emails --jq '.[].email' 2>/dev/null || echo "")

echo ""
ok "GitHub user: $GH_USER"
[[ -n "$GH_NAME" ]] && ok "Display name: $GH_NAME"
[[ -n "$GH_PRIMARY_EMAIL" ]] && ok "Primary email: $GH_PRIMARY_EMAIL"

# ═════════════════════════════════════════════════════════════════
# Step 3: Git + identity setup
# ═════════════════════════════════════════════════════════════════

header "Git & identity setup"

if command -v git &>/dev/null; then
  ok "Git installed ($(git --version | sed 's/git version //'))"
else
  spin "Installing Git..." brew install git
  if command -v git &>/dev/null; then
    ok "Git installed"
  else
    fail "Git installation failed."
    exit 1
  fi
fi

divider

# ── Git user name ──────────────────────────────────────────────
GIT_NAME=$(git config --global user.name 2>/dev/null || echo "")

if [[ -n "$GIT_NAME" ]]; then
  ok "Git name: $GIT_NAME"
elif [[ -n "$GH_NAME" ]]; then
  info "Git name is not set. Your GitHub name is: $GH_NAME"
  if confirm "  Use \"$GH_NAME\" as your git name?"; then
    git config --global user.name "$GH_NAME"
    ok "Git name set to: $GH_NAME"
  else
    CUSTOM_NAME=$(input "Your name for commits")
    git config --global user.name "$CUSTOM_NAME"
    ok "Git name set to: $CUSTOM_NAME"
  fi
else
  info "Git name is not set."
  CUSTOM_NAME=$(input "Your name for commits")
  git config --global user.name "$CUSTOM_NAME"
  ok "Git name set to: $CUSTOM_NAME"
fi

# ── Git email ──────────────────────────────────────────────────
GIT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

if [[ -n "$GIT_EMAIL" ]]; then
  ok "Git email: $GIT_EMAIL"

  if [[ -n "$GH_ALL_EMAILS" ]]; then
    if echo "$GH_ALL_EMAILS" | grep -qiF "$GIT_EMAIL"; then
      ok "Matches your GitHub account"
    else
      echo ""
      warn "Your git email doesn't match any GitHub email."
      info "Commits won't link to your GitHub profile unless they match."
      echo ""

      info "Your GitHub emails:"
      echo "$GH_ALL_EMAILS" | while read -r email; do
        gum style --foreground 76 "      $email"
      done
      echo ""
      info "Your current git email:"
      gum style --foreground 214 "      $GIT_EMAIL"
      echo ""

      CHOICE=$(gum choose --cursor.foreground 99 --selected.foreground 76 \
        "Update git email to match GitHub" \
        "Keep current email (won't link to GitHub profile)")

      if [[ "$CHOICE" == "Update"* ]]; then
        if [[ -n "$GH_PRIMARY_EMAIL" ]] && [[ $(echo "$GH_ALL_EMAILS" | wc -l) -gt 1 ]]; then
          # Multiple GitHub emails — let them pick
          info "Which GitHub email should git use?"
          CHOSEN_EMAIL=$(echo "$GH_ALL_EMAILS" | gum choose --cursor.foreground 99 --selected.foreground 76)
        elif [[ -n "$GH_PRIMARY_EMAIL" ]]; then
          CHOSEN_EMAIL="$GH_PRIMARY_EMAIL"
        else
          CHOSEN_EMAIL=$(echo "$GH_ALL_EMAILS" | head -1)
        fi
        git config --global user.email "$CHOSEN_EMAIL"
        GIT_EMAIL="$CHOSEN_EMAIL"
        ok "Git email updated to: $GIT_EMAIL"
      else
        info "Keeping: $GIT_EMAIL"
      fi
    fi
  fi

elif [[ -n "$GH_PRIMARY_EMAIL" ]]; then
  info "Git email not set. Using your GitHub primary email."
  git config --global user.email "$GH_PRIMARY_EMAIL"
  GIT_EMAIL="$GH_PRIMARY_EMAIL"
  ok "Git email set to: $GIT_EMAIL"

else
  info "Git email not set."
  CUSTOM_EMAIL=$(input "Your email (should match GitHub)")
  git config --global user.email "$CUSTOM_EMAIL"
  GIT_EMAIL="$CUSTOM_EMAIL"
  ok "Git email set to: $GIT_EMAIL"
fi

# ═════════════════════════════════════════════════════════════════
# Step 4: Vercel CLI + authentication
# ═════════════════════════════════════════════════════════════════

header "Vercel CLI & authentication"

info "Vercel hosts your app on the internet."
info "You'll need a free account: https://vercel.com/signup"
info "Tip: Sign up with GitHub for the smoothest experience!"
echo ""

if ! confirm "  Do you have a Vercel account?"; then
  echo ""
  warn "Please create an account at https://vercel.com/signup"
  info "We recommend signing up with GitHub."
  info "Press Enter once you've signed up."
  read -rp ""
fi

if command -v vercel &>/dev/null; then
  ok "Vercel CLI installed"
else
  spin "Installing Vercel CLI..." npm install -g vercel
  if command -v vercel &>/dev/null; then
    ok "Vercel CLI installed"
  else
    fail "Vercel CLI installation failed. Try: npm install -g vercel"
    exit 1
  fi
fi

divider

if vercel whoami &>/dev/null 2>&1; then
  VERCEL_USER=$(vercel whoami 2>/dev/null)
  ok "Logged in to Vercel as: $VERCEL_USER"
else
  info "Let's log you in to Vercel."
  echo ""
  if confirm "  Open browser to log in to Vercel?"; then
    vercel login
    if vercel whoami &>/dev/null 2>&1; then
      VERCEL_USER=$(vercel whoami 2>/dev/null)
      ok "Logged in to Vercel as: $VERCEL_USER"
    else
      fail "Vercel login failed. Try: vercel login"
      exit 1
    fi
  else
    fail "Vercel authentication is required."
    exit 1
  fi
fi

# ═════════════════════════════════════════════════════════════════
# Step 5: Neon CLI + authentication
# ═════════════════════════════════════════════════════════════════

header "Neon CLI & authentication"

info "Neon is your PostgreSQL database host."
info "You'll need a free account: https://neon.tech"
echo ""

if ! confirm "  Do you have a Neon account?"; then
  echo ""
  warn "Please create a free account at https://neon.tech"
  info "We recommend signing up with GitHub."
  info "Press Enter once you've signed up."
  read -rp ""
fi

if command -v neonctl &>/dev/null; then
  ok "Neon CLI installed"
else
  if confirm "  Install Neon CLI via npm?"; then
    spin "Installing Neon CLI..." npm install -g neonctl
    if command -v neonctl &>/dev/null; then
      ok "Neon CLI installed"
    else
      fail "Neon CLI installation failed. Try: npm install -g neonctl"
      exit 1
    fi
  else
    fail "Neon CLI is required."
    exit 1
  fi
fi

divider

if neonctl me &>/dev/null 2>&1; then
  NEON_USER=$(neonctl me 2>/dev/null | head -1)
  ok "Logged in to Neon"
else
  info "Let's log you in. A browser window will open."
  echo ""
  if confirm "  Open browser to log in to Neon?"; then
    neonctl auth
    if neonctl me &>/dev/null 2>&1; then
      ok "Logged in to Neon!"
    else
      fail "Neon login failed. Try: neonctl auth"
      exit 1
    fi
  else
    fail "Neon authentication is required."
    exit 1
  fi
fi

# ═════════════════════════════════════════════════════════════════
# Step 6: Name the project
# ═════════════════════════════════════════════════════════════════

header "Name your project"

CURRENT_DIR=$(pwd)
CURRENT_NAME=$(basename "$CURRENT_DIR")

info "Current folder name: $(gum style --bold --foreground 255 "$CURRENT_NAME")"
info "This becomes your GitHub repo name and Vercel project name."
echo ""

if confirm "  Rename the project?"; then
  echo ""
  info "Use lowercase letters, numbers, and hyphens (e.g. my-cool-app)"
  NEW_NAME=$(input "$CURRENT_NAME")

  # Sanitize
  NEW_NAME=$(echo "$NEW_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')

  if [[ -z "$NEW_NAME" ]]; then
    warn "Invalid name. Keeping: $CURRENT_NAME"
    NEW_NAME="$CURRENT_NAME"
  elif [[ "$NEW_NAME" == "$CURRENT_NAME" ]]; then
    ok "Name unchanged"
  else
    PARENT_DIR=$(dirname "$CURRENT_DIR")
    NEW_DIR="$PARENT_DIR/$NEW_NAME"

    if [[ -d "$NEW_DIR" ]]; then
      fail "A folder named '$NEW_NAME' already exists."
      warn "Keeping: $CURRENT_NAME"
      NEW_NAME="$CURRENT_NAME"
    else
      mv "$CURRENT_DIR" "$NEW_DIR"
      cd "$NEW_DIR"
      CURRENT_DIR="$NEW_DIR"
      CURRENT_NAME="$NEW_NAME"
      ok "Renamed to: $NEW_NAME"
      ok "Location: $NEW_DIR"
    fi
  fi
else
  NEW_NAME="$CURRENT_NAME"
  ok "Keeping: $CURRENT_NAME"
fi

PROJECT_NAME="$NEW_NAME"

# ═════════════════════════════════════════════════════════════════
# Step 7: Initialize fresh git repo
# ═════════════════════════════════════════════════════════════════

header "Initialize git repository"

info "We'll clear the template's git history and start fresh."
info "This makes the repo yours — clean slate."
echo ""

if [[ -d .git ]]; then
  rm -rf .git
  ok "Cleared old history"
fi

git init --quiet
git add -A
git commit --quiet -m "Initial commit — project scaffolding from Creator AI Tools hackathon"
ok "Fresh git repo initialized with initial commit"

# ═════════════════════════════════════════════════════════════════
# Step 8: Push to GitHub
# ═════════════════════════════════════════════════════════════════

header "Push to GitHub"

GH_USER=$(gh api user --jq '.login' 2>/dev/null || echo "")

if [[ -z "$GH_USER" ]]; then
  fail "Could not determine GitHub username."
  exit 1
fi

info "We'll create $(gum style --bold "github.com/$GH_USER/$PROJECT_NAME")"
echo ""

REPO_VISIBILITY=$(gum choose --cursor.foreground 99 --selected.foreground 76 \
  --header "  Repository visibility:" \
  "Private (only you can see it)" \
  "Public (anyone can see it)")

if [[ "$REPO_VISIBILITY" == "Public"* ]]; then
  VISIBILITY_FLAG="public"
else
  VISIBILITY_FLAG="private"
fi

if gh repo view "$GH_USER/$PROJECT_NAME" &>/dev/null 2>&1; then
  warn "Repo $GH_USER/$PROJECT_NAME already exists on GitHub."
  if confirm "  Use the existing repo?"; then
    git remote add origin "https://github.com/$GH_USER/$PROJECT_NAME.git" 2>/dev/null || \
      git remote set-url origin "https://github.com/$GH_USER/$PROJECT_NAME.git"
    ok "Remote set to existing repo"
  else
    fail "Please choose a different project name or delete the existing repo."
    exit 1
  fi
else
  spin "Creating GitHub repository..." \
    gh repo create "$PROJECT_NAME" --"$VISIBILITY_FLAG" --source=. --remote=origin --push
  ok "Created: github.com/$GH_USER/$PROJECT_NAME ($VISIBILITY_FLAG)"
fi

# Push if not already pushed by gh repo create
if ! git log --oneline origin/main &>/dev/null 2>&1; then
  git push -u origin main 2>/dev/null || git push -u origin "$(git branch --show-current)"
fi
ok "Code pushed to GitHub"

spin "Creating production branch..." \
  git push origin main:production 2>/dev/null || true
ok "Production branch created"

# ═════════════════════════════════════════════════════════════════
# Step 9: Create Vercel project
# ═════════════════════════════════════════════════════════════════

header "Link Vercel project"

info "This connects your repo to Vercel for auto-deploys."
echo ""

if confirm "  Link project to Vercel now?"; then
  vercel link --yes 2>/dev/null || vercel link
  vercel git connect --yes 2>/dev/null || true
  ok "Vercel project linked!"
else
  warn "Skipped. You can run 'vercel link' later."
fi

# ═════════════════════════════════════════════════════════════════
# Step 10: Provision Neon databases
# ═════════════════════════════════════════════════════════════════

header "Provision Neon databases"

info "We'll create a Neon project with two branches:"
info "  main  → production database"
info "  dev   → local development database"
echo ""

if confirm "  Create Neon project '$PROJECT_NAME'?"; then
  # Create the Neon project (this creates the main branch automatically)
  NEON_OUTPUT=$(neonctl projects create \
    --name "$PROJECT_NAME" \
    --set-context \
    --output json 2>/dev/null) || {
    fail "Failed to create Neon project."
    fail "You may need to create it manually at https://console.neon.tech"
    NEON_OUTPUT=""
  }

  if [[ -n "$NEON_OUTPUT" ]]; then
    NEON_PROJECT_ID=$(echo "$NEON_OUTPUT" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)
    ok "Neon project created: $PROJECT_NAME"

    # Create the dev branch
    info "Creating dev branch..."
    neonctl branches create \
      --name dev \
      --project-id "$NEON_PROJECT_ID" \
      --output json &>/dev/null && \
      ok "Dev branch created" || \
      warn "Could not create dev branch — you can create it later in the Neon console"

    divider

    # Get connection strings
    info "Fetching connection strings..."
    echo ""

    # Dev branch (pooled = DATABASE_URL, direct = DIRECT_URL)
    DEV_POOLED=$(neonctl connection-string dev \
      --project-id "$NEON_PROJECT_ID" \
      --pooled 2>/dev/null || echo "")
    DEV_DIRECT=$(neonctl connection-string dev \
      --project-id "$NEON_PROJECT_ID" 2>/dev/null || echo "")

    # Production / main branch
    PROD_POOLED=$(neonctl connection-string main \
      --project-id "$NEON_PROJECT_ID" \
      --pooled 2>/dev/null || echo "")
    PROD_DIRECT=$(neonctl connection-string main \
      --project-id "$NEON_PROJECT_ID" 2>/dev/null || echo "")

    if [[ -n "$DEV_POOLED" && -n "$DEV_DIRECT" ]]; then
      ok "Dev connection strings retrieved"

      # Generate BETTER_AUTH_SECRET
      BETTER_AUTH_SECRET=$(openssl rand -base64 33)

      # Write .env file
      cat > .env << ENVEOF
# Neon database — dev branch (local development)
DATABASE_URL="${DEV_POOLED}"
DIRECT_URL="${DEV_DIRECT}"

# Better Auth
BETTER_AUTH_SECRET="${BETTER_AUTH_SECRET}"
BETTER_AUTH_URL=http://localhost:3000
ENVEOF
      ok "Created .env with dev database URLs and BETTER_AUTH_SECRET"
    else
      warn "Could not fetch dev connection strings."
      info "You'll need to add them to .env manually — Claude can help."
    fi

    if [[ -n "$PROD_POOLED" && -n "$PROD_DIRECT" ]]; then
      ok "Production connection strings retrieved"
      # Store for use in Vercel env setup
      NEON_PROD_POOLED="$PROD_POOLED"
      NEON_PROD_DIRECT="$PROD_DIRECT"
    else
      warn "Could not fetch production connection strings."
    fi

    divider

    # Set Vercel environment variables if we have them
    if [[ -n "$NEON_PROD_POOLED" && -n "$NEON_PROD_DIRECT" ]]; then
      info "Setting production database URLs on Vercel..."
      echo ""

      if confirm "  Add database URLs and BETTER_AUTH_SECRET to Vercel production env?"; then
        PROD_BETTER_AUTH_SECRET=$(openssl rand -base64 33)

        # Use printf to pipe values into vercel env add (avoids interactive prompt)
        printf '%s' "$NEON_PROD_POOLED" | vercel env add DATABASE_URL production --force 2>/dev/null && \
          ok "Set DATABASE_URL on Vercel" || warn "Could not set DATABASE_URL"

        printf '%s' "$NEON_PROD_DIRECT" | vercel env add DIRECT_URL production --force 2>/dev/null && \
          ok "Set DIRECT_URL on Vercel" || warn "Could not set DIRECT_URL"

        printf '%s' "$PROD_BETTER_AUTH_SECRET" | vercel env add BETTER_AUTH_SECRET production --force 2>/dev/null && \
          ok "Set BETTER_AUTH_SECRET on Vercel" || warn "Could not set BETTER_AUTH_SECRET"

        # BETTER_AUTH_URL will need to be set manually after first deploy when URL is known
        info "After your first deploy, set BETTER_AUTH_URL on Vercel to your production URL"
      fi
    fi
  fi
else
  warn "Skipped Neon setup. Claude can help you set this up later."
fi

# ═════════════════════════════════════════════════════════════════
# Step 11: Summary & Claude handoff
# ═════════════════════════════════════════════════════════════════

header "Setup complete!"

confetti

show_raccoon

gum style \
  --border rounded \
  --border-foreground 76 \
  --padding "1 3" \
  --margin "0 2" \
  "$(gum style --foreground 76 --bold "Everything is set up!")" \
  "" \
  "$(gum style --foreground 76 "  ✓") Homebrew, Node.js, Git, GitHub CLI, Vercel CLI, Neon CLI" \
  "$(gum style --foreground 76 "  ✓") Git identity matches GitHub" \
  "$(gum style --foreground 76 "  ✓") Authenticated with GitHub, Vercel, and Neon" \
  "$(gum style --foreground 76 "  ✓") Project: $PROJECT_NAME" \
  "$(gum style --foreground 76 "  ✓") Repo: github.com/$GH_USER/$PROJECT_NAME" \
  "$(gum style --foreground 76 "  ✓") Vercel project linked" \
  "$(gum style --foreground 76 "  ✓") Neon databases provisioned (main + dev branches)"

# ── Generate handoff file ──────────────────────────────────────

HANDOFF_FILE="$CURRENT_DIR/CLAUDE_HANDOFF.md"

cat > "$HANDOFF_FILE" << 'HANDOFF_EOF'
# Project Setup Handoff

I just ran the setup script for the Creator AI Tools hackathon project. Everything is installed, databases are provisioned, and the project is pushed to GitHub and linked to Vercel.

## What's already done
- All CLI tools installed (brew, node, npm, git, gh, vercel, neonctl)
- Authenticated with GitHub, Vercel, and Neon
- Project pushed to GitHub with a fresh repo
- Vercel project linked
- Production branch created on GitHub
- Neon project created with two branches: `main` (production) and `dev` (local development)
- `.env` file created with dev database URLs (`DATABASE_URL`, `DIRECT_URL`) and `BETTER_AUTH_SECRET`
- Production database URLs and `BETTER_AUTH_SECRET` added to Vercel environment variables

## What I need you to do

### 1. Install dependencies and push the database schema
- Run `npm install` to install dependencies
- Run `npm run db:push` to push the Prisma schema to the dev database
- Verify it worked by running `npm run db:studio`

### 2. Test locally
- Run `npm run dev` and verify the app starts at localhost:3000
- Check that sign-up and sign-in work

### 3. Deploy to production
- Run `git push origin main:production` to trigger a Vercel deploy
- Verify the Vercel deployment succeeds (check the Vercel dashboard or CLI)

### 4. Verify production
- Check the production URL works
- Verify sign-up works on production

### 5. If anything is missing
- If `.env` is missing or incomplete, check with `cat .env` and use `neonctl connection-string dev --pooled` and `neonctl connection-string dev` to get the URLs
- If Vercel env vars are missing, use `vercel env ls` to check and `vercel env add` to set them
- If the Neon project wasn't created, use `neonctl projects create --name <project-name> --set-context` then `neonctl branches create --name dev`

When all steps are done, give me a summary of:
- My local dev URL
- My production URL
- What to do next to start building features
HANDOFF_EOF

# ── Show handoff instructions ──────────────────────────────────

echo ""
gum style \
  --border rounded \
  --border-foreground 214 \
  --padding "1 3" \
  --margin "0 2" \
  --bold \
  "Next: paste the handoff into Claude"

echo ""
info "The handoff prompt is saved to: $(gum style --bold "CLAUDE_HANDOFF.md")"
echo ""
info "To finish setup, open Claude Code and paste the handoff:"
echo ""
gum style --foreground 255 --background 237 --padding "1 2" --margin "0 4" \
  "cd $(pwd)" \
  "claude"
echo ""
info "Then paste the contents of CLAUDE_HANDOFF.md into Claude."
info "It will walk you through database setup and your first deploy."
echo ""

if confirm "  Show the handoff text now?"; then
  echo ""
  gum style --foreground 240 "  ───── CLAUDE_HANDOFF.md ─────"
  echo ""
  gum format < "$HANDOFF_FILE"
  echo ""
  gum style --foreground 240 "  ───── end ─────"
fi

echo ""
gum style \
  --foreground 99 \
  --bold \
  --margin "0 2" \
  "You're all set — happy hacking! 🚀"
echo ""
