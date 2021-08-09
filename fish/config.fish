# Abbreviations
# alias : symlink :: abbreviation : textexpander
abbr --add g git
abbr --add l ls
abbr --add p python3
abbr --add v nvim
abbr --add vim nvim
abbr --add b 'bash -c'
abbr --add t 'tmux attach || tmux new'
abbr --add gst 'git status'
abbr --add gl 'git log --all --graph --decorate --oneline'
abbr --add clang 'clang -Wall -Wextra -Werror --std=c99'

# TODO: Add if here and clean up set commands with correct flags

# Enable zoxide
zoxide init fish | source

# Disable directory shortening in `prompt_pwd`
set -g fish_prompt_pwd_dir_length 0

# Disable greeting at startup
set -g fish_greeting

# Set editor to Neovim
set -gx EDITOR nvim

# Set configuration folder to ~/.config
# This is native to Linux, but some programs support it on macOS
set -gx XDG_CONFIG_HOME ~/.config

# Disable less history 
set -gx LESSHISTFILE /dev/null

# Add directories to PATH
fish_add_path ~/.local/bin

# TODO: See if these universal variables can be converted into global variables
# Custom syntax highlighting colors
# - Yellow for commands
# - White for subcommands
# - Blue for operators
# - Green for quotes
# - Red for errors
set -U fish_color_autosuggestion brblack
set -U fish_color_command yellow
set -U fish_color_comment brblack
set -U fish_color_end blue # ; &&
set -U fish_color_error red
set -U fish_color_escape blue # \n
set -U fish_color_operator brwhite # () $i
set -U fish_color_param brwhite
set -U fish_color_quote green
set -U fish_color_redirection blue # > < 2>

# user@hostname pwd $ ...
function fish_prompt
    # set_color brblack
    # echo -n '['(date +"%I:%M %p")'] '
    set_color yellow
    echo -n $USER
    set_color normal
    echo -n '@'
    set_color blue
    echo -n (prompt_hostname)
    set_color green
    echo -n ' '(basename (prompt_pwd))' '
    set_color normal
    echo -n '$ '
end

# Display exit code on right hand side
# [EXIT_CODE] or [EXIT|CODE]
function fish_right_prompt
    # Save the return status of the previous command(s)
    set -l last_status $pipestatus
    # Create a fancy string with said return status
    set -l status_string (__fish_print_pipestatus "[" "]" "|" (set_color $fish_color_status) \
        (set_color --bold $fish_color_status) $last_status)
    # Print it
    echo -n $status_string
end
