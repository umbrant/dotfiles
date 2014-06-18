#!/bin/bash

set -e

IN="/home/andrew/cdh5-backport-jiras.txt"
OUT="jiradates"

echo -n > $OUT

for jira in `cat ${IN}`; do
    echo $jira
    MYDATE=`git log --grep=${jira} | egrep "^Date:" | cut -d " " -f 4-8 | tail -1`
    echo $MYDATE
    date --rfc-3339=seconds --date="${MYDATE}" >> $OUT
done

paste -d, $IN $OUT > jiras_and_dates.txt
