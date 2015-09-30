#!/bin/sh
# confd does not yet allow for dynamically setting keys in the 
# TOML file. To get around this we will make the substitution here
# ahead of invoking the process.
# 
# Works around https://github.com/kelseyhightower/confd/issues/310
sed s#SE_CADVISOR_KEY#$SE_CADVISOR_KEY# /etc/confd/conf.d/prometheus.toml.template > /etc/confd/conf.d/prometheus.toml

# Okay now we can run confd 
exec /usr/bin/confd -backend stackengine -node $SE_HOST_IP:8443 -scheme https -auth-token $SE_API_TOKEN -interval 5
