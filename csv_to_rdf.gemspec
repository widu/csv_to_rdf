
Gem::Specification.new do |s|
	s.name = 'csv_to_rdf'
	s.version = '0.0.0.1'
	s.date = '2016-04-29'
	s.summary = "Converts CSV data to RDF graph"
	s.description = "Converts CSV data to RDF graph"
	s.authors = ["WiDu"]
	s.email = 'wdulek@gmail.com'
	s.files = ["lib/csv_to_rdf.rb"]
	s.homepage = 'https://github.com/widu/csv_to_rdf'
	s.license = 'MIT'
	s.add_runtime_dependency "linkeddata"
	s.add_runtime_dependency "sparql"
	# s.add_runtime_dependency "csv"
end