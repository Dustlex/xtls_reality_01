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
root@ams-1-vm-2znk:~/xtls_reality_01# ./server_info.sh 

Domain(SNI) = www.cloudflare.com
UUID = 1b7d4d6b-c716-4689-92f4-10c6c02301c9
ShortID(SID) = 177d178b7896a8da
PrivateKey(PRK) = GLcHv6Sy6XLGjtrz8GaGcEGvYHwtubWi3UkPj7YFpnw
PublicKey(PBK) = HutOLqU8RPtkLjuLEngw39V9Eud0Ih2-FVAPlJpEdgg
XHTTP_PATH = 4dc99068febfdfa3
GRPC_NAME = b084b56dcee6f5ac



VLESS (TCP/Vision) = vless://1b7d4d6b-c716-4689-92f4-10c6c02301c9@64.188.62.229:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=HutOLqU8RPtkLjuLEngw39V9Eud0Ih2-FVAPlJpEdgg&sid=177d178b7896a8da&type=tcp&alpn=h2,http/1.1#www.cloudflare.com-Vision


VLESS (XHTTP)      = vless://1b7d4d6b-c716-4689-92f4-10c6c02301c9@64.188.62.229:8443?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=HutOLqU8RPtkLjuLEngw39V9Eud0Ih2-FVAPlJpEdgg&sid=177d178b7896a8da&type=xhttp&path=%2F4dc99068febfdfa3&mode=auto&alpn=h2#www.cloudflare.com-XHTTP


VLESS (gRPC)       = vless://1b7d4d6b-c716-4689-92f4-10c6c02301c9@64.188.62.229:2053?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=HutOLqU8RPtkLjuLEngw39V9Eud0Ih2-FVAPlJpEdgg&sid=177d178b7896a8da&type=grpc&serviceName=b084b56dcee6f5ac&mode=gun#www.cloudflare.com-gRPC
```
Download HAPP from https://github.com/Happ-proxy/happ-desktop, then install it, click “Add Server,” and select the “Add URL” option. 
Do this first for one VLESS (TCP/Vision) link, then for VLESS (XHTTP) and for VLESS (gRPC).

AFTERWARDS, DON’T FORGET TO CONFIGURE ROUTING; FOR THIS, LOOK FOR A SEPARATE GUIDE



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
root@ams-1-vm-2znk:~/xtls_reality_01# ./server_info.sh 

Domain(SNI) = www.cloudflare.com
UUID = 1b7d4d6b-c716-4689-92f4-10c6c02301c9
ShortID(SID) = 177d178b7896a8da
PrivateKey(PRK) = GLcHv6Sy6XLGjtrz8GaGcEGvYHwtubWi3UkPj7YFpnw
PublicKey(PBK) = HutOLqU8RPtkLjuLEngw39V9Eud0Ih2-FVAPlJpEdgg
XHTTP_PATH = 4dc99068febfdfa3
GRPC_NAME = b084b56dcee6f5ac



VLESS (TCP/Vision) = vless://1b7d4d6b-c716-4689-92f4-10c6c02301c9@64.188.62.229:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=HutOLqU8RPtkLjuLEngw39V9Eud0Ih2-FVAPlJpEdgg&sid=177d178b7896a8da&type=tcp&alpn=h2,http/1.1#www.cloudflare.com-Vision


VLESS (XHTTP)      = vless://1b7d4d6b-c716-4689-92f4-10c6c02301c9@64.188.62.229:8443?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=HutOLqU8RPtkLjuLEngw39V9Eud0Ih2-FVAPlJpEdgg&sid=177d178b7896a8da&type=xhttp&path=%2F4dc99068febfdfa3&mode=auto&alpn=h2#www.cloudflare.com-XHTTP


VLESS (gRPC)       = vless://1b7d4d6b-c716-4689-92f4-10c6c02301c9@64.188.62.229:2053?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=HutOLqU8RPtkLjuLEngw39V9Eud0Ih2-FVAPlJpEdgg&sid=177d178b7896a8da&type=grpc&serviceName=b084b56dcee6f5ac&mode=gun#www.cloudflare.com-gRPC
```
Качаем нужный клиент. Ниже будет пример для настройки HAPP под windows:

Скачиваете HAPP c https://github.com/Happ-proxy/happ-desktop , после чего устанавливаете, и нажимаете "добавить сервер" выбираете опцию "добавить URL". 
Сделайте так сначало для одной ссылки VLESS (TCP/Vision) , затем для VLESS (XHTTP) и VLESS (gRPC)

ПОСЛЕ ЧЕГО НЕ ЗАБУДЬТЕ НАСТРОИТЬ МАРШРУТИЗАЦЮ, ДЛЯ ЭТОГО ИЩИТЕ ГАЙД ОТДЕЛЬНО
