#!/bin/sh

set -e

HOST=0.0.0.0
PORT=3000

PID="tmp/pids/server.pid"
if [ -f $PID ]; then
  rm $PID
fi

echo "-Installing the bundle (this may take a little while if the volume is empty):"
bundle config set force_ruby_platform true
bundle install

echo "- Configuring databases:"
bundle exec rake db:prepare

echo "- Installing node packages with yarn:"
yarn install

./bin/rails s -b $HOST -p $PORT