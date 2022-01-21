#!/bin/bash
jupyter notebook --ip=0.0.0.0 --port=$(cat /PORT) --NotebookApp.token='' --NotebookApp.password=''
cat /default |sed "s/THERANDOMPORT/$(cat /PORT)/g" >/etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
