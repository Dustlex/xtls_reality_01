# xtls_reality_01

This is the simple XRAY-XTLS-Reality server in the docker container

Installation steps:
1) Install Docker , there is an intstruction for it on the official website https://docs.docker.com/desktop/install/linux-install/
2) Download the repository using the git clone command https://github.com/Dustlex/xtls_reality_01.git
3) Go to the downloaded directory cd xtls_reality_01/ 
4) Make changes to the .env file. The only thing that should be specified is the value of the DOM variable (this is the domain of the site that is being masked).
 - the working variant of the file is:
```
root@2172437-rl76948:~/xtls_reality_01# cat .env 
DOM=www.microsoft.com
UUID=
SID=
PRK=
PBK=
```
- If you know the other values (e.g. you already had an xray server and you know all the IDs and a couple of keys). You can specify them (without spaces after the "=" sign) so that the server will use them when configuring.
5) Start the server container with the command docker compose up -d
6) Use the server_info.sh script to get the data for the client connection, it runs like this - ./server_info.sh , and the output is:
```
2172437-rl76948:~/xtls_reality_01# ./server_info.sh 
PublicKey(Pbk) = L1P7m1PQ8R-hQHlANMqnuvp4YNqUWkHEagp5fCkJrQw
PrivateKey(Prk) = CLV3hJDMAXjjyLG8Skyvki1RovnmchDXswjRko5e0UE
UUID = 9f4f81f6-d5f2-4c30-a2d5-9f91826a3af9
Domain(SNI) = www.microsoft.com
ShortID(Sid) = 9e0fb27ceded3dcc
```
Download the desired client. Below will be an example to configure NekoBox for windows:
- Server - New Profile - VLESS
- Name - any name
- Address - IP of the server where the installation took place
- Port - 443
- UUID - what you got in point 6 (also relevant for those who filled env themselves).
- Flow - xtls-rprx-vision
- Transport - tcp
- Security - tls
- Packet encoding - xudp
- SNI - what you got in point 6 (relevant also for those who filled env themselves)
- ALPN - h2
- Fingerprint - chrome - I recommend it, but you can choose another one.
- Reality Pbk - what you got in point 6 (also relevant for those who filled out env themselves)
- Reality Sid - what you got in point 6 (also relevant for those who filled env themselves).
- Leave everything else unchanged (even if the fields are empty).


Это простой XRAY-XTLS-Reality server в контейнере

Шаги установки:
1) Установить Docker , для него есть интсрукция на официальном сайте https://docs.docker.com/desktop/install/linux-install/ 
2) Скачать репозиторий командой git clone https://github.com/Dustlex/xtls_reality_01.git 
3) Зайти в скачанную директорию cd xtls_reality_01/ 
4) Внести изменения в файл .env . Из того что следует указать обязательно - только значение переменной DOM (это домен сайта под который происходит маскировка).
 - Т.е. рабочий вариант файла это:
```
root@2172437-rl76948:~/xtls_reality_01# cat .env 
DOM=www.microsoft.com
UUID=
SID=
PRK=
PBK=
```
- Если вам известны остальные значения (например у вас уже был xray сервер, и вы знаете как все ID так и пару ключей). Вы можете их указать (без пробелов после знака "="), чтобы сервер при настройке использовал их.
5) Запустить контейнер с сервером командой docker compose up -d
6) Использовать скрипт server_info.sh для получения данных для подключения клиента, его запуск выглядит так - ./server_info.sh , а результат работы:
```
2172437-rl76948:~/xtls_reality_01# ./server_info.sh 
PublicKey(Pbk) = L1P7m1PQ8R-hQHlANMqnuvp4YNqUWkHEagp5fCkJrQw
PrivateKey(Prk) = CLV3hJDMAXjjyLG8Skyvki1RovnmchDXswjRko5e0UE
UUID = 9f4f81f6-d5f2-4c30-a2d5-9f91826a3af9
Domain(SNI) = www.microsoft.com
ShortID(Sid) = 9e0fb27ceded3dcc
```
Качаем нужный клиент. Ниже будет пример для настройки NekoBox под windows:
- Сервер - Новый профиль - VLESS
- Имя - любое
- Адрес - IP сервера где происходила установка
- Порт - 443
- UUID - то что вы получили в пункте 6 (актуально и для тех, кто заполнял env сам)
- Flow - xtls-rprx-vision
- Транспорт -  tcp
- Безопасность - tls
- Кодирования пакетов - xudp
- SNI - то что вы получили в пункте 6 (актуально и для тех, кто заполнял env сам)
- ALPN - h2
- Fingerprint - chrome  - рекомендую его, но можете выбрать другой
- Reality Pbk - то что вы получили в пункте 6 (актуально и для тех, кто заполнял env сам)
- Reality Sid - то что вы получили в пункте 6 (актуально и для тех, кто заполнял env сам)
- Все остальное оставляем без изменений (даже если поля пустые).
