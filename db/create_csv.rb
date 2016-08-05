#!/usr/local/bin/ruby

require 'json'

zip_code =[]

file = File.read('all_stolen.json')

data_hash = JSON.parse(file)



data_hash['bikes'].each do | bike |
  if !bike['stolen_location'].nil? && bike['stolen_location'].slice(-5..-1).to_i() > 999
  zip_code.push({ :stolen_location => bike['stolen_location'].slice(-5..-1).to_i()})
  end
end

File.open('json_zip', 'w') { | file | file.write(zip_code.to_json) }
