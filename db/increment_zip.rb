#!/usr/local/bin/ruby



require 'json'

file = File.read('parsed_db')

data_hash = JSON.parse(file)

a=*(999..99999)
zipcode_hash = Hash[a.map {|x| [x, nil]}]
# puts h
b = ['NY', 'PA', 'DE', 'DC', 'MD', '', '']

states = Array[ ["AK", "Alaska"],
                ["AL", "Alabama"],
                ["AR", "Arkansas"],
                ["AS", "American Samoa"],
                ["AZ", "Arizona"],
                ["CA", "California"],
                ["CO", "Colorado"],
                ["CT", "Connecticut"],
                ["DC", "District of Columbia"],
                ["DE", "Delaware"],
                ["FL", "Florida"],
                ["GA", "Georgia"],
                ["GU", "Guam"],
                ["HI", "Hawaii"],
                ["IA", "Iowa"],
                ["ID", "Idaho"],
                ["IL", "Illinois"],
                ["IN", "Indiana"],
                ["KS", "Kansas"],
                ["KY", "Kentucky"],
                ["LA", "Louisiana"],
                ["MA", "Massachusetts"],
                ["MD", "Maryland"],
                ["ME", "Maine"],
                ["MI", "Michigan"],
                ["MN", "Minnesota"],
                ["MO", "Missouri"],
                ["MS", "Mississippi"],
                ["MT", "Montana"],
                ["NC", "North Carolina"],
                ["ND", "North Dakota"],
                ["NE", "Nebraska"],
                ["NH", "New Hampshire"],
                ["NJ", "New Jersey"],
                ["NM", "New Mexico"],
                ["NV", "Nevada"],
                ["NY", "New York"],
                ["OH", "Ohio"],
                ["OK", "Oklahoma"],
                ["OR", "Oregon"],
                ["PA", "Pennsylvania"],
                ["PR", "Puerto Rico"],
                ["RI", "Rhode Island"],
                ["SC", "South Carolina"],
                ["SD", "South Dakota"],
                ["TN", "Tennessee"],
                ["TX", "Texas"],
                ["UT", "Utah"],
                ["VA", "Virginia"],
                ["VI", "Virgin Islands"],
                ["VT", "Vermont"],
                ["WA", "Washington"],
                ["WI", "Wisconsin"],
                ["WV", "West Virginia"],
                ["WY", "Wyoming"] ]

state_hash = Hash[states.map {|x| [x[0], []]}]

puts state_hash

data_hash.each do |bike|
  zipcode_hash[bike['stolen_location']] += 1 if zipcode_hash[bike['stolen_location']] != nil
  zipcode_hash[bike['stolen_location']] = 1 if zipcode_hash[bike['stolen_location']] == nil
end

zipcode_hash.select!{|k,v| v != nil}

