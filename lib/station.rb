#!/usr/bin/env ruby

# Use a class for Station.  Its constructor lends itself to be used iteratively from an xml parser
# This is a quality enhancement because it proffers reusable code
class Station
  def initialize (crs, distance, x, y)
    @crs = crs
    @distance = distance
    @x = x
    @y = y
  end

  attr_accessor :crs
  attr_accessor :distance

  # Put a self-reporting function in the Station class to facilitate testing as well as output functionality
  def report
    puts "#{crs} at distance: #{distance}"
  end
end

# If this library file is run directly, print diagnostics to help ascertain that it is all working
# debug/diag output is helpful for newcomers or maintainers to learn how things are working
if __FILE__ == $0
  
  puts "## First station"
  station = Station.new("asdf", 9.23, 5.6, 7.6)
  station.report 
  
  stations = Array.new
  stations.push(station)
  stations.push(Station.new("fdsa", 12.2, 6.7, 8.9))
  stations.push(Station.new("fadsa", 6.2, 3.7, 5.9))
  stations.push(Station.new("fdfsa", 2.2, 1.7, 0.9))
  puts "## Stations in order received"
  stations.each { |a| a.report }
  
  sorted = stations.sort { |x,y| x.distance <=> y.distance }
  puts "## Stations in sorted order, new array"
  sorted.each { |a| a.report }
  
  
  stations.sort! { |x,y| x.distance <=> y.distance }
  puts "## Original station listing, sorted in situ"
  stations.each { |a| a.report }

  puts "## 3rd element in the now-sorted array of stations"
  stations[2].report
  
end

