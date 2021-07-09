#!/bin/bash

USER=$(whoami)

echo "Running Yocto builder image as $USER."

docker run -it \
    --user 1001 \
    -v $1:/poky \
    -v "${HOME}/.ssh:/home/${USER}/.ssh" \
    -v "${HOME}/.gitconfig:/home/${USER}/.gitconfig" \
    -v "/etc/localtime:/etc/localtime:ro" \
    -v "/etc/localtime:/etc/localtime:ro" \
    --env=HOST_UID=$(id -u) \
    --env=HOST_GID=$(id -g) \
    --env=USER=${USER} \
    -v "${HOME}:${HOME}" \
    -v "/tmp:/tmp" \
    yocto_builder_deb:latest \
    /bin/bash

