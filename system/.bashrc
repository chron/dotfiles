if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash; fi
eval "$(hub alias -s)"
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
source $(brew --prefix nvm)/nvm.sh
source $(which assume-role)

source ~/dotfiles/bash/env.bash
source ~/dotfiles/bash/utils.bash
source ~/dotfiles/bash/aws.bash
source ~/dotfiles/bash/git.bash
source ~/dotfiles/bash/ow.bash
source ~/dotfiles/bash/prompt.bash
