require 'csv'
# Require 'linkeddata' gem
require 'linkeddata'


class CsvToRdf

##
	# Build graph object from csv file
	#  @param  [String]                 csv                
	#  @param  [Hash{Symbol => Object}] csv_options    	- default = { :col_sep => ';', :headers => true}
	#  @option csv_options [String]     :col_sep        - default = ';'
	#  @option csv_options [Boolean]    :headers        - default = true
    #  @return [RDF::Graph] - RDF graph contain information from csv file
    #

def csv_to_rdf(csv, csv_options = nil)
	#{ :col_sep => ';', :headers => true}
	csv_options ||= { :col_sep => ';', :headers => true}
	graph = RDF::Graph.new
	wd = RDF::Vocabulary.new("http://vieslav.pl/csv/0.1/")
	table = RDF::Node.new
	graph <<  [table, RDF.type, wd['table']]
	/.+\/(.+\.csv)$/.match(csv)
	#puts $1, "xxx"
	graph <<  [table, RDF::RDFS.label, $1]
	CSV.foreach(csv, csv_options ) do |row|
		puts row.inspect
		
		bnode = RDF::Node.new
		graph <<  [table, RDF::RDFS.member, bnode]
 	 	# graph <<  [bnode, RDF::RDFS.label, row['header1']]
 	 	graph <<  [bnode, RDF.type, wd.row]

 	 	row.each() do |header, value|
 	 		
			if value != nil then 
				graph <<  [bnode, wd[header.strip], value]
            end
		end
	end
graph
end

end