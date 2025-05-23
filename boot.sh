#!/bin/bash

# Retry DB migrations (optional, remove if unused)
while true; do
    flask db upgrade
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo "Deploy command failed, retrying in 5 secs..."
    sleep 5
done

# Gunicorn using app factory pattern
exec gunicorn -b :5000 --access-logfile - --error-logfile - "microblog:create_app()"
