#!/bin/bash
# ----------------------


# 以 HTTP/HTTPS 协议启动 nginx
if [[ ${PROTOCOL} = "https" ]]; then
    rm -f /etc/nginx/sites-available/bitwarden_http.conf
    mv /etc/nginx/sites-available/bitwarden_https.conf /etc/nginx/sites-available/default
else
    rm -f /etc/nginx/sites-available/bitwarden_https.conf
    mv /etc/nginx/sites-available/bitwarden_http.conf /etc/nginx/sites-available/default
fi
nginx


# 启动 bitwarden
/start.sh
