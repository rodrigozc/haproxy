FROM rodrigozc/consul-filebeat-agents:latest
MAINTAINER Rodrigo Zampieri Castilho <rodrigo.zampieri@gmail.com>

ENV APPLICATION_DEFAULT_NAME "haproxy"

RUN apt-get update \
    && apt-get install -y --no-install-recommends haproxy netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

ADD consul-template/1-consul-template.list /etc/consul-template/
ADD consul/service.ctmpl /etc/consul/
ADD consul/service.json /etc/consul/
#ADD consul/consul_kv_startup.sh /etc/consul/
ADD haproxy/haproxy.cfg /etc/haproxy/
ADD haproxy/haproxy.ctmpl /etc/haproxy/
#ADD run/consul_kv_startup.sh /docker/run/
ADD run/haproxy.sh /docker/run/
