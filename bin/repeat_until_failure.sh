#!/bin/bash

test $# -lt 2 && echo "Usage `basename $0` repo testSpec" && exit 1

killall burnP6 > /dev/null 2>&1
for x in {1..4}; do
    burnP6 &
done

pushd $1/hadoop-hdfs-project/hadoop-hdfs/

count=1

while true; do
    echo "Doing run $count..."
    count=$((${count}+1))
    # Run the test
    mvn test -Dtest=$2 > ~/flakytest 2>&1
    greptest=`egrep "Failures: [1-9][0-9]*" ~/flakytest`
    # Found a failure
    if [ -n "$greptest" ]; then
        echo "Test failed!"
        mkdir -p ~/flakytest.out
        cp target/surefire-reports/*-output.txt ~/flakytest.out
        killall burnP6 > /dev/null 2>&1
        exit
    fi
done

killall burnP6 > /dev/null 2>&1

popd
