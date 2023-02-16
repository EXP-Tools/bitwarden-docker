# PowerShell
#------------------------------------------------
# ���� docker ����
# bin/run.ps1
#       [-p ${protocol}] ����Э������ http/https
#       [-d ${domain}]   ���� bitwarden ����
#       [-r true|false]  �Ƿ񿪷��û�ע��
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
