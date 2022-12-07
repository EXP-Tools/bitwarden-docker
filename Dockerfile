FROM vaultwarden/server:latest

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean && \
    apt-get update -y && \
    apt-get upgrade -y

# 安装基础软件
RUN apt-get install -y curl wget vim zip unzip \
                        procps iputils-ping telnet net-tools netcat \
                        nginx fail2ban
RUN apt-get install -y python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN python -m pip install --upgrade pip


# 配置 nginx （反向代理）
ADD ./nginx/etc/bitwarden_http.conf /etc/nginx/sites-available/bitwarden_http.conf
ADD ./nginx/etc/bitwarden_https.conf /etc/nginx/sites-available/bitwarden_https.conf
RUN mkdir -p /etc/nginx/cert/


# 配置 fail2ban （防爆破）
RUN apt-get install -y fail2ban


WORKDIR /
RUN echo "alias ll='ls -alF'" >> /root/.bashrc
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
