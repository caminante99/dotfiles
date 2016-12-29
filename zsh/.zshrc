# vim:ft=zsh:
#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

##############################################################
# TOOLS.
##############################################################

command -v grc >/dev/null && source "`brew --prefix`/etc/grc.bashrc"
[ -s "`brew --prefix z`/etc/profile.d/z.sh" ] && source "`brew --prefix z`/etc/profile.d/z.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##############################################################
# CONFIG.
##############################################################

for config (~/.dotfiles/zsh/config/*.zsh) source $config
for func (~/.dotfiles/zsh/config/functions/*.zsh) source $func

##############################################################
# LOCAL.
##############################################################

[ -f ~/.zstuff ] && source ~/.zstuff
