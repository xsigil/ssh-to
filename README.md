# ssh-to

Symlink-driven, transparent SSH shortcut manager.

Instead of typing `ssh hostname`, `ssh-to` inspects `$0` to connect transparently. It provides a dedicated directory (`~/.local/share/ssh-to/machines`) to keep your primary PATH clutter-free.

## Features

- **Zero-Overhead Transparent SSH**: Execute `<hostname>` directly as a command with full argument passthrough.
- **Path Isolation**: Shortcuts live in `~/.local/share/ssh-to/machines/`, leaving `~/.local/bin` clean.
- **Config Sync**: Automatically create shortcuts from all `Host` definitions inside `~/.ssh/config`.
- **Pure Shell**: Requires no external dependencies beyond standard bash and ssh.

## Installation

```sh
make install

```

Add the machines directory to your shell configuration (`~/.zshrc` or `export.zsh`):

```sh
export PATH="$(ssh-to path):$PATH"

```

## Usage

# Manually register host shortcut(s)
```sh
ssh-to link vps1 bastion
```

# Or sync all hosts from ~/.ssh/config at once
```sh
ssh-to sync
```

# Connect directly
```sh
bastion
vps1 -L 8080:localhost:8080
```

# List registered shortcuts
```sh
ssh-to list
```

# Remove shortcut
```sh
ssh-to unlink vps1

```

## License

MIT
