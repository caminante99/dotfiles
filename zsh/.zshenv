# vim:ft=zsh:
#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

##############################################################
# General
###############################################################
setopt autoparamslash  # tab completing directory appends a slash
setopt noflowcontrol   # disable start (C-s) and stop (C-q) characters
setopt interactivecomments  # allow comments, even in interactive shells
setopt printexitvalue       # for non-zero exit status


# Better spell checking & auto correction prompt
export SPROMPT="zsh: correct %F{red}'%R'%f to %F{blue}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

##############################################################
# Custom/Plugins
###############################################################
# export TERM=xterm-256color-italic
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
# export HOMEBREW_NO_INSECURE_REDIRECT=1
# export HOMEBREW_CASK_OPTS=--require-sha

##############################################################
# NVM
###############################################################
export NVM_DIR=~/.nvm

##############################################################
# Python
###############################################################
export PYTHONSTARTUP=$HOME/.pyrc.py

# Virtualenvwrapper
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE="$HOME/.virtualenvs"
export PIP_RESPECT_VIRTUALENV=true
