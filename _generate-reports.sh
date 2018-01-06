#!/bin/bash

set -e

bundle install

if [ -n "$1" ]; then
  echo "Usage: $0 END_DATE"
  echo "Where the END_DATE is the last day the report covers, in the form YYYY-mm-dd."
  exit 1
fi

for config in $(echo how-is-configs/*.yml); do
  echo "Starting: $config for $1"
  bundle exec how_is $1 --config $config
  echo "Ending:   $config for $1"
  # TODO: Don't sleep on last iteration.
  sleep 60 # Sleep 1 minute to avoid ratelimit issues.
done
