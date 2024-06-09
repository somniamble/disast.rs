#! /bin/sh

# This is intended to be run on the local host. e.g.
# cat the-script.sh | ssh disast.rs

# 

SITE_NAME="disast.rs"

# q'n'd way of getting the first arg
if [ "$1" == "--setup" ]; then
  cat setup-remote.sh | ssh disast.rs
fi


# we don't always need to do this
# cat setup-remote.sh | ssh disast.rs

chmod 755 -R site
rsync -avP --rsync-path 'sudo -u www rsync' site $SITE_NAME:/home/www

if [ "$1" == "--nginx" ]; then
  # now nginx stuff
  rsync -avP --rsync-path 'sudo -u root rsync' nginx.conf $SITE_NAME:/etc/nginx/nginx.conf
  ssh $SITE_NAME <<EOF
sudo rc-service nginx -S start

if sudo nginx -t; then
  echo looks good, reloading nginx
  sudo rc-service nginx reload
fi
sudo rc-service nginx -S start
EOF
fi

# need to do some way of handling the after-cert setup
# holy shit nice:
# inotifywait -q -m -r -e modify,create site | while read DIRECTORY EVENT FILE; do sh static-site.sh; done
