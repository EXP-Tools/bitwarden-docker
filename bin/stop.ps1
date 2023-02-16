# PowerShell
#------------------------------------------------
# 停止 docker 服务
# bin/stop.ps1
#------------------------------------------------

$ENV:protocol="any"; `
$ENV:domain="any"; `
$ENV:register="any"; `
docker-compose down