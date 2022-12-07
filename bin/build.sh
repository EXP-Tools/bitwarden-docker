#!/bin/bash
# ------------------------
# 构建镜像
# bin/build.sh 
#       [-d ${domain}] 设置 bitwarden 域名
# ------------------------

DOMAIN="127.0.0.1"

set -- `getopt d: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -d) DOMAIN="$2"
        shift ;;
  esac
  shift
done

domain=${DOMAIN} docker-compose build

echo "finish ."