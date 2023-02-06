# docker-cron
Run a cron jobs inside docker container

### Usage

#### With docker run

```sh
# docker pull vpsdance/cron
# docker run -it --rm vpsdance/cron sh -c 'date'
docker run -d -it --rm --name cron -e TZ=Asia/Shanghai -v $(pwd)/examples/1min:/etc/periodic/1min vpsdance/cron
# print logs
docker logs cron -f
# stop container
docker stop cron
```

#### With docker-compose

```yaml
# docker-compose.yml
version: '3'

services:
  cron:
    image: vpsdance/cron
    environment:
      - TZ=Asia/Shanghai
    volumes:
      - ./cron_tasks/1min:/etc/periodic/1min
      - ./cron_tasks/15min:/etc/periodic/15min
      - ./cron_tasks/hourly:/etc/periodic/hourly
      - ./cron_tasks/daily:/etc/periodic/daily
      - ./cron_tasks/weekly:/etc/periodic/weekly
      - ./cron_tasks/monthly:/etc/periodic/monthly
```
- `docker-compose up -d --force-recreate` start
- `docker logs cron -f` print logs
- `docker-compose stop` stop
- For custom cron schedule, please refer to the [examples](./examples) folder.

### FAQs
- Cron job format
```sh
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * <command to execute>
```
- Print cron jobs
```sh
crontab -l
cat /etc/crontabs/root
ls /etc/periodic
```
