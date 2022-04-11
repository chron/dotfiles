# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init bash pre)"

export BASH_SILENCE_DEPRECATION_WARNING=1
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash; fi
eval "$(hub alias -s)"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
source $(which assume-role)

source ~/dotfiles/bash/env.bash
source ~/dotfiles/bash/utils.bash
source ~/dotfiles/bash/git.bash
source ~/dotfiles/bash/prompt.bash
source ~/dotfiles/bash/nonsense.bash
if [ -f ~/dotfiles/bash/storypark.bash ]; then source ~/dotfiles/bash/storypark.bash; fi
if [ -f ~/dotfiles/bash/secrets.bash ]; then source ~/dotfiles/bash/secrets.bash; fi
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

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

source $(brew --prefix nvm)/nvm.sh
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


. "$HOME/.cargo/env"

# Fig post block. Keep at the bottom of this file.
eval "$(fig init bash post)"

