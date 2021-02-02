# Abbreviations
# alias : symlink :: abbreviation : textexpander
abbr --add v nvim
abbr --add z 'zsh -c'
abbr --add b 'bash -c'
abbr --add p python3

# TODO: Add if here and clean up set commands with correct flags
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

# Jose Javier's colors (see [his dotfiles](https://github.com/JJGO/dotfiles/blob/master/terminal/.config/alacritty/alacritty.yml))
# set -U fish_color_autosuggestion brblack
# set -U fish_color_command green
# set -U fish_color_comment brblack
# set -U fish_color_end brblue # ; &&
# set -U fish_color_error red
# set -U fish_color_escape cyan # \n
# set -U fish_color_operator brblue # () $i
# set -U fish_color_param normal
# set -U fish_color_quote yellow
# set -U fish_color_redirection magenta # > < 2>

# user@hostname pwd $ ...
function fish_prompt
    # set_color normal
    # echo -n '['(date +"%I:%M %p")']'
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
    # Create a formatted string with return status
    set -l status_string (__fish_print_pipestatus "[" "]" "|" (set_color $fish_color_status) \
        (set_color --bold $fish_color_status) $last_status)
    # Display it
    echo -n $status_string
end