# This file is created automatically by dotfiles-installer script.
# Please don't make any changes here
# You can edit files in $HOME/.zsh folder instead.
# We have provided you general.zsh, alias,zsh, looks.zsh, plugs.zsh in that folder for you to customize
# To add your your own zplugin plugins, edit the file $HOME/.zshrc.bundles instead

# Load $HOME/.zshrc.before if exists
if [ -e "$HOME/.zshrc.before" ]; then
    source $HOME/.zshrc.before
fi

## Added by Zinit's installer
source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zplugin installer's chunk

# Load oh-my-zsh's library
zinit ice svn multisrc"*.zsh" as"null"
zinit snippet OMZ::lib

# Plugins
zinit ice svn
zinit snippet OMZ::plugins/vi-mode

zinit ice wait atinit"zpcompinit; zpcdreplay" lucid
zinit light zdharma/fast-syntax-highlighting

zinit ice svn
zinit snippet OMZ::plugins/history-substring-search

zinit ice wait atload"_zsh_autosuggest_start" lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice svn
zinit snippet OMZ::plugins/tmux

zinit ice svn
zinit snippet OMZ::plugins/kubectl

# Theme
zinit light romkatv/powerlevel10k

# Program
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin

zinit ice svn multisrc"{completion,key-bindings}.zsh" as"null"
zinit snippet "https://github.com/junegunn/fzf/trunk/shell"

# Load custom plugins if exists
if [ -e "$HOME/.zshrc.bundles" ]; then
    source $HOME/.zshrc.bundles
fi

# Load $HOME/.zshrc.local if exists
if [ -e "$HOME/.zshrc.local" ]; then
    source $HOME/.zshrc.local
fi

# Load config files
for custom in $HOME/.zsh/*.zsh; do
    source "$custom"
done

# Added by COC Vim, include Node JS path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Base16 Shell Colorscheme
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
### End of Zinit's installer chunk
