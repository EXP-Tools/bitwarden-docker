#!/bin/sh
#------------------------------------------------
# 启用防爆破
# bin/enable_fail2ban.sh "bitwarden-docker的安装目录"
#------------------------------------------------


INSTALL_DIR=$1
if [ -z "${INSTALL_DIR}" ] ; then
  INSTALL_DIR="/usr/local/bitwarden-docker"
fi

sed -i s@/usr/local/bitwarden-docker@${INSTALL_DIR}@g ${INSTALL_DIR}/fail2ban/jail.d/bitwarden.local

cp ${INSTALL_DIR}/fail2ban/jail.d/bitwarden.local /etc/fail2ban/jail.d/bitwarden.local
cp ${INSTALL_DIR}/fail2ban/filter.d/bitwarden.local /etc/fail2ban/filter.d/bitwarden.local
service fail2ban restart

