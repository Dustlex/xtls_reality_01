FROM ubuntu:22.04 as OS
USER root
WORKDIR /home
RUN apt-get update && apt-get install -y --no-install-recommends \
 wget \
 unzip \
 systemctl \
 gettext \
 openssl \
 vim
RUN wget https://github.com/XTLS/Xray-core/releases/download/v1.8.23/Xray-linux-64.zip --no-check-certificate && \
 mkdir /opt/xray && \
 unzip ./Xray-linux-64.zip -d /opt/xray && \
 chmod +x /opt/xray/xray
COPY ./config_2.json /opt/xray/config.json_prepare_2
COPY ./bootstrap.sh /home/bootstrap.sh
RUN chmod +x /home/bootstrap.sh
CMD /bin/bash -c "source /home/bootstrap.sh"
