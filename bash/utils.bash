# General
alias sort-version="sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n"
alias ssh-pubkey="pbcopy < ~/.ssh/id_rsa.pub && echo 'Copied SSH Public Key to clipboard.'"
alias crontab="VIM_CRONTAB=true crontab"

# Ruby / Rails
alias be="bundle exec "
alias specs="bundle exec rspec"
alias f="RAILS_ENV=development hivemind Procfile.dev"
alias rails-worker="QUEUE=* bundle exec rake environment resque:work TERM_CHILD=1"
alias rails-server="be puma -p 3000"

# Terraform
tp() {
  terraform plan | grep -Ev '"([^"]*)" => "\1"'
}

# Postgres
alias pg-start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg-stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
