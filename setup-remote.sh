#! /bin/sh

# thanks!
# https://www.cyberciti.biz/faq/10-alpine-linux-apk-command-examples/#8

apk update

if id "www" >/dev/null 2>&1; then
  echo "certbox-nginx already installed"
else
  sudo adduser -D -g 'nginx www user' -h /home/www/ www
fi

[[ -z "$(apk -e info nginx)" ]] && sudo apk add nginx || echo nginx already installed
[[ -z "$(apk -e info certbot)" ]] && sudo apk add certbot || echo certbot already installed
[[ -z "$(apk -e info certbot-nginx)" ]] && sudo apk add certbot-nginx || echo certbot-nginx already installed
[[ -z "$(apk -e info rsync)" ]] && sudo apk add rsync || echo rsync already installed

sudo rc-service nginx -S start
