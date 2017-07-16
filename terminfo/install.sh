#!/bin/sh
TERMINFO_DIR=$(dirname $(realpath $0))
find $TERMINFO_DIR -type f \! -name install.sh -exec tic {} \;

