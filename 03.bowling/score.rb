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

frames = shots.each_slice(2).to_a

total_point = 0

frames.each_with_index do |frame, i|
  break if i == 10

  next_frame = frames[i + 1]
  next_next_frame = frames[i + 2]

  strike = frame[0] == 10
  spare = frame.sum == 10
  total_point += frame.sum

  if strike && next_frame[0] == 10
    total_point += next_frame[0] + next_frame[1] + next_next_frame[0]
  elsif strike
    total_point += next_frame[0] + next_frame[1]
  elsif spare
    total_point += next_frame[0]
  end
end
puts total_point
