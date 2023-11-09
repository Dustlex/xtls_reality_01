#!/bin/bash
K=${XRAY_K:-$(/opt/xray/xray x25519 | awk '{print $3}')}
export PRK=${PRK:-$(echo "$K" | sed -n 1p)}
export PBK=${PBK:-$(echo "$K" | sed -n 2p)}
export UUID=${UUID:-$(/opt/xray/xray uuid)}
export SID=${SID:-$(openssl rand -hex 8)}
echo "$PBK" > /home/PBK.txt
envsubst < /opt/xray/config.json_prepare_2 > /opt/xray/config.json
/opt/xray/xray run -c /opt/xray/config.json
