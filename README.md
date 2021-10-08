# docker-zerotier
🐳 A docker image to run ZeroTier.

## Quickstart

### Start a container

```
docker run --name zerotier -d --net=host --device=/dev/net/tun --restart=always -v ~/somewhere:/var/lib/zerotier-one --cap-add=NET_ADMIN --cap-add=SYS_ADMIN seedgou/zerotier
```

This will mount `~/somewhere` to `/var/lib/zerotier-one` inside the container, allowing your ZeroTier to presist configuration.

### Manage ZeroTier

``` bash
docker exec zerotier zerotier-cli
```

## Docker Compose

`docker-compose.yml` example:

``` YAML
version: "3"

services:
  zerotier:
    image: seedgou/zerotier
    container_name: "zerotier"
    network_mode: "host"
    restart: always
    volumes:
      - ./config:/var/lib/zerotier-one
    cap_add:
      - NET_ADMIN
      - SYS_ADMIN
    devices:
      - "/dev/net/tun:/dev/net/tun"
```

This will mount `./config` to `/var/lib/zerotier-one` inside the container, allowing your ZeroTier to presist configuration.

### Manage ZeroTier

``` bash
docker-compose exec zerotier zerotier-cli
```

## Advanced usage

### Multi-arch support

This image supports `linux/386`, `linux/amd64`, `linux/ppc64le`, `linux/arm64`, `linux/arm/v7`, `linux/arm/v6` and `linux/s390x`.

### GitHub Container Registry

This image is also published on GitHub Container Registry: [`ghcr.io/rwv/zerotier`](https://ghcr.io/rwv/zerotier)