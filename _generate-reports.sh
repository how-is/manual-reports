#!/bin/bash

set -e

bundle install

for config in $(ls how-is-configs); do
  bundle exec how_is --config how-is-configs/$config
  sleep 60 # Sleep 1 minute to avoid ratelimit issues.
done
