# PowerShell
#------------------------------------------------
# ���� docker ����
# bin/run.ps1
#       [-p ${protocol}] ����Э������ http/https
#------------------------------------------------

param(
    [string]$p="http"
)

$PROTOCOL = $p

$ENV:protocol=${PROTOCOL}; docker-compose up -d
