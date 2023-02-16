#!/bin/bash
#------------------------------------------------
# 运行 docker 服务
# bin/run.sh
#       [-p ${protocol}] 启动协议类型 http/https
#       [-d ${domain}]   设置 bitwarden 域名
#       [-r true|false]  是否开放用户注册
#------------------------------------------------

PROTOCOL="http"
DOMAIN="127.0.0.1"
REGISTER="false"

set -- `getopt d:p:r: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -p) PROTOCOL="$2"
        shift ;;
    -d) DOMAIN="$2"
        shift ;;
    -r) REGISTER="$2"
        shift ;;
  esac
  shift
done

if [[ "x${REGISTER}" = "xtrue" ]]; then
  REGISTER="true"
else
  REGISTER="false"
fi

protocol=${PROTOCOL} \
domain=${DOMAIN} \
register=${REGISTER} \
docker-compose up -d
