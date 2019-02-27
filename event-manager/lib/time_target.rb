require "csv"
require "date"

puts "Initializing"

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
hours = {}

contents.each do |row|
  reg_date = row[:regdate]
  d = DateTime.strptime(reg_date, "%m/%d/%y %H:%M")
  if hours[d.hour].nil?
    hours[d.hour] = 1
  else
    hours[d.hour] += 1
  end
end

hours = hours.sort_by{|k, v| -v}.to_h
puts hours