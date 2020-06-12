#!/bin/bash
for file in `git ls-files -- './*' ':!*.txt'`
do
    HASH=`git rev-list HEAD -- $file | tail -n 1`
    DATE=`git show -s --format="%ci" $HASH --`
    DATE_array=($DATE)
    file_array=(${file//./ })
    #printf "%-35s %s\n  %s\n" $file $HASH: "$DATE"
    printf "%-35s\t%s\t%s\n" $file "${DATE_array[0]}" "${file_array[1]}"
done
