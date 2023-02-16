# PowerShell
#------------------------------------------------
# 运行 docker 服务
# bin/run.ps1
#       [-p ${protocol}] 启动协议类型 http/https
#       [-d ${domain}]   设置 bitwarden 域名
#       [-r true|false]  是否开放用户注册
#------------------------------------------------

param(
    [string]$p="http", 
    [string]$d="127.0.0.1",
    [string]$r="false"
)

$PROTOCOL = $p
$DOMAIN = $d

$REGISTER = "false"
if ("x${r}" -eq "xtrue") {
    $REGISTER = "true"
}

$ENV:protocol=${PROTOCOL}; `
$ENV:domain=${DOMAIN}; `
$ENV:register=${REGISTER}; `
docker-compose up -d
