# PowerShell
# ------------------------
# 构建镜像
# bin/build.ps1 
#       [-d ${domain}] 设置 bitwarden 域名
# ------------------------

param(
    [string]$d="demo_domain.com"
)

$DOMAIN = $d

$ENV:domain=${DOMAIN}; docker-compose build

Write-Host "finish ."