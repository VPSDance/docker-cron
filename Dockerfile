# FROM alpine:3.5
FROM alpine:latest


ENV TZ=Asia/Chongqing

# dependencies
RUN apk update && apk add --no-cache \
  tzdata \
  bash \
  sed \
  openssh-client \ # scp/sftp
  git \
  python3 py3-pip \
  curl

RUN echo "*       *       *       *       *       run-parts /etc/periodic/1min" >> /etc/crontabs/root
RUN echo "StrictHostKeyChecking no" >>/etc/ssh/ssh_config
RUN echo "UserKnownHostsFile /dev/null" >>/etc/ssh/ssh_config

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# crond -f -d 8
CMD ["crond" "-f", "-d", "8"]
