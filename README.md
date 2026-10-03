# xtls_reality_01

Docker install
```
curl -fsSL https://get.docker.com/ -o get-docker.sh && chmod +x get-docker.sh && ./get-docker.sh
```

This is the simple XRAY-XTLS-Reality server in the docker container

Installation steps:
1) Install Docker, if script above doesn't work there is an instruction for it on the official website https://docs.docker.com/desktop/install/linux-install/
2) Download the repository using the git clone command https://github.com/Dustlex/xtls_reality_01.git
3) Go to the downloaded directory cd xtls_reality_01/ 
4) Make changes to the .env file. The only thing that should be specified is the value of the DOM variable (this is the domain of the site that is being masked).
 - the working variant of the file is:
```
root@2172437-rl76948:~/xtls_reality_01# cat .env 
DOM=www.cloudflare.com
UUID=
SID=
PRK=
PBK=
XHTTP_PATH=
GRPC_NAME=
```
- If you know the other values (e.g. you already had an xray server and you know all the IDs and a couple of keys). You can specify them (without spaces after the "=" sign) so that the server will use them when configuring.
5) Start the server container with the command docker compose up -d
6) Use the server_info.sh script to get the data for the client connection, it runs like this - ./server_info.sh , and the output is:
```
root@ams-1-vm-ydbm:~/xtls_reality_01# ./server_info.sh 

DOM=www.cloudflare.com
UUID=833b00e2-d22a-438f-afc0-4ffe84b3e321
SID=0efe469178a8e818
PRK=gINIYFJ9ZudLkv1HEvyddztzw2AQlwFP_a6Vd46BMFQ
PBK=g86GcIHjsl3FjCHtLADT8MvGFdGeA6FIqx0y-0XhOVg
XHTTP_PATH=66e9b6aefd7ba2b2
GRPC_NAME=da0d086429f33389


YOU CAN COPY ALL THREE LINKS BELOW AT ONCE AND PASTE THEM INTO THE SUBSCRIPTION URL FIELD IN HAPP

vless://833b00e2-d22a-438f-afc0-4ffe84b3e321@77.233.215.57:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=g86GcIHjsl3FjCHtLADT8MvGFdGeA6FIqx0y-0XhOVg&sid=0efe469178a8e818&type=tcp&alpn=h2,http/1.1#www.cloudflare.com-Vision

vless://833b00e2-d22a-438f-afc0-4ffe84b3e321@77.233.215.57:8443?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=g86GcIHjsl3FjCHtLADT8MvGFdGeA6FIqx0y-0XhOVg&sid=0efe469178a8e818&type=xhttp&path=%2F66e9b6aefd7ba2b2&mode=auto&alpn=h2#www.cloudflare.com-XHTTP

vless://833b00e2-d22a-438f-afc0-4ffe84b3e321@77.233.215.57:2053?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=g86GcIHjsl3FjCHtLADT8MvGFdGeA6FIqx0y-0XhOVg&sid=0efe469178a8e818&type=grpc&serviceName=da0d086429f33389&mode=gun#www.cloudflare.com-gRPC

hysteria2://833b00e2-d22a-438f-afc0-4ffe84b3e321@77.233.215.57:443/?sni=www.cloudflare.com&insecure=0&pinSHA256=aa04438bf0c4d66a500b8870d931cee400d5bd115ab1a3231a03c894acd0cd3f&obfs=salamander&obfs-password=0efe469178a8e818#www.cloudflare.com-Hysteria2
```
Download happ from https://github.com/Happ-proxy/happ-desktop, install it, then click “add subscription” or “add from url” and paste all three links from the script output at once

ALSO, NOTE THAT THE SERVER AGGRESSIVELY BLOCKS ALL RUSSIAN RESOURCES. TO ACCESS RUSSIAN RESOURCES WHILE THE VPN IS ENABLED, CONFIGURE ROUTING ON THE CLIENT.


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Это простой XRAY-XTLS-Reality server в контейнере

Сначало ставим докер 
```
curl -fsSL https://get.docker.com/ -o get-docker.sh && chmod +x get-docker.sh && ./get-docker.sh
```

