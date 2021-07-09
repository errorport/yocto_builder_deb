# Purpose

I am using these scripts to have a build environment for Yocto while I learn Yocto config / usage.

* _deploy.sh_ produces a Docker image, prepared for Yocto building.
* _run.sh_ runs the container with specific parameters.

# Usage

1. Deployment:

```sh
./deploy
```

2. Start the container:

```sh
./run.sh <your poky / yocto workdir path here>
```
