#!/usr/bin/env bash
TICO_PATH=`pwd`

echo
echo Start TiCo docker container ...
echo "Project Path: " $TICO_PATH
echo

docker run -it -p 8080:80 --name tico -v ~/Documents/projects/rebel-l/tico/:/tico tico
