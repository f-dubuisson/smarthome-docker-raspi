FROM resin/rpi-raspbian:jessie

RUN  apt-get update \
   && apt-get -y install python3 python3-dev python3-setuptools git build-essential

RUN easy_install3 pip \
 && pip3 install ephem

RUN mkdir -p /usr/local/smarthome/ \
 && cd /usr/local \
 && git clone git://github.com/mknx/smarthome.git

COPY etc/* /usr/local/smarthome/etc/

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/smarthome/bin/smarthome.py -d"]