zipcode_hash.each do |key, value|
  if key.between?(10000,14999)
    state_hash['NY'].push({key => value})
  end
  if key.between?(15000,19699)
    state_hash['PA'].push({key => value})
  end
  if key.between?(19700,19999)
    state_hash['DE'].push({key => value})
  end
  if key.between?(20000,20599)
    state_hash['DC'].push({key => value})
  end
  if key.between?(20600,21999)
    state_hash['MD'].push({key => value})
  end
  if key.between?(22000,24699)
    state_hash['VA'].push({key => value})
  end
  if key.between?(24700,26899)
    state_hash['WV'].push({key => value})
  end
  if key.between?(27000,28999)
    state_hash['NC'].push({key => value})
  end
  if key.between?(29000,29999)
    state_hash['SC'].push({key => value})
  end
  if key.between?(32000,34999)
    state_hash['FL'].push({key => value})
  end
  if key.between?(35000,36999)
    state_hash['AL'].push({key => value})
  end
  if key.between?(37000,38599)
    state_hash['TN'].push({key => value})
  end
  if key.between?(38600,39799)
    state_hash['MS'].push({key => value})
  end
  if key.between?(40000,41899)
    state_hash['KY'].push({key => value})
  end
  if key.between?(43000,45999)
    state_hash['OH'].push({key => value})
  end
  if key.between?(46000,47999)
    state_hash['IN'].push({key => value})
  end
  if key.between?(48000,49999)
    state_hash['MI'].push({key => value})
  end
  if key.between?(50000,52999)
    state_hash['IA'].push({key => value})
  end
  if key.between?(53000,54999)
    state_hash['WI'].push({key => value})
  end
  if key.between?(55000,56799)
    state_hash['MN'].push({key => value})
  end
  if key.between?(57000,57799)
    state_hash['SD'].push({key => value})
  end
  if key.between?(58000,58899)
    state_hash['ND'].push({key => value})
  end
  if key.between?(59000,59999)
    state_hash['MT'].push({key => value})
  end
  if key.between?(60000,62999)
    state_hash['IL'].push({key => value})
  end
  if key.between?(63000,65899)
    state_hash['MO'].push({key => value})
  end
  if key.between?(66000,67999)
    state_hash['KS'].push({key => value})
  end
  if key.between?(68000,69399)
    state_hash['NE'].push({key => value})
  end
  if key.between?(70000,71499)
    state_hash['LA'].push({key => value})
  end
  if key.between?(71600,72999)
    state_hash['AR'].push({key => value})
  end
  if key.between?(73000,74999)
    state_hash['OK'].push({key => value})
  end
  if key.between?(80000,81699)
    state_hash['CO'].push({key => value})
  end
  if key.between?(82000,83199)
    state_hash['WY'].push({key => value})
  end
  if key.between?(83200,83899)
    state_hash['ID'].push({key => value})
  end
  if key.between?(84000,84799)
    state_hash['UT'].push({key => value})
  end
  if key.between?(85000,86599)
    state_hash['AZ'].push({key => value})
  end
  if key.between?(87000,88499)
    state_hash['NM'].push({key => value})
  end
  if key.between?(88900,89899)
    state_hash['NV'].push({key => value})
  end
  if key.between?(90000,96199)
    state_hash['CA'].push({key => value})
  end
  if key.between?(96700,96899)
    state_hash['HI'].push({key => value})
  end
  if key.between?(97000,97999)
    state_hash['OR'].push({key => value})
  end
  if key.between?(98000,99499)
    state_hash['WA'].push({key => value})
  end
  if key.between?(99500,99999)
    state_hash['AK'].push({key => value})
  end
  if key.between?(75000,79999) || key.between?(88500,88599)
    state_hash['TX'].push({key => value})
  end
  if key.between?(30000,31999) || key.between?(39800,39999)
    state_hash['GA'].push({key => value})
  end
end

state_hash

File.open('state_db', 'w') { | file | file.write(state_hash.to_json) }

# puts zipcode_hash.size



# NY = 10000-14999
# PA = 15000-19699
# DE = 19700-19999
# DC = 20000-20599
# MD = 20600-21999
# VA = 22000-24699
# WV = 24700-26899
# NC = 27000-28999
# SC = 29000-29999
# GA = 30000-31999 39800-39999
# FL = 32000-34999
# AL = 35000-36999
# TN = 37000-38599
# MS = 38600-39799
# KY = 40000-41899
# OH = 43000-45999
# IN = 46000=47999
# MI = 48000-49999
# IA = 50000-52999
# WI = 53000-54999
# MN = 55000-56799
# SD = 57000-57799
# ND = 58000-58899
# MT = 59000-59999
# IL = 60000-62999
# MO = 63000-65899
# KS = 66000_67999
# NE = 68000-69399
# LA = 70000-71499
# AR = 71600-72999
# OK = 73000-74999
# TX = 75000-79999 88500 - 88599
# CO = 80000-81699
# WY = 82000-83199
# ID = 83200-83899
# UT = 84000-84799
# AZ = 85000-86599
# NM = 87000-88499
# NV = 88900-89899
# CA = 90000-96199
# HI = 96700-96899
# OR = 97000-97999
# WA = 98000-99499
# AK = 99500-99999
