#!/usr/bin/ruby

require_relative 'lib/parseStationMap.rb'

graph = parseStationMap
#puts graph
#puts graph.dijkstra("Waterloo Jubilee Line")
#puts graph.neighbors("Waterloo Jubilee Line")
puts graph.dijkstra("Goodge Street Northern Line", "Lambeth North Bakerloo Line")
