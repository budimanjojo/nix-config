# You can override your zshrc here instead of editing the file manually
# Tweak your look and feel for zsh here

# Powerlevel10k Configs
# Temporarily change options.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
    emulate -L zsh -o extended_glob

    # Unset all configuration options. This allows you to apply configuration changes without
    # restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
    unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

    # Zsh >= 5.1 is required.
    autoload -Uz is-at-least && is-at-least 5.1 || return

    # Basic Configs
    typeset -g POWERLEVEL9K_MODE=nerdfont-complete
    typeset -g POWERLEVEL9K_ICON_PADDING=moderate
    typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=
    typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%254F╭─'
    typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%254F╰─'
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%254F─╮'
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
    typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%254F─╯'
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
    if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
      typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=254
      typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
      typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
    fi
    typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
    typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
    typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
    typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
    typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
    typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
    typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
    typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

    # Prompt Elements
    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        context
        host
        dir
        vcs
        vi_mode
        newline
        prompt_char
    )
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        status
        command_execution_time
        virtualenv
        kubecontext
        time
        newline
    )

    # Powerlevel9k Segment Configs
    # prompt_char
    typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=2
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=9
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='⮞'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='⮞'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='⮟'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='⮞'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

    # context
    typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
    typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=0
    typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=3
    typeset -g POWERLEVEL9K_CONTEXT_{ROOT,SUDO,REMOTE_SUDO}_TEMPLATE='%n'
    typeset -g POWERLEVEL9K_CONTEXT_{ROOT,SUDO,REMOTE_SUDO}_FOREGROUND=0
    typeset -g POWERLEVEL9K_CONTEXT_{ROOT,SUDO,REMOTE_SUDO}_BACKGROUND=1
    typeset -g POWERLEVEL9K_CONTEXT_REMOTE_TEMPLATE='%n'
    typeset -g POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND=0
    typeset -g POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND=3

    # host
    typeset -g POWERLEVEL9K_HOST_TEMPLATE="%m"
    typeset -g POWERLEVEL9K_HOST_LOCAL_BACKGROUND=2
    typeset -g POWERLEVEL9K_HOST_LOCAL_FOREGROUND=0
    typeset -g POWERLEVEL9K_HOST_REMOTE_BACKGROUND=16
    typeset -g POWERLEVEL9K_HOST_REMOTE_FOREGROUND=0
    typeset -g POWERLEVEL9K_HOST_ICON="\uF109 "
    typeset -g POWERLEVEL9K_SSH_ICON="\uF233 "

    # dir
    typeset -g POWERLEVEL9K_DIR_BACKGROUND=4
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=0
    typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last
    typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=".."
    typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=0
    typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=255
    typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
    local anchor_files=(
        .bzr
        .citc
        .git
        .hg
        .node-version
        .python-version
        .go-version
        .ruby-version
        .lua-version
        .java-version
        .perl-version
        .php-version
        .tool-version
        .shorten_folder_marker
        .svn
        .terraform
        CVS
        Cargo.toml
        composer.json
        go.mod
        package.json
        stack.yaml
    )
    typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
    typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
    typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
    typeset -g POWERLEVEL9K_DIR_HYPERLINK=false
    typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v2
    typeset -g POWERLEVEL9K_LOCK_ICON=''
    typeset -g POWERLEVEL9K_DIR_CLASSES=(
        '~(|/*)'    HOME    ''
        '*'         DEFAULT ''
    )
    typeset -g POWERLEVEL9K_DIR_HOME_BACKGROUND=4
    typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND=0
    typeset -g POWERLEVEL9K_DIR_DEFAULT_NOT_WRITABLE_BACKGROUND=1
    typeset -g POWERLEVEL9K_DIR_DEFAULT_NOT_WRITABLE_FOREGROUND=0

    # Vcs
    function my_git_formatter() {
        emulate -L zsh
        if [[ -n $P9K_CONTENT ]]; then
            typeset -g my_git_format=$P9K_CONTENT
            return
        fi

        local       meta='%7F' # white foreground
        local      clean='%0F' # black foreground
        local   modified='%0F' # black foreground
        local  untracked='%0F' # black foreground
        local conflicted='%1F' # red foreground

        local res
        local where
        if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
            res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}"
            where=${(V)VCS_STATUS_LOCAL_BRANCH}
        elif [[ -n $VCS_STATUS_TAG ]]; then
            res+="${meta}#"
            where=${(V)VCS_STATUS_TAG}
        fi

        # If local branch name or tag is at most 32 characters long, show it in full.
        # Otherwise show the first 12 … the last 12.
        # Tip: To always show local branch name in full without truncation, delete the next line.
        (( $#where > 32 )) && where[13,-13]="…"
        res+="${clean}${where//\%/%%}"

        # Display the current Git commit if there is no branch or tag.
        # Tip: To always display the current Git commit, remove `[[ -z $where ]] &&` from the next line.
        [[ -z $where ]] && res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

        if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
          res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
        fi

        (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
        (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
        (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
        (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
        (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
        (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
        (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
        [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
        (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
        (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
        (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
        (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
        (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

        typeset -g my_git_format=$res
    }
    functions -M my_git_formatter 2>/dev/null

    typeset -g POWERLEVEL9K_VCS_HIDE_TAGS=true
    typeset -g POWERLEVEL9K_VCS_SHORTEN_LENGTH=4
    typeset -g POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=11
    typeset -g POWERLEVEL9K_VCS_SHORTEN_STRATEGY=truncate_middle
    typeset -g POWERLEVEL9K_VCS_SHORTEN_DELIMITER='..'
    typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=' '
    typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
    typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'
    typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
    typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
    typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
    typeset -g POWERLEVEL9K_VCS_PREFIX=''
    typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

    # vi_mode
    typeset -g POWERLEVEL9K_VI_MODE_BACKGROUND=5
    typeset -g POWERLEVEL9K_VI_MODE_FOREGROUND=0
    typeset -g POWERLEVEL9K_VI_INSERT_MODE_STRING=INSERT
    typeset -g POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
    typeset -g POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL

    # Time
    typeset -g POWERLEVEL9K_TIME_FORMAT="%D{%a, %d %b | %I:%M %p}"

    # Status
    typeset -g POWERLEVEL9K_STATUS_CROSS=true
    typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
    typeset -g POWERLEVEL9K_STATUS_OK=true
    typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
    typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=2
    typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=0
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=2
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=0
    typeset -g POWERLEVEL9K_STATUS_ERROR=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=1
    typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=0
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=false
    typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=1
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=0
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=1
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=0

    # command_execution_time
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=3
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='took '

    # virtualenv
    typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=5
    typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=0
    typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
    typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
    typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

    # kubecontext
    typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|flux'
    typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
        '*'       DEFAULT
    )
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=0
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND=5
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_VISUAL_IDENTIFIER_EXPANSION=''
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
    typeset -g POWERLEVEL9K_KUBECONTEXT_PREFIX=''
    POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
    POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'

    # if p10k is already loaded, reload configuration.
    (( ! $+functions[p10k] )) || p10k reload
}

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
