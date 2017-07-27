#!/usr/bin/env ruby

require_relative 'roganartu_dijkstra'
require 'rexml/document'
include REXML

def parseStationMap(filename = "data/stationMap.xml")
  graph = Graph.new

  file = File.new(filename)
  doc = Document.new(file)
  root = doc.root

  # pass 1: Get all the station names into the graph
  root.each_element('//StationPairing') {
    |s| 
      graph.push s.elements["Station1"].text 
      graph.push s.elements["Station2"].text
  }

  # make the graph a unique list of station names
  graph.uniq!

  # pass 2: Link all the stations according to their weighted distance
  root.each_element('//StationPairing') {
    |s| graph.connect_mutually s.elements["Station1"].text, s.elements["Station2"].text, s.elements["TravelTime"].text.to_f
  }

  # return the resulting graph object
  graph
end
