# docker-zerotier

<a href="https://github.com/rwv/docker-zerotier/actions">
    <img src="https://img.shields.io/github/workflow/status/rwv/docker-zerotier/Docker" alt="GitHub Actions" />
</a>
<a href="https://hub.docker.com/r/seedgou/zerotier">
    <img src="https://img.shields.io/docker/v/seedgou/zerotier?sort=semver" alt="Docker Version" />
    <img src="https://img.shields.io/docker/pulls/seedgou/zerotier" alt="Docker Hub" />
    <img src="https://img.shields.io/docker/image-size/seedgou/zerotier/latest" alt="Docker Image Size" />
</a>
<br>
🐳 A docker image to run ZeroTier.

Have a look at dockerized ZeroTier moon: [rwv/zerotier-moon](https://github.com/rwv/docker-zerotier-moon).

## Table of Contents

- [Quickstart](#quickstart)
  - [Start a container](#start-a-container)
  - [Manage ZeroTier](#manage-zerotier)
- [Docker Compose](#docker-compose)
  - [Compose file](#compose-file)
  - [Manage ZeroTier](#manage-zerotier-1)
- [Advanced usage](#advanced-usage)
  - [Multi-arch support](#multi-arch-support)
  - [GitHub Container Registry](#github-container-registry)

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

### Compose file

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