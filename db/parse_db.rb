#!/usr/local/bin/ruby

require 'json'

new_bikes = []
no_zip = []

file = File.read('all_stolen.json')

data_hash = JSON.parse(file)
i = 0

bikes = []

# bikes.push(data_hash['bikes'][13381])
puts data_hash['bikes'][13382]
# bikes.push(data_hash['bikes'][13383])

# bikes.each do | bike |
#   if bike['stolen_location'].slice(-5..-1).to_i() > 100
#     new_bikes.push({ :stolen_location => bike['stolen_location'].slice(-5..-1).to_i(),
#                      :date_stolen => bike['date_stolen']})
#   else
#    no_zip.push({ stolen_location: bike['stolen_location'], date_stolen: bike['date_stolen']})
#   end
# end
#
# puts new_bikes
# puts "-------"
# puts no_zip
#

data_hash['bikes'].each do | bike |
  if !bike['stolen_location'].nil? && bike['stolen_location'].slice(-5..-1).to_i() > 999
  new_bikes.push({ :stolen_location => bike['stolen_location'].slice(-5..-1).to_i(),
    :date_stolen => bike['date_stolen']})
    puts i += 1
  else
    no_zip.push({ stolen_location: bike['stolen_location'], date_stolen: bike['date_stolen']})
    puts i += 1
  end
end

File.open('parsed_db', 'w') { | file | file.write(new_bikes.to_json) }
File.open('parsed_db_no_zip', 'w') { | file | file.write(no_zip.to_json) }
