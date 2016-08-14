# Load all the configuration files in ~/.my-zsh that end in .zsh
for config_file (/home/budiman/.my-zsh/*.zsh); do
  source $config_file
done
# Load git prompt https://github.com/budimanjojo/my-git-prompt.git
source /home/budiman/.my-git-prompt/git-prompt.zsh

## All the Basic Stuffs
bindkey -e                                    # use emacs keybindings
setopt autocd                                 # cd into directory just by typing the directory name
setopt autopushd                              # cd is pushd
setopt pushdignoredups                        # do not push multiple copies of same directory
setopt pushdtohome                            # pushd without argument means pushd to home dir
setopt extendedglob                           # treat #,~,and ^ for globbing patterns, ~ means directory expansion
unsetopt caseglob                             # make globbing case-insensitive
unsetopt flowcontrol                          # enabling this make forward and backward search (^r and ^s) freeze the terminal
setopt interactivecomments                    # enable comments in interactive shells

## Default editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
