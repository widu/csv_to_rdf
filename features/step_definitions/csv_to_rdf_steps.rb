load './lib/csv_to_rdf.rb'
require 'rdf_to_graphviz'

Given(/^the csv: "([^"]*)"$/) do |arg1|
	@csv = arg1
end

When(/^the csv_to_rdf is run$/) do
  conwerter = CsvToRdf.new
  @graph = conwerter.csv_to_rdf(@csv)
  puts @graph.to_ttl
  konwerter = RdfToGraphviz.new
  @output = konwerter.save_rdf_graph_as(@graph)
end

Then(/^the output graph should contain "([^"]*)"$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  # puts @output.to_ttl
  expect(@graph.to_ttl).to include(arg1)
  
end