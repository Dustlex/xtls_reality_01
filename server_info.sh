#! /bin/bash
echo "Domain(SNI) = `docker compose exec xray bash -c "sed -n -e 49p /opt/xray/config.json" | awk -F '"' '{print $2}'`"
echo "UUID = `docker compose exec xray bash -c "sed -n -e 33p /opt/xray/config.json" | awk -F '"' '{print $4}'`"
echo "ShortID(SID) = `docker compose exec xray bash -c "sed -n -e 57p /opt/xray/config.json" | awk -F '"' '{print $2}'`"
echo "PrivateKey(PRK) = `docker compose exec xray bash -c "sed -n -e 52p /opt/xray/config.json" | awk -F '"' '{print $4}'`"
echo "PublicKey(PBK) = `docker compose exec xray bash -c "cat /home/PBK.txt"`"
