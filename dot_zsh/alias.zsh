# You can override your zshrc here instead of editing the file manually
# Add your own custom aliases here

# Use nvim instead if installed
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi

# Basic aliases
alias vi=vim
alias cpr="cp -r"
alias cprf="cp -rf"
alias rmr="rm -r"
alias rmrf="rm -rf"
alias sudo='sudo '

# Edit configuration files
editvim() {"$EDITOR" "$HOME/.vimrc"}
editnvim() {"$EDITOR" "$HOME/.config/nvim/init.vim"}
editzsh() {"$EDITOR" "$HOME/.zshrc"}
editbash() {"$EDITOR" "$HOME/.bashrc"}
editalias() {"$EDITOR" "$ZSH_CUSTOM/alias.zsh"}
editzplug() {"$EDITOR" "$ZSH_CUSTOM/plugs.zsh"}
edittmux() {"$EDITOR" "$HOME/.tmux.conf"}
editxrc() {"$EDITOR" "$HOME/.Xresources"}
editterm() {"$EDITOR" "$HOME/.config/termite/config"}
editi3() {"$EDITOR" "$HOME/.i3/config"}
editcompton() {"$EDITOR" "$HOME/.config/compton.conf"}
editdunst() {"$EDITOR" "$HOME/.config/dunst"}
editsudo() {sudo EDITOR="$EDITOR" visudo}

# Image conversions
alias cwtp='find ./ -name "*.webp" -exec dwebp {} -o {}.png \; && rm -r *.webp'
alias cptj='mogrify -flatten -format jpg *.png && rm -r *.png'
alias cjtp='find ./ -name "*.jpg" -exec convert {} {}.png \; && rm -r *.jpg'

# Keep alias on common commands
alias sudo="sudo "
alias watch="watch "
