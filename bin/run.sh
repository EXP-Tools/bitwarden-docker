#!/bin/bash
#------------------------------------------------
# 运行 docker 服务
# bin/run.sh
#       [-p ${protocol}] 启动协议类型 http/https
#------------------------------------------------

PROTOCOL="http"

set -- `getopt p: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -p) PROTOCOL="$2"
        shift ;;
  esac
  shift
done

protocol=${PROTOCOL} docker-compose up -d
