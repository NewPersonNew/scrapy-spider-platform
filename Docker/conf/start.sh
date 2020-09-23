#! /bin/bash
set -x

# 保存环境变量，开启crontab服务
env >> /etc/default/locale
/etc/init.d/cron restart


nohup scrapyd >/scrapyd/scrapyd.log 2>&1 &
nohup logparser -dir /scrapyd/logs >/scrapyd/logparser.log 2>&1
