#!/usr/bin/env ruby

require_relative 'station'
require 'rexml/document'
include REXML

# Parse any response file given as argument, but default to the one given with the exercise
# (Default args are a great way to make a method more robust)
def parseResponse(filename = "data/AB356.xml")
  file = File.new(filename)
  doc = Document.new(file)
  root = doc.root
  
  stations = Array.new
  
  # Use the nice constructor of the Station class, for each record found
  root.each_element('//PostcodeStationWithCoord') {
    |s| stations.push(
      Station.new(
        s.elements["Crs"].text, 
        s.elements["Distance"].text, 
        s.elements["Coordinate"].attributes["X"], 
        s.elements["Coordinate"].attributes["Y"]
      )
    )
  }

  # return the stations array to the caller
  stations
end

# If this library module is run directly, give some meaningful diagnostic output to illustrate usage
if __FILE__ == $0
  stations = parseResponse("../data/AB356.xml")
  puts "## Stations in the order they were received"
  stations.each { |a| a.report }
  sorted = stations.sort { |x,y| x.distance.to_i <=> y.distance.to_i }
  puts "## Stations, sorted by distance:"
  sorted.each { |a| a.report }
end

