#! /bin/bash
echo "PublicKey(Pbk) = `docker compose exec xray bash -c "cat /home/PBK.txt"`"
echo "PrivateKey(Prk) = `docker compose exec xray bash -c "sed -n -e 34p /opt/xray/config.json" | awk -F '"' '{print $4}'`"
echo "UUID = `docker compose exec xray bash -c "sed -n -e 17p /opt/xray/config.json" | awk -F '"' '{print $4}'`"
echo "Domain(SNI) = `docker compose exec xray bash -c "sed -n -e 32p /opt/xray/config.json" | awk -F '"' '{print $2}'`"
echo "ShortID(Sid) = `docker compose exec xray bash -c "sed -n -e 39p /opt/xray/config.json" | awk -F '"' '{print $2}'`"
