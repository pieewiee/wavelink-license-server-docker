
# pieewiee/bind:latest

- [Introduction](#introduction)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [wavelink](http://www.wavelink.com/Download-Emulation-License-Server-Software/) 

Wavelink License Server is used to license Ivanti products.



# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/pieewiee/wavelink-license-server) and is the recommended method of installation.


```bash
docker pull pieewiee/wavelink-license-server:latest
```

Alternatively you can build the image yourself.

```bash
docker build -t pieewiee/wavelink-license-server github.com/pieewiee/wavelink-license-server-docker
```

## Quickstart

Start Wavelink License Server using:

```bash
docker run --name license -d --restart=always \
  --publish 4420:4420/tcp --publish 1820:1820/udp \
  --volume /srv/docker/wavelink:/data \
  pieewiee/wavelink-license-server:latest
```

*Alternatively, you can use the sample [docker-compose.yml](docker-compose.yml) file to start the container using [Docker Compose](https://docs.docker.com/compose/)*

When the container is started the [wavelink](http://www.wavelink.com/Download-Emulation-License-Server-Software/) service is also started and is accessible from the web browser at https://localhost:4420. 


