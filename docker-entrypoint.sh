#!/bin/bash
# ----------------------

# 以 HTTP/HTTPS 协议启动 nginx
HTTP_CONF="/etc/nginx/sites-available/bitwarden_http.conf"
HTTPS_CONF="/etc/nginx/sites-available/bitwarden_https.conf"
BW_CONF="/etc/nginx/sites-available/default"
rm -f ${BW_CONF}
if [[ ${PROTOCOL} = "https" ]]; then
    rm -f ${HTTP_CONF}
    mv ${HTTPS_CONF} ${BW_CONF}
else
    rm -f ${HTTPS_CONF}
    mv ${HTTP_CONF} ${BW_CONF}
fi
sed -i "s/YOUR_DOMAIN/${DOMAIN}/g" ${BW_CONF}
nginx


# 启动防爆破
service fail2ban start


# 启动 bitwarden
/start.sh
