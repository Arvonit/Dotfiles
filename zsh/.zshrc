# Add brew python to PATH
export PATH="/usr/local/bin:$PATH"

# Options
setopt PROMPT_SUBST

# Fetch version control info
autoload -Uz vcs_info
# Enable advanced completion system
autoload -Uz compinit && compinit
# Routine run before each prompt
function precmd() {
    # Print a newline before the prompt, unless it's the first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi

    vcs_info
}

# Format the vcs_info_msg_0_ variable 
zstyle ':vcs_info:git:*' formats '%b'
# Monsterous command for case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# Partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Prompt Components
NEWLINE=$'\n'
SEGMENT_SEPARATOR=$'\ue0b0'
ARROW=$'\u276F'
GIT_BRANCH=$'\ue0a0'
BRIGHT_WHITE=15
USER_SEGMENT="%F{$BRIGHT_WHITE}%n@%m %f"
START_SEGMENT_SEPARATOR="%K{blue}%F{black}$SEGMENT_SEPARATOR%f%k"
DIRECTORY_SEGMENT="%K{blue}%F{$BRIGHT_WHITE} %~ %f%k"
END_SEGMENT_SEPATATOR="%K{black}%F{blue}$SEGMENT_SEPARATOR%f%k"
TOP="$USER_SEGMENT$START_SEGMENT_SEPARATOR$DIRECTORY_SEGMENT$END_SEGMENT_SEPATATOR$NEWLINE"
BOTTOM="%F{blue}$ARROW%f "
PROMPT="$TOP$BOTTOM" # Final Prompt

# Aliases
alias ls="ls -F"
alias ll="ls -l"

# Custom commands
jdk() {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}