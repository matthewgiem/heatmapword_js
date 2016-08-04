#!/usr/local/bin/ruby

require 'json'

file = File.read('parsed_db')

data_hash = JSON.parse(file)

zipcode_array = []

data_hash.each do |bike|
  if zipcode_array.include? bike.stolen_location.to_s.to_sym
      zipcode_array[bike.stolen_location.to_s.to_sym] += 1
  else
  zipcode_array.push({})
end
