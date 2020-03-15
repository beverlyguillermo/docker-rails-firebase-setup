#!/bin/sh
set -e

bundle check || bundle install || bin/rake yarn:install

exec "$@"
