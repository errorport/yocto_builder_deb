#!/bin/bash

USER=$(whoami)

echo "Running Yocto builder image as UID: $(id -u), GID: $(id -g)."

docker run -it \
	--user $(id -u) \
	-v "$1:/poky" \
	-v "${HOME}/.ssh:/home/${USER}/.ssh" \
	-v "${HOME}/.gitconfig:/home/${USER}/.gitconfig" \
	-v "/etc/localtime:/etc/localtime:ro" \
	-e HOST_UID=$(id -u) \
	-e HOST_GID=$(id -g) \
	-e USER=${USER} \
	-v "${HOME}:${HOME}" \
	-v "/tmp:/tmp" \
	--device /dev/net/tun:/dev/net/tun \
	-e DISPLAY=$DISPLAY \
	--net=host \
	--privileged \
	yocto_builder_deb:latest \
	/bin/bash

