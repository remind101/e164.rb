#!/usr/bin/env ruby
# frozen_string_literal: true

load 'lib/e164/lookuptable.rb'


current_lookup_table = E164::LookupTable

# get the master version of lookuptable.rb so we can compare against it.
system('git show master:lib/e164/lookuptable.rb > testlookup.rb')

# here we override the E164 modules lookup table
load('testlookup.rb')

current_lookup_table.each do |code, country | 
  if E164::LookupTable.include?(code) == false then
    puts "new area code #{code} with country info #{country}"
  end
end
