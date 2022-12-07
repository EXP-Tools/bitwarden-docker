# PowerShell
# ------------------------
# 构建镜像
# bin/build.ps1 
#       [-d ${domain}] 设置 bitwarden 域名
# ------------------------

param(
    [string]$d="127.0.0.1"
)

$DOMAIN = $d

$ENV:domain=${DOMAIN}; docker-compose build

Write-Host "finish ."