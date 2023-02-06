# FROM alpine:3.5
FROM alpine:latest


ENV TZ=Asia/Shanghai

# dependencies
RUN apk update && apk add --no-cache \
  tzdata \
  bash \
  sed \
  # scp/sftp
  openssh-client \
  git \
  python3 py3-pip \
  curl \
  tini

RUN echo "*       *       *       *       *       run-parts /etc/periodic/1min" >> /etc/crontabs/root
RUN echo "StrictHostKeyChecking no" >>/etc/ssh/ssh_config
RUN echo "UserKnownHostsFile /dev/null" >>/etc/ssh/ssh_config

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]

# crond -f -d 8 # log to STDOUT
# crond -f -d 8 -L /var/log/cron.log # log to file
CMD crond -f -d 8
