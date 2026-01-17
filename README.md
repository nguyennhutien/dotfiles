# Dotfiles (mise + chezmoi + direnv)

This repository is the **single source of truth** for my development environment.

## What this repo does

- Bootstraps a new macOS machine with minimal assumptions
- Manages shell, tooling, and performance tuning via **chezmoi**
- Manages language runtimes via **mise**
- Manages per-project environments via **direnv**
- Keeps secrets **out of git**

## What this repo does NOT do

- Does not manage project code
- Does not store plaintext secrets
- Does not pin language versions globally

## Bootstrap (new machine)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nguyennhutien/dotfiles/main/bootstrap.sh)"
```

## Daily usage

- Open a terminal
- `cd` into a project
- Toolchains and env vars load automatically

## Repo philosophy

- Bootstrap is minimal and dumb
- Dotfiles are declarative
- Projects decide versions
- Secrets never enter git
