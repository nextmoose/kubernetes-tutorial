#!/bin/sh

sudo \
    docker \
    container \
    create \
    --name kubernetes-tutorial \
    --interactive \
    --tty \
    --net host \
    --env DISPLAY \
    --shm-size 256m \
    --mount type=bind,source=/tmp/.X11-unix,destination=/tmp/.X11-unix,readonly=true \
    --mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock,readonly=true \
    --mount type=bind,source=/dev/vboxdrv,destination=/dev/vboxdrv,readonly=true \
    --mount type=bind,source=/dev/vboxdrvu,destination=/dev/vboxdrvu,readonly=true \
    --mount type=bind,source=/dev/vboxnetctl,destination=/dev/vboxnetctl,readonly=true \
    --mount type=volume,source=kubernetes-tutorial,destination=/root \
    --privileged \
    kubernetes-tutorial:$(git rev-parse HEAD)