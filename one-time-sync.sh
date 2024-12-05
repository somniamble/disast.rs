#!/bin/sh

SITE_NAME="disast.rs"

pushd html
  sh ../bin/build
  chmod 755 -R out
  rsync -avP --rsync-path 'sudo -u www rsync' out/ $SITE_NAME:/home/www/site
popd
