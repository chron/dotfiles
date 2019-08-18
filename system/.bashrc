if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash; fi
eval "$(hub alias -s)"
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
source $(which assume-role)

source ~/dotfiles/bash/env.bash
source ~/dotfiles/bash/utils.bash
source ~/dotfiles/bash/aws.bash
source ~/dotfiles/bash/git.bash
source ~/dotfiles/bash/ow.bash
source ~/dotfiles/bash/prompt.bash
source ~/dotfiles/bash/nonsense.bash
source ~/dotfiles/bash/secrets.bash # TODO: Check if exists

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

source $(brew --prefix nvm)/nvm.sh
