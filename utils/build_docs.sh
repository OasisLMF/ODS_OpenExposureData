#!/bin/bash

set -e

DIR_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ ! -d "$DIR_BASE/output/" ]]; then 
    mkdir $DIR_BASE/output/
fi  


# Build 
    make html
    make latexpdf 

# Create TAR
    tar -czvf oed_docs.tar.gz -C build/html/ .
    mv oed_docs.tar.gz $DIR_BASE/output/

# Copy PDF  
    mv build/latex/OED.pdf $DIR_BASE/output/    
