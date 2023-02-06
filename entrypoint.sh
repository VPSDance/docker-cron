#!/bin/sh

# stop on error
set -ue 
# env for crontab
env >> /etc/environment

# execute CMD
echo "$@"
exec "$@"
