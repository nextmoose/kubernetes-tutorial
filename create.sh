#!/bin/sh

docker \
    container \
    create \
    --name kubernetes-tutorial \
    --env DISPLAY \
    --mount type=bind,source=/tmp/.X11-unix,destination=/tmp/.X11-unix,readonly=true \
    --mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock,readonly=true \
    --mount type=bind,source=/dev/vboxdrv,destination=/dev/vboxdrv,readonly=true \
    --mount type=bind,source=/dev/vboxdrvu,destination=/dev/vboxdrvu,readonly=true \
    --mount type=bind,source=/dev/vboxdnetctl,destination=/dev/vboxnetctl,readonly=true \
    --privileged \
    kubernetes-tutorial:$(git rev-parse HEAD)