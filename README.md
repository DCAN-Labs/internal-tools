# Internal Tools for the DCAN Labs pipelines.
The repository contains the Dockerfile to create a Docker image of internal
software tools used by DCAN pipelines. Notice that there is no entry point
for this container. It is meant to be used to build the next level of any DCAN
pipeline.


## Building Docker Image
In order to build this container, you will need to have already built the
external-software docker image.

Edit Dockerfile with the releases of the internal tools you want to use. When
you push your changes to the Dockerfile, DockerHub will re-build the image.


## Using Docker Image
Before running, you will need to load the image onto your Docker service by
running the following command:
```
docker pull dcanlabs/internal-tools
```
If you receive a "no space left on device" error during this pull process, you
may need to clean up any old/dangling images and containers from the docker
registry, and possibly increase the amount of space allocated to Docker.

## Using Singularity
You can either pull the image from the Docker repository or build it from the
repository for the image to be saved in the working directory:
```
singularity pull docker://dcanlabs/internal-tools

singularity build internal-tools.img docker://dcanlabs/internal-tools
```
These are essentially the same, but in the latter case you have control over the
name of the file.


