export BASH_SILENCE_DEPRECATION_WARNING=1
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash; fi
eval "$(hub alias -s)"
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
source $(which assume-role)

source ~/dotfiles/bash/env.bash
source ~/dotfiles/bash/utils.bash
source ~/dotfiles/bash/git.bash
source ~/dotfiles/bash/prompt.bash
source ~/dotfiles/bash/nonsense.bash
if [ -f ~/dotfiles/bash/secrets.bash ]; then source ~/dotfiles/bash/secrets.bash; fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

# storypark stuff ###
eval "$(direnv hook bash)"
export LOCAL_IP=$(ipconfig getifaddr en0)
export HOSTNAME=$LOCAL_IP:3000
# source /Users/paul/workspace/storyjar/ui_testing_scripts/alias.sh
# end storypark stuff ###

source $(brew --prefix nvm)/nvm.sh