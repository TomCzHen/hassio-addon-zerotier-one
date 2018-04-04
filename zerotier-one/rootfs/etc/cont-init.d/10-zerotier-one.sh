#!/usr/bin/with-contenv bash
# ==============================================================================
# TomCzhen's Hass.io Add-ons: ZeroTier One
# Take down the S6 supervision tree when ZeroTier One fails
# ==============================================================================
source /usr/lib/hassio-addons/base.sh

token=$(hass.config.get 'api_token')
echo ${token} > /data/authtoken.secret


ln -s /data /var/lib/zerotier-one