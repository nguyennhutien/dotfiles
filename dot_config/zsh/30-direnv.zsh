{{ if eq .chezmoi.os "darwin" }}
# direnv hook
eval "$(direnv hook zsh)"
{{ end }}
