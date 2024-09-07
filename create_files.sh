#!/bin/bash

# Create the projects directory and its subdirectories
mkdir -p projects/facebook projects/google/oriserve projects/meta/oriserve projects/oracle

# Find the oriserve directories and create a file in each of them
find projects -type d -name oriserve -exec touch {}/test.txt \;
