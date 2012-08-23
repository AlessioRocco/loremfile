Feature: Downloading a file
	Scenario Outline: Give me a file
		When I go to "<path>"
		Then I should get a file named "<file_name>" and of "<ext>" mime-type of size "<size>"
		
		Examples:
		 | path             | file_name  | ext | size |
		 | /myfile.pdf      | myfile.pdf | pdf | 617  |
		 | /myfile.pdf/1000 | myfile.pdf | pdf | 1000 |
