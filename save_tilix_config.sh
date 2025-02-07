#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
dconf dump /com/gexperts/Tilix/ > $DIR/tilix.dconf
