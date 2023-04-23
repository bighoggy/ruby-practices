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

  total_point += if frame[0] == 10
                   10 + frames[i + 1][0] + (frames[i + 1][1] != 0 ? frames[i + 1][1] : frames[i + 2]&.[](0) || 0)
                 elsif frame.sum == 10
                   10 + frames[i + 1][0]
                 else
                   frame.sum
                 end
end
puts total_point
