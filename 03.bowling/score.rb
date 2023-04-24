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

  strike = frame[0] == 10
  spare = frame.sum == 10

  next_frame = frames[i + 1]
  next_next_frame = frames[i + 2]

  if strike
    bonus_point = next_frame[0] + (if next_frame[1] != 0
                                     next_frame[1]
                                   else
                                     (next_next_frame ? next_next_frame[0] : 0)
                                   end)
    total_point += 10 + bonus_point
  elsif spare
    total_point += 10 + next_frame[0]
  else
    total_point += frame.sum
  end
end
puts total_point
