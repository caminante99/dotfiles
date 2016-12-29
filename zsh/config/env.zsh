##############################################################
# DEFINES ENVIRONMENT VARIABLES.
##############################################################

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

# Set neovim as EDITOR if it's available, otherwise use vim
command -v nvim >/dev/null && export EDITOR=nvim || export EDITOR=vim
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi

# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# Better spell checking & auto correction prompt
export SPROMPT="zsh: correct %F{red}'%R'%f to %F{blue}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "
export MANPAGER="nvim -c 'set ft=man' -"

# 10ms for key sequences
KEYTIMEOUT=1

##############################################################
# Options
###############################################################
setopt autoparamslash  # tab completing directory appends a slash
setopt noflowcontrol   # disable start (C-s) and stop (C-q) characters
setopt interactivecomments  # allow comments, even in interactive shells
setopt printexitvalue       # for non-zero exit status


##############################################################
# PATH.
##############################################################
fpath=('/usr/local/share/zsh/site-functions' $fpath)

# GNU Coreutils
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  "/usr/local/opt/coreutils/libexec/gnubin"
  /usr/local/Cellar/git
  ${HOME}/.dotfiles/bin
  $path
)
# export PATH=$PATH:/usr/local/bin
# export PATH=$PATH:/usr/local/sbin
# export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
# export PATH=$PATH:/usr/local/Cellar/git
# export PATH=$PATH:~/.dotfiles/bin
# export PATH=$PATH:/usr/bin
# export PATH=$PATH:/bin:/usr/sbin:/sbin:/opt/X11/bin:~/.fzf/bin

# ~/Library/Python/3.5/bin
# ~/.nvm/versions/node/v7.3.0/bin
# /usr/local/bin
# /usr/local/sbin
# /usr/local/opt/coreutils/libexec/gnubin
# /usr/local/Cellar/git
# ~/.tmuxifier/bin
# ~/.dotfiles/bin
# /usr/bin
# /bin
# /usr/sbin
# /sbin
# /opt/X11/bin
# ~/.fzf/bin


#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
##############################################################
# Custom/Plugins
###############################################################
export TERM=xterm-256color
export GITHUB_USER="ahmedelgabri"
export PROJECTS="$HOME/Sites/dev"

# Make sure all the repos I clone uses my template, not sure if this is a good idea though?
# export GIT_TEMPLATE_DIR=$HOME/.dotfiles/git/git-template
export FZF_DEFAULT_OPTS='--reverse --extended --tabstop=2 --cycle --margin 3'
export FZF_DEFAULT_COMMAND='rg --no-messages --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview "(([[ "{}" =~ \.twig$ ]] &&  highlight -S html -O ansi -l {} 2> /dev/null || highlight -O ansi -l {} 2> /dev/null) || cat {} || tree -C {}) 2> /dev/null | head -200" --bind "?:toggle-preview,alt-k:preview-page-up,alt-j:preview-page-down"'
export FZF_CTRL_R_OPTS="--no-mouse --preview 'echo {}' --preview-window down:5:hidden --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export PURE_PROMPT_SYMBOL="ϟ" # λ ▴ ⚡ ϟ
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
export HOMEBREW_INSTALL_BADGE="🍕"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
# export HOMEBREW_CASK_OPTS=--require-sha

