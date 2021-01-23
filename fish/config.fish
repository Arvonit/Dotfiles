# Convenience abbreviations
abbr --add v nvim

# Base 16 syntax highlighting
# Not using it at the moment
if status --is-interactive
	if test -d ~/.config/fish/base16
		set fish_function_path $fish_function_path ~/.config/fish/base16/functions
		source ~/.config/fish/base16/conf.d/base16.fish
	end
end

# Source autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Disable directory shortening in `prompt_pwd`
set -g fish_prompt_pwd_dir_length 0

# Disable greeting at startup
set fish_greeting

set -gx EDITOR nvim

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