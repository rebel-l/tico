#!/usr/bin/env bash

echo
echo "Build application ..."
echo

# Prepare
OLDPATH=`pwd`
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
BASEDIR=$SCRIPTPATH/../
cd $BASEDIR

echo "Basepath: `pwd`"
echo

# Do the build


# Finish
echo
echo "Build done!"
echo

cd $OLDPATH
