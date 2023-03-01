# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []

scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

total_point = 0
index = 0

frames.each_with_index do |frame, i|
  if [10, 11].include?(i)
    index += 2
  elsif i == 9
    total_point += if shots[index] == 10
                     if shots[index + 2] == 10
                       20 + shots[index + 4]
                     else
                       10 + shots[index + 2] + shots[index + 3]
                     end
                   elsif shots[index] + shots[index + 1] == 10
                     10 + shots[index + 2]
                   else
                     shots[index] + shots[index + 1]
                   end
  elsif frame[0] == 10
    total_point += if shots[index + 2] == 10
                     10 + shots[index + 2] + shots[index + 4]
                   else
                     10 + shots[index + 2] + shots[index + 3]
                   end
    index += 2
  elsif shots[index] + shots[index + 1] == 10
    total_point += if shots[index + 2].nil?
                     10
                   else
                     10 + shots[index + 2]
                   end
    index += 2
  else
    total_point += shots[index] + shots[index + 1]
    index += 2
  end
end

puts total_point
