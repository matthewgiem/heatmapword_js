#!/usr/local/bin/ruby

require 'json'

new_bikes = []
no_zip = []

file = File.read('database')

data_hash = JSON.parse(file)

data_hash['bikes'].each do | bike |
  if bike['stolen_location'].slice(-5..-1).to_i() > 0
  new_bikes.push({ :stolen_location => bike['stolen_location'].slice(-5..-1).to_i(),
                   :date_stolen => bike['date_stolen']})
  else
    no_zip.push({ stolen_location: bike['stolen_location'], date_stolen: bike['date_stolen']})
  end
end

File.open('parsed_db', 'w') { | file | file.write(new_bikes.to_json) }
File.open('parsed_db_no_zip', 'w') { | file | file.write(no_zip.to_json) }
