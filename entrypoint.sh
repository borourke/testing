#!/bin/sh

SECRETS_BUCKET=$(curl --silent http://169.254.169.254/latest/user-data | grep -m1 "^export SECRETS_BUCKET" | cut -d= -f2)
if [ -z "$SECRETS_BUCKET" ]; then
  echo >&2 'error: unable to get SECRETS_BUCKET name from host'
  exit 1
fi

# Load the S3 secrets file contents into the environment variables
eval $(aws s3 cp s3://${SECRETS_BUCKET}/cf-data/testing/environment/environment.txt - | sed 's/^/export /')

if [ "$1" = "migrate" ]; then
  bundle exec bin/rails db:migrate
elif [ "$1" = "sidekiq" ]; then
  bundle exec sidekiq
else
  bundle exec unicorn -p 3000
fi
