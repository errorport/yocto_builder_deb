#!/bin/bash

docker build . --tag yocto_builder_deb --build-arg BUILD_USER_ARG=$(whoami)

