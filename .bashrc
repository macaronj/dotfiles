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

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

. "$HOME/.cargo/env"
