# You can override your zshrc here instead of editing the file manually
# Tweak your zsh plugins and their settings here

# Fix for vi-mode keys not working
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start {
        echoti smkx
    }
    function zle_application_mode_stop {
        echoti rmkx
    }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# ZSH Autosuggestions plugin setting
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=red"

# FZF Default and Ctrl+t Command to use ag instead of find, also enable finding hidden files
# Need to install ag in order for this to work, uncomment to use default command if you don't want to use ag
if command -v ag | grep -qv alias; then
    export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
    export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
fi

# FZF Default Options, enable preview window
# Needed one of the highlight, coderay, rougify to use syntax highlighting features, will use cat if you don't have them installed
export FZF_DEFAULT_OPTS="--height 40% --reverse --select-1 --exit-0 \
    --preview '(bat --style=numbers --color=always {} || \
    highlight -O ansi -l {} || \
    coderay {} || \
    rougify {} || \
    cat {}) 2> /dev/null | head -100'"

# FZF Alt+C Options to include preview of current directory tree
# Needed tree to work, uncomment if you don't want to install tree
export FZF_ALT_C_OPTS="--height 40% --reverse --preview 'tree -C {} | head -21'"

# FZF use Tmux pane instead when in tmux session
if [ -z "$TMUX" ]; then
    export FZF_TMUX=1
    export FZF_TMUX_HEIGHT=1
fi
