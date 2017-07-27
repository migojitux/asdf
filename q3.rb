#!/usr/bin/ruby

require_relative 'lib/parseStationMap.rb'

# parse the station map and assign it to a local variable
graph = parseStationMap

# this is the output section.  Users will have to manually call into the dijkstra algorithm here
# TODO: Write a pretty_formatter and also write a user interactive tool to allow them to select stations
#puts graph
#puts graph.dijkstra("Waterloo Jubilee Line")
#puts graph.neighbors("Waterloo Jubilee Line")
puts "Path and Distance from Goodge Street Northern Line to Lambeth North Bakerloo Line:"
puts graph.dijkstra("Goodge Street Northern Line", "Lambeth North Bakerloo Line")
