#!/usr/bin/env bash
set -e


if ! command -v brew >/dev/null; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


brew install git chezmoi age mise direnv


chezmoi init git@github.com:nguyennhutien/dotfiles.git
chezmoi apply
