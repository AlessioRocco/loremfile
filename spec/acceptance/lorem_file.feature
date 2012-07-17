Feature:Downloading a file
	Scenario Outline:download a file
		When I go to "<file_path>"
		Then I should get a file named "<file_name>" and of "<ext>" type
		
		Examples:
			| file_path			| file_name		| ext |
			| /my_file.pdf	| myfile			| pdf |
			| /second.doc		| second			| doc |
			| /archive.zip	| archive			| zip |