FROM prom/prometheus
MAINTAINER Boyd Hemphill <boyd@stackengine.com>

RUN \
    apk upgrade && \
    apk update

#
# Install Supervisord
#

RUN \
    apk add py-pip && \
    pip install --upgrade pip && \
    pip install supervisor

ADD \
    supervisord/supervisord.conf \
    /etc/supervisord.conf

#
# Install and configure confd
#

ADD \
    confd/confd \
    /usr/bin/confd

ADD \
    confd/confd.sh \
    /usr/bin/confd.sh

RUN \
    chmod +x /usr/bin/confd.sh && \
    chmod +x /usr/bin/confd && \
    mkdir -p /etc/confd/conf.d && \
    mkdir -p /etc/confd/templates

ADD \ 
    prometheus/prometheus.yml.template \
    /etc/confd/templates/prometheus.yml.template

ADD \
    prometheus/prometheus.toml.template \
    /etc/confd/conf.d/prometheus.toml.template

ENTRYPOINT /usr/bin/supervisord -c /etc/supervisord.conf