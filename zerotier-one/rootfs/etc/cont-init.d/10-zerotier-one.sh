#!/usr/bin/with-contenv bash
# ==============================================================================
# TomCzhen's Hass.io Add-ons: ZeroTier One
# Take down the S6 supervision tree when ZeroTier One fails
# ==============================================================================
source /usr/lib/hassio-addons/base.sh

if [ ! -d "/data/networks.d" ]; then
    mkdir -m a=rwx /data/networks.d
fi

network_id=$(hass.config.get 'network')

if [ ! -f "/data/networks.d/${network_id}.conf" ] && [ ${network_id} ]; then
    rm -f /data/networks.d/*
    touch "/data/networks.d/${network_id}.conf"
fi

#chown -R zerotier-one:zerotier-one /data

ln -s /data /var/lib/zerotier-one