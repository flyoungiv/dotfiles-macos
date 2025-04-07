### TL;DR

This script:

- Installs tools
- Sets up config
- links dotfiles
- Works the same way every time (idempotent)

### 💥 1. **Detect if Homebrew is installed**

Instead of assuming it's there, the script checks:
```bash
if command -v brew &>/dev/null; then
  echo "Homebrew already installed."
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
```

This means the script is **idempotent** — safe to run more than once without errors.

---

### 💻 2. **Use `brew shellenv`**

This command sets up the right environment variables so `brew` works **in this shell session**, especially right after installing it:

```bash
# Note: this command is for an Intel Mac
eval "$(/usr/local/bin/brew shellenv)"
```

Otherwise, you'd have to close and reopen Terminal before `brew` would be available.

---

### 📦 3. **Install the stuff you want**

```bash
brew install --cask iterm2 google-chrome ...
brew install node nvm
```

This is just your wishlist of tools — but all together in one repeatable, portable script.

---

### 🪄 4. **Link dotfiles**

This is where we say: “Hey system, use my version of `.zshrc`, `.gitconfig`, etc.” — all from your repo.

```bash
ln -sf "$PWD/zshrc" "$HOME/.zshrc"
```

---

### Credits

This install script was created with assistance from ChatGPT (OpenAI), using the GPT-4-turbo model (April 2024).
Customized and maintained by your mom.