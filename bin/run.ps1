# PowerShell
#------------------------------------------------
# ���� docker ����
# bin/run.ps1
#       [-d ${domain}]   ���� bitwarden ����
#       [-p ${protocol}] ����Э������ http/https
#------------------------------------------------

param(
    [string]$d="127.0.0.1", 
    [string]$p="http"
)

$DOMAIN = $d
$PROTOCOL = $p

$ENV:domain=${DOMAIN}; $ENV:protocol=${PROTOCOL}; docker-compose up -d
