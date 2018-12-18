require 'json'
require 'time'

json = JSON.parse(File.read('/Users/paul/notes/aoc-leaderboard.json'))
days_so_far = Time.now.day
template = ['%20s', *' %7s'*(days_so_far*2)].join

puts template % ['', *[*1..days_so_far].product(['a', 'b']).map(&:join)]

json['members'].each do |_, member_json|
  name = member_json['name']

  scores = (1..days_so_far).map do |day|
    start_of_day = Time.new(2018, 12, day, 0, 0, 0, '-05:00').to_i

    ts = ('1'..'2').map do |star|
      member_json.dig('completion_day_level', day.to_s, star, 'get_star_ts')&.to_i
    end

    s1 = ts[0] && ts[0] - start_of_day
    s2 = ts[1] && ts[1] - ts[0]

    [s1, s2].map { |s| s ? '%3i:%02i' % [s / 60, s % 60] : '' }
  end

  puts template % [name, *scores.flatten]
end
