source ~/.git-prompt.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

__aws_ps1() {
  if [[ -z "${AWS_ACCOUNT_NAME}" ]]; then
    echo ''
  else
    echo " [$AWS_ACCOUNT_NAME/$AWS_ACCOUNT_ROLE]"
  fi
}
export PS1='🏃 \[\e[1;34m\]\W\[\e[m\]\[\e[1;31m\]$(__git_ps1)\[\e[m\]\[\e[0;32m\]$(__aws_ps1) \$\[\e[m\] '
