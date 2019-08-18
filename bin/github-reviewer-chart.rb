require 'bundler/inline'
require 'json'

gemfile do
  source 'https://rubygems.org'

  gem 'octokit'
end

token = ENV['GITHUB_ACCESS_TOKEN']
raise 'set GITHUB_ACCESS_TOKEN' unless token

api = Octokit::Client.new(access_token: token)
pull_requests = api.pull_requests('optimalworkshop/spacewaffle', state: 'closed')
cursor = api.last_response

until (Time.now - pull_requests.last.created_at) > 5_184_000 # 60 days
  cursor = cursor.rels[:next].get
  pull_requests.concat cursor.data
end

review_count_by_user = Hash.new(0)

pull_requests.each do |pr|
  next unless pr.labels.any? { |label| label.name == 'go' }

  pr.assignees.each do |user|
    review_count_by_user[user.login] += 1
  end
end

max_count = review_count_by_user.values.max.to_f

review_count_by_user.sort_by { |_,v| -v }.each do |user, reviews|
  review_bar = '#' * (reviews / max_count * 60)
  puts '%20s %4i %s' % [user, reviews, review_bar]
end
