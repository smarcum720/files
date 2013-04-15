# Proxy setup
export http_proxy=http://cache1.lexmark.com:80
export no_proxy='*.prtdev.lexmark.com'
export SHELL="/bin/zsh"

get_prompt_string()
{
    echo '%n@%m:%~>'
}

PROMPT=$(get_prompt_string)
setopt PROMPT_SUBST

# History setup
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zhistory

# Report time on long commands
REPORTTIME=2

# Setup a few options
setopt AUTO_PUSHD           # make cd act like pushd
setopt HIST_IGNORE_ALL_DUPS # remove old duplicates when a new command is stored in the history
setopt HIST_REDUCE_BLANKS   # remove extra white space from the history
setopt list_types           # list file types when completing

# Setup up directory listing colors
eval `dircolors --sh`
ls()
{
   local ls
   if [[ -n $LS_COLORS ]]; then
      ls=(ls -N --color=auto)
   else
      ls=(ls -N -F)
   fi
   command $ls $*
}

# Various utility aliases and variables
alias vi='vim'
alias h='history'
alias man='env LANG=c man'
alias ll='ls -al'
alias la='ls -a'
alias ssh='ssh -Y'

COLORTERM=1

# Key bindings
bindkey '\e[A' history-search-backward # up key searches history forwards
bindkey '\e[B' history-search-forward # down key searches history backwards

