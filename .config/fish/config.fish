# Commands to run in interactive sessions can go here
if status is-interactive
    fish_add_path ~/.local/bin
    set -U fish_greeting
    fish_add_path $HOME/.cargo/bin
    starship init fish | source
    mise activate fish | source
    fzf --fish | source
    set -Ux VISUAL nvim
    set -Ux EDITOR nvim
    # For fd (fast and modern)
    set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
    # For ripgrep (with symlink support)
    set -x FZF_DEFAULT_COMMAND 'rg --files --follow --hidden --no-ignore'
    # Replace ls with eza

    set -x HELIX_RUNTIME ~/Documents/Projects/helix/runtime
    alias ls='eza --icons --group-directories-first --header --time-style=long-iso'

    # Long format with icons and headers
    alias ll='eza -l --header --icons'
    # Include hidden files
    alias la='eza -la --header --icons'
    # Git status integration
    alias lg='eza -l --git'
    # Tree view (2 levels)
    alias tree='eza --tree -L 2'
    # Neovim
    alias v='bob run nightly'
    alias vs='bob run nightly'
    # Open Book with Papers
    function b
        set file (fd . --type f ~/Documents/Books | fzf)
        if test -n "$file"
            papers "$file" >/dev/null 2>&1 &
            disown $lastpid
        end
    end
    # Change into config folder
    function c
        set -l whither (fd . ~/.config -t d -d 1 --follow --hidden | fzf)
        test -n "$whither" && cd "$whither"
    end
    # Change into projects folder
    function p
        set -l whither (fd . ~/Projects -t d -d 1 | fzf)
        test -n "$whither" && cd "$whither"
    end
    # Choose edit file from notes folder

    function nc
        set -l whither (fd . ~/Documents/Nextcloud/Notes -t f -d 1| fzf)
        test -n "$whither" && hx "$whither"
    end
else
    mise activate fish --shims | source
end
