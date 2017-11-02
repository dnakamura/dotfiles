#!/bin/sh
TERMINFO_DIR=$(dirname $(readlink -f -n $0))
find $TERMINFO_DIR -type f \! -name install.sh -exec tic {} \;

