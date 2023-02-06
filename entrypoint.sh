#!/bin/sh

echo $(date)

# execute CMD
echo "$@"
exec "$@"