#!/bin/bash

export server_name=${1:-local.firebaseio.com}
export firestore_port=8080

envsubst '$server_name $firestore_port' \
    < /etc/nginx/nginx.conf.template \
    > /etc/nginx/nginx.conf

echo "copying files from permanent volume"
if [ -f /data/firestore.indexes.json ]; then
  cp /data/firestore.indexes.json /app
  cp /data/firestore.rules /app
else
  echo "firebase --project <project-id> init firestore"
  exit 1
fi

( nginx ) &
nginx_pid=$!

firebase emulators:start &
firebase_pid=$!

:stop() {
  echo ":: stopping"
  if [ -f /app/firestore.indexes.json ]; then
    cp /app/firestore.indexes.json /data
    cp /app/firestore.rules /data
  fi
}

trap :stop INT TERM

wait $firebase_pid $nginx_pid
