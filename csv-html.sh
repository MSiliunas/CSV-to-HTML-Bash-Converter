#! /bin/bash
# Marijus Siliunas PS 2 gr. 4 k. 1310490
# Steps:
# 1. Validate input file
# 2. Read first line and define column count
# 3. Prepare html
# 4. Create file with input filename
# 5. Exit

IFS=,
input_file=$1

echo "Converting $input_file to HTML..."
{
    read -r -a headers
    
    echo "<table><tr>"

    for header in "${headers[@]}"
    do
        echo "<th>$header</th>"
    done

    echo "</tr>"

    while read -r -a line; do
        echo "<tr>"
        for i in "${!line[@]}"; do
            echo "<td>${line[i]}</td>"
        done
        echo "</tr>"
    done

    echo "</table>"
} < $input_file >> "${input_file}.html"

exit
