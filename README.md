# xtls_reality_01

This is the simple XRAY-XTLS-Reality server in the docker container

Шаги установки:
1) Установить Docker , для него есть интсрукция на официальном сайте https://docs.docker.com/desktop/install/linux-install/ 
2) Скачать репозиторий командой git clone https://github.com/Dustlex/xtls_reality_01.git 
3) Зайти в скачанную директорию cd xtls_reality_01/ 
4) Внести изменения в файл .env . Обязательно указать только значение переменной DOM (это домен сайта под который происходит маскировка).
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
