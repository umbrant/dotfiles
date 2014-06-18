#!/bin/bash

# Split the classpath by colons into an array
IFS=":"
TEMP_PATH=($CLASSPATH)
unset IFS

OUT_PATH=

for x in ${TEMP_PATH[@]}; do
    ADD=`find $x -noleaf -type f -printf "%p:"`
    OUT_PATH=${OUT_PATH}${ADD}
done

echo $OUT_PATH
