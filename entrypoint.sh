#!/bin/sh

bower_cmd="cache info install list prune search update uninstall version"

for item in $bower_cmd
do
    if [ "$1" == "$item" ]; then
        bower "$@"
        exit
    fi
done

if [ "$1" != "" ]; then
  polymer "$@"
else
  polymer serve -H 0.0.0.0
fi
