#!/bin/bash
set -e

XAUTH_TOKEN=$(xauth list | grep ${DISPLAY} | awk '{print $3}')

docker build \
    --build-arg user=${USER} \
    --build-arg uid=$(id -u ${USER}) \
    --build-arg gid=$(id -g ${USER}) \
    -t vscode \
    .
docker run --rm -it --privileged \
    --env DISPLAY=${DISPLAY} \
    --user $(id -u ${USER}):$(id -g ${USER}) \
    --net=host \
    vscode:latest \
    ./vscode.sh "${XAUTH_TOKEN}"
