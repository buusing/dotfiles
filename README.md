# dotfiles

My personal macOS setup. Clone, run one script, and you're good to go.

## Fresh macOS Setup

### 1. Before you start

- Make sure macOS is up to date
- Back up anything not in iCloud or git

### 2. SSH key

Set up an SSH key so you can clone from GitHub. Either use the 1Password SSH agent, or generate a new key:

```zsh
curl https://raw.githubusercontent.com/buusing/dotfiles/HEAD/ssh.sh | sh -s "your@email.com"
```

### 3. Clone the dotfiles

```zsh
git clone git@github.com:buusing/dotfiles.git ~/.dotfiles
```

### 4. Run the setup script

```zsh
cd ~/.dotfiles && ./fresh.sh
```

This will:
- Install Oh My Zsh and Homebrew (if missing)
- Symlink `.zshrc`
- Install everything in the `Brewfile`
- Create `~/Code` and `~/Herd`
- Copy TablePlus snippets
- Apply macOS system preferences

### 5. After setup

- Open **Herd.app** and complete its setup
- Once iCloud has synced, run `mackup restore` to restore app preferences
- Restart your Mac

## What's in here

| File/Folder | Purpose |
|---|---|
| `fresh.sh` | Main setup script — run this on a new machine |
| `Brewfile` | All apps and tools installed via Homebrew |
| `.zshrc` | Shell config (symlinked to `~/.zshrc`) |
| `aliases.zsh` | Custom shell aliases |
| `path.zsh` | PATH configuration |
| `.macos` | macOS system preferences |
| `.mackup.cfg` | Mackup config for backing up app settings |
| `ssh.sh` | SSH key generation helper |
| `clone.sh` | Repos to clone on a fresh machine |
| `tableplus/snippets/` | TablePlus SQL snippets |
