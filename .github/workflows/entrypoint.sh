#!/bin/bash

output=$("/usr/local/bin/choctaw_hog" --since_commit "$1" --until_commit "$1" /toscan)
echo "::set-output name=jsonresult::$output"
