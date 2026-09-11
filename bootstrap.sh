#!/bin/bash
K=${XRAY_K:-$(/opt/xray/xray x25519 | awk -F ' ' '{print $NF}')}
export PRK=${PRK:-$(echo "$K" | sed -n 1p)}
export PBK=${PBK:-$(echo "$K" | sed -n 2p)}
export UUID=${UUID:-$(/opt/xray/xray uuid)}
export SID=${SID:-$(openssl rand -hex 8)}
export XHTTP_PATH=${XHTTP_PATH:-$(openssl rand -hex 8)}
export GRPC_NAME=${GRPC_NAME:-$(openssl rand -hex 8)}

echo "$PBK" > /home/PBK.txt
echo "$XHTTP_PATH" > /home/XHTTP_PATH.txt
echo "$GRPC_NAME" > /home/GRPC_NAME.txt

envsubst < /opt/xray/config.json_prepare_2 > /opt/xray/config.json
/opt/xray/xray run -c /opt/xray/config.json
