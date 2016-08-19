autoload -U compinit && compinit
unsetopt menucomplete                       # do not autoselect the first completion entry (setting this overwrite automenu)
setopt autolist								              # automatically list choices of ambiguous completion
setopt automenu                             # show completion menu on successive tab press
setopt complete_in_word                     # cursor will stay before and after completion
setopt correctall							              # enable autocorrect
setopt always_to_end                        # cursor will always moved to the end of word after completion
setopt globdots                             # enable completion of dotfiles
setopt longlistjobs                         # list jobs in long format
zmodload -i zsh/complist
zstyle ':completion:*' rehash true			    # newly added executables are added immediately
zstyle ':completion:*:*:*:*:*' menu select  # menu selection on tab press
zstyle ':completion:*' list-colors ''       # show colors on menu completion
zstyle ':completion:*' insert-tab false     # pressing tab will not insert tab no matter what
# autocomplete case and hyphen insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# show dots if tab completion is taking too long to load
function expand-or-complete-with-dots() {
  echo -n "\e[31m.......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# formatting and messages got it from https://github.com/spicycode/ze-best-zsh-config/blob/master/.zsh/completion.zsh
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
export SPROMPT="By %R do you mean %r?? ([Y]es, [N]o, [A]bort, [E]dit) "

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.my-zsh/cache/

