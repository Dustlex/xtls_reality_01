# xtls_reality_01

Docker install
```
curl -fsSL https://get.docker.com/ -o get-docker.sh
sudo sh ./get-docker.sh
```

This is the simple XRAY-XTLS-Reality server in the docker container

Installation steps:
1) Install Docker , there is an intstruction for it on the official website https://docs.docker.com/desktop/install/linux-install/
2) Download the repository using the git clone command https://github.com/Dustlex/xtls_reality_01.git
3) Go to the downloaded directory cd xtls_reality_01/ 
4) Make changes to the .env file. The only thing that should be specified is the value of the DOM variable (this is the domain of the site that is being masked).
 - the working variant of the file is:
```
root@2172437-rl76948:~/xtls_reality_01# cat .env 
DOM=www.cloudflare.com/
UUID=
SID=
PRK=
PBK=
```
- If you know the other values (e.g. you already had an xray server and you know all the IDs and a couple of keys). You can specify them (without spaces after the "=" sign) so that the server will use them when configuring.
5) Start the server container with the command docker compose up -d
6) Use the server_info.sh script to get the data for the client connection, it runs like this - ./server_info.sh , and the output is:
```
root@fra-1-vm-ew4e:~/test/xtls_reality_01# ./server_info.sh
Domain(SNI) = www.cloudflare.com
UUID = 2cf31f58-f22c-4ff5-8654-154c7fc7fa73
ShortID(SID) = 11ec1c6a2a0a3b81
PrivateKey(PRK) = AKUpAiV3v8fDJifRYNd5Hngg7tB2CHby7FzAkznL1kg
PublicKey(PBK) = 9en7mFxRYNNkLWj1PreZUaiHXxbK_uC1aW01G-MnOSY

VLESS (TCP/Vision) = vless://2cf31f58-f22c-4ff5-8654-154c7fc7fa73@186.246.26.228:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.cloudflare.com&fp=chrome&pbk=9en7mFxRYNNkLWj1PreZUaiHXxbK_uC1aW01G-MnOSY&sid=11ec1c6a2a0a3b81&type=tcp&alpn=h2,http/1.1#www.cloudflare.com-Vision
VLESS (XHTTP) = vless://2cf31f58-f22c-4ff5-8654-154c7fc7fa73@186.246.26.228:443?encryption=none&security=reality&sni=www.cloudflare.com&fp=chrome&pbk=9en7mFxRYNNkLWj1PreZUaiHXxbK_uC1aW01G-MnOSY&sid=11ec1c6a2a0a3b81&type=xhttp&path=%2F&mode=auto&alpn=h2#www.cloudflare.com-XHTTP
```
Download HAPP from https://github.com/Happ-proxy/happ-desktop, then install it, click “Add Server,” and select the “Add URL” option. 
Do this first for one VLESS (TCP/Vision) link, then for VLESS (XHTTP). 

AFTERWARDS, DON’T FORGET TO CONFIGURE ROUTING; FOR THIS, LOOK FOR A SEPARATE GUIDE



Это простой XRAY-XTLS-Reality server в контейнере

Шаги установки:
1) Установить Docker , для него есть интсрукция на официальном сайте https://docs.docker.com/desktop/install/linux-install/ 
2) Скачать репозиторий командой git clone https://github.com/Dustlex/xtls_reality_01.git 
3) Зайти в скачанную директорию cd xtls_reality_01/ 
4) Внести изменения в файл .env . Из того что следует указать обязательно - только значение переменной DOM (это домен сайта под который происходит маскировка).
 - Т.е. рабочий вариант файла это:
```
root@2172437-rl76948:~/xtls_reality_01# cat .env 
DOM=microsoft.com
UUID=
SID=
PRK=
PBK=
```
- Если вам известны остальные значения (например у вас уже был xray сервер, и вы знаете как все ID так и пару ключей). Вы можете их указать (без пробелов после знака "="), чтобы сервер при настройке использовал их.
5) Запустить контейнер с сервером командой docker compose up -d
6) Использовать скрипт server_info.sh для получения данных для подключения клиента, его запуск выглядит так - ./server_info.sh , а результат работы:
```
root@fra-1-vm-ew4e:~/test/xtls_reality_01# ./server_info.sh
Domain(SNI) = www.cloudflare.com
UUID = 2cf31f58-f22c-4ff5-8654-154c7fc7fa73
ShortID(SID) = 11ec1c6a2a0a3b81
PrivateKey(PRK) = AKUpAiV3v8fDJifRYNd5Hngg7tB2CHby7FzAkznL1kg
PublicKey(PBK) = 9en7mFxRYNNkLWj1PreZUaiHXxbK_uC1aW01G-MnOSY

VLESS (TCP/Vision) = vless://2cf31f58-f22c-4ff5-8654-154c7fc7fa73@186.246.26.228:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.cloudflare.com&fp=chrome&pbk=9en7mFxRYNNkLWj1PreZUaiHXxbK_uC1aW01G-MnOSY&sid=11ec1c6a2a0a3b81&type=tcp&alpn=h2,http/1.1#www.cloudflare.com-Vision
VLESS (XHTTP) = vless://2cf31f58-f22c-4ff5-8654-154c7fc7fa73@186.246.26.228:443?encryption=none&security=reality&sni=www.cloudflare.com&fp=chrome&pbk=9en7mFxRYNNkLWj1PreZUaiHXxbK_uC1aW01G-MnOSY&sid=11ec1c6a2a0a3b81&type=xhttp&path=%2F&mode=auto&alpn=h2#www.cloudflare.com-XHTTP
```
Качаем нужный клиент. Ниже будет пример для настройки HAPP под windows:

Скачиваете HAPP c https://github.com/Happ-proxy/happ-desktop , после чего устанавливаете, и нажимаете "добавить сервер" выбираете опцию "добавить URL". 
Сделайте так сначало для одной ссылки VLESS (TCP/Vision) , затем для VLESS (XHTTP). 

А это себе потестить интереса ради
```
"realitySettings": {
  "show": false,
  "target": "${DOM}:443",
  "serverNames": ["${DOM}"],
  "privateKey": "${PRK}",
  "minClientVer": "0.0.0",
  "maxClientVer": "",
  "maxTimeDiff": 0,
  "shortIds": ["${SID}"],

  "limitFallbackUpload": {
    "afterBytes": 10485760,
    "bytesPerSec": 1048576,
    "burstBytesPerSec": 5242880
  },
  "limitFallbackDownload": {
    "afterBytes": 10485760,
    "bytesPerSec": 1048576,
    "burstBytesPerSec": 5242880
  }
}
```

ПОСЛЕ ЧЕГО НЕ ЗАБУДЬТЕ НАСТРОИТЬ МАРШРУТИЗАЦЮ, ДЛЯ ЭТОГО ИЩИТЕ ГАЙД ОТДЕЛЬНО
