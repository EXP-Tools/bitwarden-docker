#!/bin/sh
#------------------------------------------------
# 刷新 HTTPS 证书
# bin/renew_cert.sh "bitwarden-docker的安装目录"
#------------------------------------------------


WORKDIR=$1
if [ -z "${WORKDIR}" ] ; then
  WORKDIR="/usr/local/bitwarden-docker"
fi

/usr/bin/certbot renew
cat /etc/letsencrypt/live/*/fullchain.pem > ${WORKDIR}/nginx/cert/fullchain.pem
cat /etc/letsencrypt/live/*/privkey.pem > ${WORKDIR}/nginx/cert/privkey.pem
