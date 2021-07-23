#!/bin/bash

# This script will install and configure ZSH, NEOVIM and Terminal colorscheme for you
# For Zsh, this script will add Powerlevel10k, Zsh-syntax-highlighting and Zsh-autosuggestions
# For Vim, this script will add Vim-easy-align, Vim-colorschemes, Base16-vim, Vim-airline, Nerdtree, Tcomment, Vim-fugitive, Emmet-vim, Ale, Coc.nvim,
# Vim-snippets, Fzf
# For Coc nvim, this script will add coc.json, coc-snippets, coc-pairs, coc-highlight, coc-tsserver, coc-tslint, coc-html, coc-css, coc-phpls, coc-stylelint,
# coc,vimlsp, coc-yaml
# For Terminal colorschemes, this script will add Base16-google-dark in your
# Xresources (for URXVT) and setup Gnome Terminal colors (if gnome-terminal is installed)

set -u

install_zsh=
install_vim=
install_tmux=
source_dir="$(dirname $(readlink -f $0))"

colorme() {
    if [ -t 1 ]; then
        RED=$(printf '\033[31m')
        GREEN=$(printf '\033[32m')
        YELLOW=$(printf '\033[33m')
        BLUE=$(printf '\033[34m')
        BOLD=$(printf '\033[1m')
        RESET=$(printf '\033[m')
    else
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        BOLD=""
        RESET=""
    fi
}
colorme

help() {
    printf "$BLUE"
    cat << EOF
usage: $0 [OPTIONS]

    --help                  Show this message
    --vim                   Include Vimrc with its plugins
    --zsh                   Include Zshrc with its plugins
    --tmux                  Include Tmux config file
    --color                 Include colorscheme for terminals
    --all                   Include all without asking
EOF
printf "$RESET"
}

