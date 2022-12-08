#!/bin/sh
#------------------------------------------------
# 启用防爆破
# bin/enable_fail2ban.sh "bitwarden-docker的安装目录"
#------------------------------------------------


INSTALL_DIR=$1
if [ -z "${INSTALL_DIR}" ] ; then
  INSTALL_DIR="/usr/local/bitwarden-docker"
fi

cp ${INSTALL_DIR}/fail2ban/jail.d/bitwarden.local /etc/fail2ban/jail.d/bitwarden.local
cp ${INSTALL_DIR}/fail2ban/filter.d/bitwarden.local /etc/fail2ban/filter.d/bitwarden.local

sed -i s@/var/log@${INSTALL_DIR}/logs@g /etc/fail2ban/jail.d/bitwarden.local

service fail2ban restart

