# xtls_reality_01

Docker install
```
curl -fsSL https://get.docker.com/ -o get-docker.sh
chmod +x get-docker.sh
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
root@ala-1-vm-d5t2:~/xtls_reality_01_test_all# ./server_info.sh 

Domain(SNI) = www.cloudflare.com
UUID = db1c3283-2667-4799-b616-c6fd00545a90
ShortID(SID) = 0309a237d9751992
PrivateKey(PRK) = sCyoV1gp0fSjRe_dx5GMFEMWKNhuKy9ZjZA86oD4bWE
PublicKey(PBK) = D1CMfGbs6AAMvdLNajTxxJjPUexRDPBxZ88N8RbBfiI
XHTTP_PATH = eb1c8b90d1677211
GRPC_NAME = 9660872dbec4cccc



VLESS (TCP/Vision) = vless://db1c3283-2667-4799-b616-c6fd00545a90@91.200.148.215:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=D1CMfGbs6AAMvdLNajTxxJjPUexRDPBxZ88N8RbBfiI&sid=0309a237d9751992&type=tcp&alpn=h2,http/1.1#www.dropbox.com-Vision


VLESS (XHTTP)      = vless://db1c3283-2667-4799-b616-c6fd00545a90@91.200.148.215:8443?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=D1CMfGbs6AAMvdLNajTxxJjPUexRDPBxZ88N8RbBfiI&sid=0309a237d9751992&type=xhttp&path=%2Feb1c8b90d1677211&mode=auto&alpn=h2#www.dropbox.com-XHTTP


VLESS (gRPC)       = vless://db1c3283-2667-4799-b616-c6fd00545a90@91.200.148.215:2053?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=D1CMfGbs6AAMvdLNajTxxJjPUexRDPBxZ88N8RbBfiI&sid=0309a237d9751992&type=grpc&serviceName=9660872dbec4cccc&mode=gun#www.dropbox.com-gRPC
```
Download HAPP from https://github.com/Happ-proxy/happ-desktop, then install it, click “Add Server,” and select the “Add URL” option. 
Do this first for one VLESS (TCP/Vision) link, then for VLESS (XHTTP) and for VLESS (gRPC).

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
root@ala-1-vm-d5t2:~/xtls_reality_01_test_all# ./server_info.sh 

Domain(SNI) = www.cloudflare.com
UUID = db1c3283-2667-4799-b616-c6fd00545a90
ShortID(SID) = 0309a237d9751992
PrivateKey(PRK) = sCyoV1gp0fSjRe_dx5GMFEMWKNhuKy9ZjZA86oD4bWE
PublicKey(PBK) = D1CMfGbs6AAMvdLNajTxxJjPUexRDPBxZ88N8RbBfiI
XHTTP_PATH = eb1c8b90d1677211
GRPC_NAME = 9660872dbec4cccc



VLESS (TCP/Vision) = vless://db1c3283-2667-4799-b616-c6fd00545a90@91.200.148.215:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=D1CMfGbs6AAMvdLNajTxxJjPUexRDPBxZ88N8RbBfiI&sid=0309a237d9751992&type=tcp&alpn=h2,http/1.1#www.dropbox.com-Vision


VLESS (XHTTP)      = vless://db1c3283-2667-4799-b616-c6fd00545a90@91.200.148.215:8443?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=D1CMfGbs6AAMvdLNajTxxJjPUexRDPBxZ88N8RbBfiI&sid=0309a237d9751992&type=xhttp&path=%2Feb1c8b90d1677211&mode=auto&alpn=h2#www.dropbox.com-XHTTP


VLESS (gRPC)       = vless://db1c3283-2667-4799-b616-c6fd00545a90@91.200.148.215:2053?encryption=none&security=reality&sni=www.cloudflare.com&fp=firefox&pbk=D1CMfGbs6AAMvdLNajTxxJjPUexRDPBxZ88N8RbBfiI&sid=0309a237d9751992&type=grpc&serviceName=9660872dbec4cccc&mode=gun#www.dropbox.com-gRPC
```
Качаем нужный клиент. Ниже будет пример для настройки HAPP под windows:

Скачиваете HAPP c https://github.com/Happ-proxy/happ-desktop , после чего устанавливаете, и нажимаете "добавить сервер" выбираете опцию "добавить URL". 
Сделайте так сначало для одной ссылки VLESS (TCP/Vision) , затем для VLESS (XHTTP) и VLESS (gRPC)

ПОСЛЕ ЧЕГО НЕ ЗАБУДЬТЕ НАСТРОИТЬ МАРШРУТИЗАЦЮ, ДЛЯ ЭТОГО ИЩИТЕ ГАЙД ОТДЕЛЬНО
