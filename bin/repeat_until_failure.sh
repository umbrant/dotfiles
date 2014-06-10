#!/bin/bash

test $# -lt 1 && echo "Usage `basename $0` testSpec" && exit 1

killall burnP6 > /dev/null 2>&1
for x in {1..4}; do
    burnP6 &
done

count=1

OUTFILE=/tmp/flakytest
OUTDIR=/tmp/flakytest.out

while true; do
    echo "Doing run $count..."
    count=$((${count}+1))
    # Run the test
    mvn test -Dtest=$1 > $OUTFILE 2>&1
    greptest=`egrep "Failures: [1-9][0-9]*" $OUTFILE`
    # Found a failure
    if [ -n "$greptest" ]; then
        echo "Test failed!"
        mkdir -p $OUTDIR
        cp target/surefire-reports/*-output.txt $OUTDIR
        killall burnP6 > /dev/null 2>&1
        exit
    fi
done

killall burnP6 > /dev/null 2>&1
