# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Replace ls with eza
alias ls='eza --icons --group-directories-first --header --time-style=long-iso'

# Long format with icons and headers
alias ll='eza -l --header --icons'

# Include hidden files
alias la='eza -la --header --icons'

# Tree view (2 levels)
alias tree='eza --tree -L 2'

# Git status integration
alias lg='eza -l --git'

# cd 
alias ..='cd ..'
alias ~='cd ~'

# Neovim
alias v='nvim'

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Cargo
. "$HOME/.cargo/env"

# Mise
 eval "$(mise activate bash)"

# sk
alias sk='sk --color=16'
alias p='cd ` fd . -t d --max-depth 1 "/home/macaronj/Documents/Projects" | sk`'
alias c='cd ` fd . -L -t d --max-depth 1 "/home/macaronj/.config" | sk`'
alias b='papers ` fd . -t f "/home/macaronj/Documents/Books" | sk`'
source <(sk --shell bash --shell-bindings)
SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."
