#! /bin/sh
inotifywait -q -m -r -e modify,create site | while read DIRECTORY EVENT FILE; do
  sh static-site.sh
done
