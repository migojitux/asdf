#!/usr/bin/env ruby

# use the parseResponse library to fetch the list of stations
require_relative 'lib/parseResponse'
stations = parseResponse

# sort the station list (note: original ordering will not be preserved)
stations.sort! { |x,y| x.distance.to_i <=> y.distance.to_i } 

# report on the third element
puts "The third closest station:"
stations[2].report
