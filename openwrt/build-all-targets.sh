#!/bin/bash

# License (MIT): https://github.com/GlynnKershaw/my-scripts/blob/master/LICENSE

# sed strips '*', the character that denotes the active enviroment, as well as colour codes
enviroments_list=$(scripts/env list | sed 's/\*//g' | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g")

# Specify number of cores to use. n+1 to use all cores
CORES=7
BIN_DIR=$(pwd "/bin/targets")

printf '%s\n' "Fetching prerequisites..."
make download

while read -r enviroment; do
    scripts/env switch $enviroment
    printf '%s\n' "Building binaries for $enviroment..."
    make -j $CORES
    printf '%s\n' "Finished building binaries for $enviroment"
done <<< "$enviroments_list"

printf '%s\n' "Binaries located in $BIN_DIR"
