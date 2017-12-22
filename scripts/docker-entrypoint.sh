#!/usr/bin/env bash
echo
echo "Starting services ..."
echo

cd /tico
composer install
composer run-script build

service nginx start

# endless command to keep the container running
bash
