# PowerShell
# ------------------------
# 构建镜像
# bin/build.ps1 
# ------------------------

$ENV:protocol="any"; `
$ENV:domain="any"; `
$ENV:register="any"; `
docker-compose build
