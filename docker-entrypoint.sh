#!/bin/bash
# ----------------------

# 以 HTTP/HTTPS 协议启动 nginx
HTTP_CONF="/etc/nginx/sites-available/bitwarden_http.conf"
HTTPS_CONF="/etc/nginx/sites-available/bitwarden_https.conf"
BW_CONF="/etc/nginx/sites-available/default"
rm -f ${BW_CONF}
if [[ ${PROTOCOL} = "https" ]]; then
    mv ${HTTPS_CONF} ${BW_CONF}
    rm -f ${HTTP_CONF}
else
    mv ${HTTP_CONF} ${BW_CONF}
    rm -f ${HTTPS_CONF}
fi
sed -i "s/YOUR_DOMAIN/${NGINX_DOMAIN}/g" ${BW_CONF}
nginx


# 启动防爆破
# 不能在 docker 里启动，fail2ban 只能部署在宿主机
# 不然封禁的永远是 docker 的网关 IP
# service fail2ban start


# 启动 bitwarden
/start.sh
