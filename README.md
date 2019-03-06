# TomCzHen's Hass.io Add-ons: ZeroTier One

First, let me sorry for my poor english.

## How To Use

### `network_id`

All ZeroTier networks have a unique ID. Devices use a Network's ID to join the network.

### `port` & `auth_token`

**`auth_token` IS NOT `Zerotier Central API Access Tokens`**

> ### ZeroTier Manual 
> #### 4.1. JSON API 
> Macintosh and Windows versions of ZeroTier One come with a graphical UI that runs as a tray / task bar app, and all three versions include a command line interface called zerotier-cli. These interfaces control the service using a local JSON API available via http on ZeroTier's primary port (9993 by default) and authenticated using a token stored as `authtoken.secret` in the service's working directory.
>
> The API may be accessed directly via HTTP GET and POST requests that include the X-ZT1-Auth header whose value must be the contents of `authtoken.secret`. 

The startup script use `auth_token` generate `authtoken.secret` file in zerotier working dircetory. 

## Monitor Zerotier Network

You can use [RESTful Sensor](https://www.home-assistant.io/components/sensor.rest/) monitor zerotier network status.

example:

```
  - platform: rest
    name: ZeroTier One Status
    json_attributes:
      - address
      - version
    resource: http://127.0.0.1:9993/status
    value_template: '{{ value_json.online }}'
    method: GET
    headers:
      X-ZT1-Auth: auth_token
  - platform: rest
    name: ZeroTier One Network
    json_attributes:
      - id
      - type
    resource: http://127.0.0.1:9993/network/network_id
    value_template: '{{ value_json.status }}'
    method: GET
    headers:
      X-ZT1-Auth: auth_token
```

More Zerotier local api please vist [https://www.zerotier.com/manual.shtml#4.1](https://www.zerotier.com/manual.shtml#4.1)