#!/bin/bash
set -euo pipefail

CFG=$(docker compose exec -T xray cat /opt/xray/config.json)
IP=$(curl -s -4 https://ip.sb || curl -s -4 https://ifconfig.me)

DOM=$(echo "$CFG" | jq -r '.inbounds[0].streamSettings.realitySettings.serverNames[0]')
UUID=$(echo "$CFG" | jq -r '.inbounds[0].settings.clients[0].id')
SID=$(echo "$CFG" | jq -r '.inbounds[0].streamSettings.realitySettings.shortIds[0]')
PRK=$(echo "$CFG" | jq -r '.inbounds[0].streamSettings.realitySettings.privateKey')
#XPATH=$(echo "$CFG" | jq -r '.inbounds[1].streamSettings.xhttpSettings.path' | sed 's#^/##')
PBK=$(docker compose exec -T xray cat /home/PBK.txt)

echo "Domain(SNI) = $DOM"
echo "UUID = $UUID"
echo "ShortID(SID) = $SID"
echo "PrivateKey(PRK) = $PRK"
echo "PublicKey(PBK) = $PBK"
#echo "XHTTP_PATH = $XPATH"
echo ""
echo "VLESS (TCP/Vision) = vless://${UUID}@${IP}:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=${DOM}&fp=chrome&pbk=${PBK}&sid=${SID}&type=tcp&alpn=h2,http/1.1#${DOM}-Vision"
echo "VLESS (XHTTP)      = vless://${UUID}@${IP}:8443?encryption=none&security=reality&sni=${DOM}&fp=chrome&pbk=${PBK}&sid=${SID}&type=xhttp&path=%2F&mode=auto&alpn=h2#${DOM}-XHTTP"
#echo "VLESS (XHTTP)      = vless://${UUID}@${IP}:8443?encryption=none&security=reality&sni=${DOMAIN}&fp=chrome&pbk=${PBK}&sid=${SID}&type=xhttp&path=%2F${XPATH}&mode=auto&alpn=h2#${DOMAIN}-XHTTP"
