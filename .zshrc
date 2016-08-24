# Load all the configuration files in ~/.my-zsh that end in .zsh
for config_file (/home/budiman/.my-zsh/*.zsh); do
  source $config_file
done

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


##########################################################################
################ This section is added by JOJO ZSH PROMPT ################
###### Please remove all these line below if you no longer using it ######
######## Thanks for trying me out though, really appreciate it :D ########
##########################################################################

# Modify this if you have a different installation path, can also make it to something like /home/jojo/ so that you can link this configuration for other users (such as root)
_JOJO_ZSH_HOME=$HOME

# Modify this to the themes you want to use inside the /themes folder, the theme name without the .zsh, default is jojo theme
_JOJO_ZSH_THEME=""

# Source JoJo ZSH Prompt Themes
if [[ -s "${_JOJO_ZSH_HOME}/.jojo-zsh-prompt/base.zsh" ]]; then
  source "${_JOJO_ZSH_HOME}/.jojo-zsh-prompt/base.zsh"
fi

# Theme loading
if [[ $_JOJO_ZSH_THEME != "" ]]; then
  source "${_JOJO_ZSH_HOME}/.jojo-zsh-prompt/themes/${_JOJO_ZSH_THEME}.zsh"
else
  source "${_JOJO_ZSH_HOME}/.jojo-zsh-prompt/themes/jojo.zsh"
fi

#########################################################################
######################### END OF JOJO ZSH PROMPT ########################
#########################################################################
