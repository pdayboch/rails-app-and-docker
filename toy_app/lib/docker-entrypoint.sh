#!/bin/sh

set -e
echo "removing pid if it exists"
if [ -f /opt/app/tmp/pids/server.pid ]; then
  rm /opt/app/tmp/pids/server.pid
fi

echo "checking creation or migration of db"
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

echo "finished entrypoint"
exec bundle exec "$@"
