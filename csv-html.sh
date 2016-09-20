#! /usr/bin/env bash
# Marijus Siliunas PS 2 gr. 4 k. 1310490

set -o errexit	# Exit if any command fails

function help {
    echo -e "Convert CSV file to valid HTML table.\n"
    echo "Required arguments:"
    echo "	-i              Path to input file"
    echo "	--input-file"
    echo "Optional arguments:"
    echo "	-o              Output file path (default: $input_filename.html)"
    echo -e "	--output-file\n"
    echo "	-d              Delimiter (default: ,)"
    echo "	--delimiter"
}

# Handle passed arguments
while [[ $# -gt 1 ]]; do
    key="$1"
    case $key in
        -i|--input-file)
        input_file="$2"
        shift
        ;;
        -d|--delimiter)
        delimiter="$2"
        shift
        ;;
        -o|--output-file)
        output_file="$2"
        shift
        ;;
        *)	# Invalid argument passed
        help
        exit
        ;;
    esac
    shift
done

if [ -z "${input_file}" ]; then
    echo "ERROR! Input file not set."
    help
    exit
fi

if [ ! -f "${input_file}" ]; then
    echo "ERROR! Given file does not exist!"
    help
    exit
fi

output=${output_file:-"${input_file}.html"}
IFS=${delimiter:-,}

echo "Converting ${input_file} to HTML..."
{
    read -r -a headers

    echo "<table><tr>"

    for header in "${headers[@]}"
    do
        echo "<th>${header}</th>"
    done

    echo "</tr>"

    while IFS=${delimiter:-,} read -r -a line; do
        echo "<tr>"
        for i in "${!line[@]}"; do
            echo "<td>${line[i]}</td>"
        done
        echo "</tr>"
    done

    echo "</table>"
} < $input_file >> $output

echo "Finished! Output saved to ${output}."

exit
