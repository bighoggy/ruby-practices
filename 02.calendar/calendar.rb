require 'date'
require 'optparse'

params = OptionParser.new
params = ARGV.getopts("", "y:#{Date.today.year}", "m:#{Date.today.month}")

month = params["m"].to_i
year = params["y"].to_i

first_wday = Date.new(year, month, 1).wday
end_date = Date.new(year, month, -1).day

puts " #{month} 月 #{year} 年".center(21) 
puts '日 月 火 水 木 金 土'
space = "   " * first_wday
print space

(1..end_date).each do |x|
  if (first_wday + x) % 7 == 0
    print x.to_s.rjust(2) + "\n"
  else
    print x.to_s.rjust(2) + " "
  end
end
print "\n"
