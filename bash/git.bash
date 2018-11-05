alias git-latest-tag="git fetch --tags && git describe --abbrev=0 --tags"
alias git-tag-log="git log --tags --oneline --decorate --simplify-by-decoration"
alias git-authors="git ls-tree -r -z --name-only HEAD -- . | xargs -0 -n1 git blame --line-porcelain HEAD | grep  '^author ' | sort | uniq -c | sort -nr"
alias git-link="git symbolic-ref --short HEAD | xargs git push --set-upstream origin"
alias git-branches="git for-each-ref --color --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' |tail -n 15"
alias git-branch-files="git log master..head --name-only | grep '^[a-z]' | grep -v '^commit' | sort | uniq"

git-branch-search() {
  git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ | grep $1 | head -n1 | xargs git checkout
}

todays-branches-for() {
  git log --author="$1" --all --no-walk --since="24 hours ago" --date=relative --pretty="format:%Cred%aN%Creset %h %>(14) %Cgreen%ad%Creset %D"
}

git-pr() {
  open "https://github.com/$(git remote get-url origin | sed 's/.*:\(.*\)\.git/\1/')/pull/new/$(git symbolic-ref --short HEAD)"
}

alias gbs=git-branch-search
alias gbf=git-branch-files
alias lnb=last-n-branches
