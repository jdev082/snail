#!/bin/bash
# snail shell builder
output=main.sh

if [ "$1" == 'init' ]; then
    touch snail.config.sh
    echo "
    # define the files that will be combined
    declare -a files=()

# set the output file
output="main.sh"" > snail.config.sh
exit
fi

if [ -f snail.config.sh ]; then
    source snail.config.sh
else
    if [ "$1" == '--config' ]; then
        if [ -f "$2" ]; then
            source "$2"
        else
            echo "$2" not found
            exit 1
        fi
    fi
    echo "snail.config.sh not found"
    exit 1
fi

if [ "$1" == '-o' ];
then
    output=$2
fi

if [ -f "$output" ]; then
	rm "$output"
fi

if [ -z "${files[0]}" ]; then
    echo "No files defined in snail.config.sh"
    exit 1
fi

if [ "$1" == 'build' ]; then
    for file in "${files[@]}"
    do
        # echo  '\n' >> "$output"
        cat "$file" >> "$output"
    done
fi
