# main zsh settings. env in ~/.zprofile
# read second


# source global shell alias & variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U tetris # main attraction of zsh, obviously


# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion


# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved


# fzf setup
source <(fzf --zsh) # allow for fzf history widget


# binds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word
# ctrl J & K for going up and down in prev commands
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward
bindkey '^R' fzf-history-widget


# open fff file manager with ctrl f
# openfff() {
#  fff <$TTY
#  zle redisplay
#}
#zle -N openfff
#bindkey '^f' openfff





# Load git info
autoload -Uz vcs_info
precmd() { vcs_info }

# Enable branch + status
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{red}‹%b%c%u›%f'
zstyle ':vcs_info:git:*' actionformats '%F{red}‹%b|%a%c%u›%f'
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}+%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}*%f'

# Allow PROMPT to expand variables
setopt prompt_subst

# Prompt
PROMPT='%F{blue}┌──(%F{green}%n%F{cyan}@%F{yellow}%m%F{blue})-[%F{magenta}%~%F{blue}]${vcs_info_msg_0_}
%F{blue}└─>%f '

setopt hist_ignore_all_dups hist_ignore_space append_history inc_append_history share_history

