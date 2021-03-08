# General
alias sort-version="sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n"
alias ssh-pubkey="pbcopy < ~/.ssh/*.pub && echo 'Copied SSH Public Key to clipboard.'"
alias crontab="VIM_CRONTAB=true crontab"
alias reload="source ~/.bashrc"

# Ruby / Rails
alias be="bundle exec"
alias rails-test-diff="git diff --name-only master... | grep test | xargs rails test"
alias f="reload && foreman start -f Procfile.dev"
alias t="RAILS_ENV=test bundle exec rails test"
alias serve="ruby -run -e httpd . -p 8000"

# Postgres
alias pg-start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg-stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
