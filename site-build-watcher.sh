#!/bin/sh

SITE_NAME="disast.rs"


inotifywait -q -m -r -e modify,create html bin | while read DIRECTORY EVENT FILE; do
if [ ! -z "$(git check-ignore $DIRECTORY/$FILE)" ] ; then
    continue;
  fi
  echo "$DIRECTORY $EVENT $FILE"
  pushd html
    sh ../bin/build
    chmod 755 -R out
    rsync -avP --rsync-path 'sudo -u www rsync' out/ $SITE_NAME:/home/www/site
  popd
done
