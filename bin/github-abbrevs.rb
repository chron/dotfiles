require 'bundler/inline'
require 'json'

gemfile do
  source 'https://rubygems.org'

  gem 'octokit'
end

token = ENV['GITHUB_ACCESS_TOKEN']

raise 'set GITHUB_ACCESS_TOKEN' unless GITHUB_ACCESS_TOKEN

api = Octokit::Client.new(access_token: token)
api.auto_paginate = true

github_users = api.org_members('optimalworkshop').map do |member|
  user = api.user(member.id)
  [user.login.downcase, user.name&.downcase]
end

def shortest_unique_substring(s, other_strings)
  1.upto(s.length) do |len|
    abbrev = s.chars.each_cons(len).map(&:join).find do |candidate|
      other_strings.grep(/#{candidate}/).none?
    end

    return abbrev if abbrev
  end

  nil
end

github_users.each do |user|
  other_users = github_users.reject { |u| user == u }.flatten.compact

  abbrev = user.reduce(user.first) do |shortest_so_far, id|
    current = id ? shortest_unique_substring(id, other_users) : nil

    [shortest_so_far, current].compact.min_by(&:length)
  end

  puts '%18s %15s => %-10s' % [*user, abbrev]
end
