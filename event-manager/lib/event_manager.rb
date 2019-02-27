require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone_numbers(phone_number)
  phone = phone_number.to_s.tr('^[0-9]', '')
  phone = phone[1..-1] if phone[0] == '1'
  if phone.length == 10
    "#{phone[0..2]}-#{phone[3..5]}-#{phone[6..9]}"
  else
    "Bad Phone"
  end
end

def legislator_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  
  begin
    civic_info.representative_info_by_address(
                              address: zipcode,
                              levels: 'country',
                              roles: ['legislatorUpperBody', 'legislatorLowerBody']
                              ).officials
  rescue
    "Bla Bla!!!!"
  end
end

def save_letter(id, form_letter)
  Dir.mkdir("output") unless Dir.exist?("output")

  filename = "output/#{id}_thanks.html"

  File.open(filename, "w") do |file|
    file.puts(form_letter)
  end
end

puts "EventManager Initialized"

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
template_letter = File.read("form_letter.erb")
erb_letter = ERB.new(template_letter)

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])  
  phone_number = clean_phone_numbers(row[:homephone])

  legislators = legislator_by_zipcode(zipcode)
  form_letter = erb_letter.result(binding)  
  save_letter(id, form_letter)
end