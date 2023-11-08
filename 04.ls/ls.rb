Dir.foreach('.') do |i|
    next if i == '.' or i == '..'
    if i < 4
        print i.to_s.rjust(2) + "\n"
    else
        print i.to_s.rjust(2) + "   "
    end
end
