#!/usr/bin/with-contenv bash
# ==============================================================================
# TomCzhen's Hass.io Add-ons: ZeroTier One
# Take down the S6 supervision tree when ZeroTier One fails
# ==============================================================================
source /usr/lib/hassio-addons/base.sh

auth_token=$(hass.config.get 'auth_token')
echo ${auth_token} > /data/authtoken.secret

network_id=$(hass.config.get 'network_id')

if ! hass.directory_exists "/data/networks.d"; then
    mkdir /data/networks.d
fi

touch /data/networks.d/${network_id}.conf


ln -s /data /var/lib/zerotier-one