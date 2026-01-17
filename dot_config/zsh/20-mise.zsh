{{ if eq .chezmoi.os "darwin" }}
# mise activation (macOS only)
eval "$(mise activate zsh)"
{{ end }}
