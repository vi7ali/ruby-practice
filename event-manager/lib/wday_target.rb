require "csv"
require "date"

puts "Initializing"

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
wdays = {}

contents.each do |row|
  reg_date = row[:regdate]
  d = DateTime.strptime(reg_date, "%m/%d/%y %H:%M")
  if wdays[d.wday].nil?
    wdays[d.wday] = 1
  else
    wdays[d.wday] += 1
  end
end

wdays = wdays.sort_by{|k, v| -v}.to_h
wdays.each do |k, v|
  puts "#{Date::DAYNAMES[k]} >> #{v}"
end