Шаги установки:
1) Установить Docker скриптом выше, если с ним проблемы - для докера есть интсрукция на официальном сайте https://docs.docker.com/desktop/install/linux-install/ 
2) Скачать репозиторий командой git clone https://github.com/Dustlex/xtls_reality_01.git 
3) Зайти в скачанную директорию cd xtls_reality_01/ 
4) Внести изменения в файл .env . Из того что следует указать обязательно - только значение переменной DOM (это домен сайта под который происходит маскировка).
 - Т.е. рабочий вариант файла это:
```
root@2172437-rl76948:~/xtls_reality_01# cat .env 
DOM=www.cloudflare.com
UUID=
SID=
PRK=
PBK=
XHTTP_PATH=
GRPC_NAME=
```
- Если вам известны остальные значения (например у вас уже был xray сервер, и вы знаете как все ID так и пару ключей). Вы можете их указать (без пробелов после знака "="), чтобы сервер при настройке использовал их.
5) Запустить контейнер с сервером командой docker compose up -d
6) Использовать скрипт server_info.sh для получения данных для подключения клиента, его запуск выглядит так - ./server_info.sh , а результат работы:
```
root@ams-1-vm-ydbm:~/xtls_reality_01# ./server_info.sh 

DOM=www.cloudflare.com
UUID=833b00e2-d22a-438f-afc0-4ffe84b3e321
SID=0efe469178a8e818
PRK=gINIYFJ9ZudLkv1HEvyddztzw2AQlwFP_a6Vd46BMFQ
PBK=g86GcIHjsl3FjCHtLADT8MvGFdGeA6FIqx0y-0XhOVg
XHTTP_PATH=66e9b6aefd7ba2b2
GRPC_NAME=da0d086429f33389


YOU CAN COPY ALL THREE LINKS BELOW AT ONCE AND PASTE THEM INTO THE SUBSCRIPTION URL FIELD IN HAPP

vless://833b00e2-d22a-438f-afc0-4ffe84b3e321@77.233.215.57:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=g86GcIHjsl3FjCHtLADT8MvGFdGeA6FIqx0y-0XhOVg&sid=0efe469178a8e818&type=tcp&alpn=h2,http/1.1#www.cloudflare.com-Vision

vless://833b00e2-d22a-438f-afc0-4ffe84b3e321@77.233.215.57:8443?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=g86GcIHjsl3FjCHtLADT8MvGFdGeA6FIqx0y-0XhOVg&sid=0efe469178a8e818&type=xhttp&path=%2F66e9b6aefd7ba2b2&mode=auto&alpn=h2#www.cloudflare.com-XHTTP

vless://833b00e2-d22a-438f-afc0-4ffe84b3e321@77.233.215.57:2053?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=g86GcIHjsl3FjCHtLADT8MvGFdGeA6FIqx0y-0XhOVg&sid=0efe469178a8e818&type=grpc&serviceName=da0d086429f33389&mode=gun#www.cloudflare.com-gRPC

hysteria2://833b00e2-d22a-438f-afc0-4ffe84b3e321@77.233.215.57:443/?sni=www.cloudflare.com&insecure=0&pinSHA256=aa04438bf0c4d66a500b8870d931cee400d5bd115ab1a3231a03c894acd0cd3f&obfs=salamander&obfs-password=0efe469178a8e818#www.cloudflare.com-Hysteria2
```
Качаем нужный клиент. Ниже будет пример для настройки HAPP под windows:

Скачиваете HAPP c https://github.com/Happ-proxy/happ-desktop , после чего устанавливаете, нажимайте "Добавить подписку" или "Добавить URL" после чего копируйте туда все три ссылки разом. 

ТАКЖЕ УЧИТЫВАЙТЕ ЧТО СЕРВЕР АГРЕССИВНО БЛОКИРУЕТ ВСЕ РОССИЙСКИЕ РЕСУРСЫ, ПОТОМУ ДЛЯ РАБОТЫ РФ РЕСУРСОВ ПРИ ВКЛЮЧЕННОМ ВПН, НАСТРАИВАЙТЕ МАРШРУТИЗАЦИЮ НА КЛИЕНТЕ. 

Потестировать для себя блокировку торрентов:
```
	  {
      "type": "field",
      "protocol": ["bittorrent"],
      "outboundTag": "block"
      }
```
