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

# Throubleshoot

## Layers not found!

If the following command
```
bitbake-layers show-layers
```
returns an error like no valid path to layers found:

After setting up poky, make shure to have a relative path to the layers provided in ```poky/build/conf/bblayers.conf```.

In case of building the image in Docker and running qemu from your host system, it should look like this:

```
../../poky/meta< * layer name * >
```

## file tool has a mismatching time output in the fit-map-data test

It uses UTC timezone for the ```do_compile``` in file's recipe.
Try to add ```export TZ=GMT``` to _poky/meta/recipes-devtools/file/file_<VERSION>.bb_ before ```oe_runmake check```.
