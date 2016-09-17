# CSV-to-HTML-Bash-Converter
Script to convert CSV file to valid HTML table object.
```
Required arguments:
	-i              Path to input file
	--input-file
Optional arguments:
	-o              Output file path (default: .html)
	--output-file

	-d              Delimiter (default: ,)
```

Usage example:
```
./csv-html.sh -i test.csv -d ";" -o out.html
```
