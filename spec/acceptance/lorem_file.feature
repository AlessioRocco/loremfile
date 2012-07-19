Feature:Downloading a file
	Scenario Outline:download a file
		When I go to "<file_path>"
		Then I should get a file named "<file_name>" and of "<ext>" mime-type
		
		Examples:
			| file_path			| file_name		| ext          |
			| /myfile.pdf	  | myfile.pdf	| pdf          |
			| /second.doc		| second.doc	| octet-stream |
			| /archive.zip	| archive.zip	| zip          |