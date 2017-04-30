if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash; fi
source ~/.git-prompt.sh
export PS1='🏃  \[\e[1;34m\]\W\[\e[m\]\[\e[1;31m\]$(__git_ps1)\[\e[m\]\[\e[0;32m\] \$\[\e[m\] '
export PATH="~/workspace/hashops/bin:/usr/local/heroku/bin:$PATH"
export GREP_OPTIONS="--color=auto"

# export GPGKEY=50CC859B
# # kill -0 checks to see if the pid exists
# if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
#     GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`
# else
# # No, gpg-agent not available; start gpg-agent
#     eval `gpg-agent --daemon --no-grab --write-env-file $HOME/.gpg-agent-info`
# fi
# export GPG_TTY=`tty`
# export GPG_AGENT_INFO

eval "$(hub alias -s)"
alias be="bundle exec "
alias git-latest-tag="git fetch --tags && git describe --abbrev=0 --tags"
alias git-tag-log="git log --tags --oneline --decorate --simplify-by-decoration"
alias git-authors="git ls-tree -r -z --name-only HEAD -- . | xargs -0 -n1 git blame --line-porcelain HEAD | grep  '^author ' | sort | uniq -c | sort -nr"
alias git-link="git symbolic-ref --short HEAD | xargs git push --set-upstream origin"
alias sort-version="sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n"
alias git-branches=" git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' |tail -n 15"
alias specs="bundle exec rspec"
alias pg-start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg-stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias f="RAILS_ENV=development foreman start -f Procfile.dev"
alias ssh-pubkey="pbcopy < ~/.ssh/id_rsa.pub && echo 'Copied SSH Public Key to clipboard.'"
alias docker-vps="ssh deploy@docker.hashbang.co.nz"
alias docker-deploy="echo | bundle exec cap staging docker:deploy"
alias gk="lpass show 3687407676867194205 | tail -n1 | pbcopy"
git-branch-search() {
  git branch | grep $1 | head -n1 | xargs git checkout
}
alias gbs=git-branch-search

st () {
  echo -ne "\033]0;$1\007"
}

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

export NVM_DIR="/Users/paul/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
source $(brew --prefix nvm)/nvm.sh
