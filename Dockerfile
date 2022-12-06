FROM vaultwarden/server:latest
ARG domain="demo_domain.com"

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean && \
    apt-get update -y && \
    apt-get upgrade -y

# 安装基础软件
RUN apt-get install -y curl wget vim zip unzip \
                        procps iputils-ping telnet net-tools netcat \
                        nginx

RUN apt-get install -y python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN python -m pip install --upgrade pip


# 安装 fail2ban 防止被爆破
RUN apt-get install -y fail2ban


# 配置 nginx 反向代理
ADD ./nginx/etc/bitwarden_site.conf /etc/nginx/sites-available/default
RUN sed -i "s/YOUR_DOMAIN/${domain}/g" /etc/nginx/sites-available/default && \
    mkdir -p /etc/nginx/cert/


WORKDIR /
RUN echo "alias ll='ls -alF'" >> /root/.bashrc
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
