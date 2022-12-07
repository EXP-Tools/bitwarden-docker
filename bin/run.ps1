# PowerShell
#------------------------------------------------
# 运行 docker 服务
# bin/run.ps1
#       [-p ${protocol}] 启动协议类型 http/https
#------------------------------------------------

param(
    [string]$p="http"
)

$PROTOCOL = $p

$ENV:protocol=${PROTOCOL}; docker-compose up -d
