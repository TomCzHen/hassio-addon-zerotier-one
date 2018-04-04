#!/usr/bin/with-contenv bash
# ==============================================================================
# TomCzhen's Hass.io Add-ons: ZeroTier One
# Take down the S6 supervision tree when ZeroTier One fails
# ==============================================================================
source /usr/lib/hassio-addons/base.sh

if ! hass.directory_exists -d "/data/networks.d"; then
    mkdir /data/networks.d
fi

network=$(hass.config.get 'network')

if [ ! hass.file_exists "/data/networks.d/${network}.conf" ] && [ ${network} ]; then
    rm -f /data/networks.d/*
    touch "/data/networks.d/${network}.conf"
fi

ln -s /data /var/lib/zerotier-one