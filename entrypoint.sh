#!/bin/sh

bower_cmd="cache info install list prune search update uninstall version"

for item in $bower_cmd
do
    if [ "$1" == "$item" ]; then
        bower "$@"
        exit
    fi
done

case "$1" in
  help)
    if [[ $# > 1 ]]; then
      shift
      polymer help "$@"
    else
      echo -e "\033[1m\033[4mAvailable bower commands :\033[0m"
      for item in $bower_cmd; do echo "  - ${item}"; done
      echo ""
      polymer help
    fi
    ;;
  serve)
    shift
    polymer serve -H 0.0.0.0 -p 8081 "$@"
    ;;
  *)
    polymer "$@"
    ;;
esac