success() {
    set +u
    printf "$YELLOW"
    cat << 'EOF'

                     ___  ___| |_ _   _ _ __
                    / __|/ _ \ __| | | | '_ \
                    \__ \  __/ |_| |_| | |_) |
                    |___/\___|\__|\__,_| .__/
                                       |_|
                 / _(_)_ __ (_)___| |__   ___  __| |
                | |_| | '_ \| / __| '_ \ / _ \/ _` |
                |  _| | | | | \__ \ | | |  __/ (_| |
                |_| |_|_| |_|_|___/_| |_|\___|\__,_|

EOF
    if [ ! -z "$summary_zsh" ]; then
        echo "   ${BOLD}Your Zsh setup is done. You can now run zsh or restart your"
        echo "               ${BOLD}terminal to try your new shell!"
    fi
    if [ ! -z "$summary_vim" ]; then
        echo "              ${BOLD}Your Vim setup is done. Enjoy it!"
    fi
    if [ ! -z "$summary_tmux" ]; then
        echo "${BOLD}Your Tmux setup is done. Type tmux in your terminal and enjoy it!"
    fi
    printf "$RESET"
}

for opt in "$@"; do
    case $opt in
        --help)
            help
            exit 0
            ;;
        --vim)
            install_vim=1
            ;;
        --zsh)
            install_zsh=1
            ;;
        --tmux)
            install_tmux=1
            ;;
        --all)
            install_vim=1
            install_zsh=1
            install_tmux=1
            install_xr=1
            ;;
        *)
            error "unknown option: $opt"
            help
            exit 1
            ;;
    esac
done

log() {
    echo "${GREEN}$@${RESET}" 1>&2
}

error() {
    echo "${RED}Error: $@${RESET}" 1>&2
}
ask() {
  while true; do
    read -p "$1 ([y]/n) " -r
    REPLY=${REPLY:-"y"}
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      return 1
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
      return 0
    else
      log "Type y or n to continue."
    fi
  done
}

command_exists() {
    command -v "$@" | grep -qv alias
}

version_greater() {
    echo $1 $2 | tr " " "\n" | sort -V | tail -1
}

backup_file() {
    log "Backing up $1."
    mv "$1" "$1"-"$(date +%y-%m-%d_%H-%M-%S)"
    echo "${BLUE}$1 backed up as "$1"-"$(date +%y-%m-%d_%H-%M-%S)"${RESET}"
}

change_shell() {
    set +u
    if [ "$(basename "$SHELL")" = "zsh" ]; then
        return
    fi
    if ! command_exists chsh; then
        error "Chsh is not installed. Could not set your default shell to Zsh, please do it manually."
        return
    fi
    log "Switching Shell to ZSH..."
    if [ -f /etc/shells ]; then
        shells_file=/etc/shells
    elif [ -f /usr/share/defaults/etc/shells ]; then
        shells_file=/usr/share/defaults/etc/shells
    else
        error "Could not find /etc/shells file. Could not set your default shell to Zsh, please do it manually."
        return
    fi
    if ! zsh=$(which zsh) || ! grep -qx "$zsh" "$shells_file"; then
        if ! zsh=$(grep '^/.*/zsh$' "$shells_file" | tail -1) || [ ! -f "$zsh" ]; then
            error "No zsh binary found or not present in '$shells_file'. Could not set your default shell to Zsh, please do it manually."
            return
        fi
    fi
    if ! chsh -s "$zsh"; then
        error "chsh command unsuccessful. Change your default shell manually."
    else
        export SHELL="$zsh"
        log "Shell successfully changed to zsh."
    fi
}

setup_zsh() {
    if ! command_exists zsh; then
        error "Zsh is not installed. Please install zsh first."
        exit 1
    fi
    old_zshrc="$HOME/.zshrc"
    if [ -f "$old_zshrc" ]; then
        backup_file $old_zshrc
    fi
    log "Linking new .zshrc file"
    ln -sf "$source_dir/.zshrc" "$old_zshrc"
    log "Installing Zinit"
    if [ ! -d "$HOME/.zinit/bin" ]; then
        if ! command_exists curl; then
            error "Curl is not installed. Please install curl first."
            exit 1
        fi
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
    fi
    cust_dir="$source_dir/.zsh"
    cust_files=("general.zsh" "alias.zsh" "plugs.zsh" "looks.zsh")
    config_dir="$HOME/.zsh"
    if [ ! -d "$config_dir" ]; then
        mkdir -p "$config_dir"
    fi
    for custom in "${cust_files[@]}"; do
        if [ ! -f "$config_dir/$custom" ]; then
            cp "$cust_dir/$custom" "$config_dir"
            log "$custom copied to $config_dir/$custom"
        else
            log "$config_dir/$custom already exists, skipping"
        fi
    done
    change_shell
    log "Setting up colorschemes"
    if [ ! -d "$HOME/.config/base16-shell" ]; then
        git clone https://github.com/chriskempson/base16-shell.git "$HOME/.config/base16-shell" || {
            error "Git clone of base16-shell repo failed, check your connection or try again later."
            exit 1
        }
        BASE16_SHELL="$HOME/.config/base16-shell/"
        [ -n "$PS1" ] && \
            [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
                eval "$("$BASE16_SHELL/profile_helper.sh")" && base16_google-dark
    else
        log "You already have base16-shell in your system. We will set up your colorscheme to base16-google-dark"
        BASE16_SHELL="$HOME/.config/base16-shell/"
        [ -n "$PS1" ] && \
            [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
                eval "$("$BASE16_SHELL/profile_helper.sh")" && base16_google-dark
    fi
}

setup_tmux() {
    if ! command_exists tmux; then
        error "Tmux is not installed. Please install Tmux first."
        exit 1
    fi
    old_tmuxrc="$HOME/.tmux.conf"
    if [ -f "$old_tmuxrc" ]; then
        backup_file $old_tmuxrc
    fi
    log "Linking new .tmux.conf file"
    ln -sf "$source_dir/.tmux.conf" "$old_tmuxrc"
}

setup_vim() {
    if ! command_exists vim nvim; then
        error "Vim or Neovim is not installed. Please install Vim or Neovim first."
        exit 1
    fi
    if ! command_exists node; then
        error "Nodejs is not installed. Please install Nodejs first."
        exit 1
    fi
    old_vimrc="$HOME/.vimrc"
    if command_exists nvim; then
        set +u
        if [ -z "$XDG_CONFIG_HOME" ]; then
            nvimdir="$HOME/.config/nvim"
            old_nvimrc="$nvimdir/init.vim"
        else
            nvimdir="$XDG_CONFIG_HOME/nvim"
            old_nvimrc="$nvimdir/init.vim"
        fi
        set -u
    fi
    if [ -f "$old_vimrc" ]; then
        backup_file $old_vimrc
    fi
    if [ -f "$old_nvimrc" ]; then
        backup_file $old_nvimrc
    fi
    old_vimdir="$HOME/.vim"
    if [ -d "$old_vimdir" ]; then
        backup_file $old_vimdir
    fi
    log "Installing Vim-plug Plugin Manager"
    if ! command_exists curl; then
        error "Curl is not installed. Please install curl first."
        exit 1
    fi
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || {
        error "Failed to download and install vim-plug, check your connection or try again later."
        exit 1
    }
    yarn_dir="$HOME/.yarn"
    if [ -d "$yarn_dir" ]; then
        backup_file $yarn_dir
    fi
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
    log "Linking new .vimrc file"
    if command_exists nvim; then
        log "Linking new .nvimrc file"
        mkdir -p "$nvimdir" && ln -sf "$source_dir/.config/nvim/init.vim" "$old_nvimrc" && ln -sf "$source_dir/.config/nvim/coc-settings.json" "$nvimdir/coc-settings.json"
    fi
    if command_exists vim; then
        vimcommand="vim"
    elif command_exists nvim; then
        vimcommand="nvim"
    fi
    ln -s "$source_dir/.vimrc" "$old_vimrc"
    ln -s "$source_dir/.vim/templates" "$old_vimdir/templates"
    log "Installing Plugins"
    $vimcommand +PlugInstall +qall
    vim_version=$(vim --version | head -1 | grep -o '[0-9]\.[0-9]')
    nvim_version=$(nvim --version | head -1 | grep -o '[0-9]\.[0-9]\.[0-9]')
    log "Installing COC vim"
    if command_exists vim; then
        req_version=8.0
        if [ $(version_greater $req_version $vim_version) != "$vim_version" ]; then
            error "Your Vim version is $vim_version, you need to install Vim version $req_version to be able to use COC.nvim"
        fi
    fi
    if command_exists nvim; then
        req_version=0.3.1
        if [ $(version_greater $req_version $nvim_version) != "$nvim_version" ]; then
            error "Your Neovim version is $nvim_version, you need to install Neovim version $req_version to be able to use COC.nvim"
        fi
    fi
    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
    $vimcommand -c ":silent :CocInstall -sync coc-json coc-snippets coc-pairs coc-highlight coc-tsserver coc-tslint coc-html coc-css coc-phpls coc-stylelint coc-vimlsp coc-yaml" -c ":qall"
}

if [ -z "$install_zsh" ]; then
    ask "Do you want to install zsh with its plugins?"
    install_zsh=$?
fi

if [ -z "$install_vim" ]; then
    ask "Do you want to setup Vim with its plugins?"
    install_vim=$?
fi

if [ -z "$install_tmux" ]; then
    ask "Do you want to setup Tmux?"
    install_tmux=$?
fi

# Setup zsh
if [ "$install_zsh" -eq 1 ]; then
    log "Setting up Zsh..."
    setup_zsh
    summary_zsh=1
fi

# Setup vim
if [ "$install_vim" -eq 1 ]; then
    log "Setting up Vim or Neovim..."
    setup_vim
    summary_vim=1
fi

if [ "$install_tmux" -eq 1 ]; then
    log "Setting up Tmux..."
    setup_tmux
    summary_tmux=1
fi

success
