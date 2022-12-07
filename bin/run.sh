#!/bin/bash
#------------------------------------------------
# 运行 docker 服务
# bin/run.sh
#       [-d ${domain}]   设置 bitwarden 域名
#       [-p ${protocol}] 启动协议类型 http/https
#------------------------------------------------


DOMAIN="127.0.0.1"
PROTOCOL="http"

set -- `getopt d:p: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -d) DOMAIN="$2"
        shift ;;
    -p) PROTOCOL="$2"
        shift ;;
  esac
  shift
done

domain=${DOMAIN} protocol=${PROTOCOL} docker-compose up -d
