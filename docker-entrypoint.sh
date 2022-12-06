#!/bin/bash


# CMD ["/start.sh"]
nohup /start.sh &

# 保持前台运行，避免 docker 挂起
while true ; do
    sleep 3600
done

exit 0
