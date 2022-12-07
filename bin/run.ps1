# PowerShell
#------------------------------------------------
# 运行 docker 服务
# bin/run.ps1
#       [-d ${domain}]   设置 bitwarden 域名
#       [-p ${protocol}] 启动协议类型 http/https
#------------------------------------------------

param(
    [string]$d="127.0.0.1", 
    [string]$p="http"
)

$DOMAIN = $d
$PROTOCOL = $p

$ENV:domain=${DOMAIN}; $ENV:protocol=${PROTOCOL}; docker-compose up -d
