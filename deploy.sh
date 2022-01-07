#!/bin/bash

docker build . --tag yocto_builder_deb \
	--build-arg BUILD_USER_UID_ARG=$(id -u) \
	--build-arg BUILD_USER_GID_ARG=$(id -g)

