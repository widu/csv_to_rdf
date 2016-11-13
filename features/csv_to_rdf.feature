Feature: I want to convert csv file to rdf file

  Scenario: Default options
    Given the csv: "./csv_test_files/test_csv1.csv"	
    When the csv_to_rdf is run
    Then the output graph should contain "raw1-1"
    And the output graph should contain "raw1-2"
    And the output graph should contain "raw2-2"
    And the output graph should contain "raw3-3"


  Scenario: Nul columns in csv file
    Given the csv: "./csv_test_files/test_csv2.csv"	
    When the csv_to_rdf is run
    Then the output graph should contain "raw1-1"
    And the output graph should contain "raw1-2"
    And the output graph should contain "raw2-3"
    And the output graph should contain "raw3-3"