#!/bin/sh

# 30min
echo "*/30    *       *       *       *       run-parts /etc/periodic/30min" >> /etc/crontabs/root
# 10min
# echo "*/10    *       *       *       *       run-parts /etc/periodic/10min" >> /etc/crontabs/root

# crontab -l
