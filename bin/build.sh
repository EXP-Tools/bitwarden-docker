#!/bin/bash
# ------------------------
# 构建镜像
# bin/build.sh 
#       [-d ${domain}] 设置 bitwarden 域名
# ------------------------

DOMAIN="demo_domain.com"

set -- `getopt p:d: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -p) PASSWORD="$2"
        shift ;;
    -d) DOMAIN="$2"
        shift ;;
  esac
  shift
done

domain=${DOMAIN} docker-compose up -d

echo "finish ."