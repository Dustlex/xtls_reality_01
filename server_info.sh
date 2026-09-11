#!/bin/bash
set -euo pipefail

CFG=$(docker compose exec -T xray cat /opt/xray/config.json)
IP=$(curl -s -4 https://ip.sb || curl -s -4 https://ifconfig.me)
DOM=$(echo "$CFG" | jq -r '.inbounds[] | select(.tag=="inbound-443") | .streamSettings.realitySettings.serverNames[0]')
UUID=$(echo "$CFG" | jq -r '.inbounds[] | select(.tag=="inbound-443") | .settings.clients[0].id')
SID=$(echo "$CFG" | jq -r '.inbounds[] | select(.tag=="inbound-443") | .streamSettings.realitySettings.shortIds[0]')
PRK=$(echo "$CFG" | jq -r '.inbounds[] | select(.tag=="inbound-443") | .streamSettings.realitySettings.privateKey')
XPATH=$(echo "$CFG" | jq -r '.inbounds[] | select(.tag=="inbound-xhttp") | .streamSettings.xhttpSettings.path' | sed 's#^/##' )
GNAME=$(echo "$CFG" | jq -r '.inbounds[] | select(.tag=="inbound-grpc") | .streamSettings.grpcSettings.serviceName')
PBK=$(docker compose exec -T xray cat /home/PBK.txt)

echo ""

echo "Domain(SNI) = $DOM"
echo "UUID = $UUID"
echo "ShortID(SID) = $SID"
echo "PrivateKey(PRK) = $PRK"
echo "PublicKey(PBK) = $PBK"
echo "XHTTP_PATH = $XPATH"
echo "GRPC_NAME = $GNAME"

echo ""
echo ""
echo ""

echo "VLESS (TCP/Vision) = vless://${UUID}@${IP}:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=${DOM}&fp=firefox&pbk=${PBK}&sid=${SID}&type=tcp&alpn=h2,http/1.1#${DOM}-Vision"

echo ""
echo ""

echo "VLESS (XHTTP)      = vless://${UUID}@${IP}:8443?encryption=none&security=reality&sni=${DOM}&fp=firefox&pbk=${PBK}&sid=${SID}&type=xhttp&path=%2F${XPATH}&mode=auto&alpn=h2#${DOM}-XHTTP"

echo ""
echo ""

echo "VLESS (gRPC)       = vless://${UUID}@${IP}:2053?encryption=none&security=reality&sni=${DOM}&fp=firefox&pbk=${PBK}&sid=${SID}&type=grpc&serviceName=${GNAME}&mode=gun#${DOM}-gRPC"

echo ""
