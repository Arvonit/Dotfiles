# Abbreviations
# alias : symlink :: abbreviation : textexpander
abbr --add v nvim

# Source autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Disable directory shortening in `prompt_pwd`
set -g fish_prompt_pwd_dir_length 0

# Disable greeting at startup
set fish_greeting

# Set editor to Neovim
set -gx EDITOR nvim

# Custom syntax highlighting colors
# - White for commands
# - Yellow for subcommands
# - Blue as accent color
# - Green for quotes
# - Red for errors
set -U fish_color_autosuggestion brblack
set -U fish_color_command brwhite
set -U fish_color_comment brblack
set -U fish_color_end blue # ; &&
set -U fish_color_error red
set -U fish_color_escape blue # \n
set -U fish_color_operator yellow # () $i
set -U fish_color_param yellow
set -U fish_color_quote green
set -U fish_color_redirection blue # > < 2>

# Custom prompt
# user@hostname pwd $ ...
function fish_prompt
    # Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -l pipestatus_string (__fish_print_pipestatus "[" "] " "|" (set_color $fish_color_status) \
        (set_color --bold $fish_color_status) $last_pipestatus)

    # set_color normal
    # echo -n '['(date +"%I:%M %p")']'
    set_color blue
    echo -n $USER
    set_color normal
    echo -n '@'
    set_color blue
    echo -n (prompt_hostname)
    set_color yellow
    echo -n ' '(basename (prompt_pwd))' '
    echo -n $pipestatus_string
    set_color normal
    echo -n '$ '
end