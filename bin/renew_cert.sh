#!/bin/sh
#------------------------------------------------
# 刷新 HTTPS 证书
# bin/renew_cert.sh "bitwarden-docker的安装目录"
#------------------------------------------------


INSTALL_DIR=$1
if [ -z "${INSTALL_DIR}" ] ; then
  INSTALL_DIR="/usr/local/bitwarden-docker"
fi

/usr/bin/certbot renew
cat /etc/letsencrypt/live/*/fullchain.pem > ${INSTALL_DIR}/nginx/cert/fullchain.pem
cat /etc/letsencrypt/live/*/privkey.pem > ${INSTALL_DIR}/nginx/cert/privkey.pem
