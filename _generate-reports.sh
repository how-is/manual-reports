#!/bin/bash

set -e

bundle install

for config in $(echo how-is-configs/*.yml); do
  bundle exec how_is --config how-is-configs/$config
  # TODO: Don't sleep on last iteration.
  sleep 60 # Sleep 1 minute to avoid ratelimit issues.
done
