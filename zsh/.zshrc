# Enable advanced completion system
autoload -Uz compinit && compinit

# Monsterous command to enable case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Enable partial auto-completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Custom prompt
# username@hostname pwd $
PROMPT="%F{blue}%n%f@%F{blue}%m%f %F{yellow}%1~%f $ "

# Aliases
alias ls="ls -FGh"
alias ll="ls -l"
alias la="ll -a"
