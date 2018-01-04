# CS343 Docker Setup
This is a quick setup for compiling and running CS343 code on Windows or macOS using Docker.

### Setup
First, make sure you have [docker](https://www.docker.com/) installed! There are two options to get started:

#### Option 1: Use this repository
This repository is setup to make it as easy as possible to start working on CS343 assignments without much configuration. First clone this repository and cd into it
```
git clone https://github.com/shaunbennett/cs343.git && cd cs343
```
Next, create an assignments folder. This folder will be shared with the container, so you can write code locally and then compile and run in the container.
```
mkdir assignments
```
Now build the container with `docker-compose`
```
docker-compose build
```
Finally, run the container. It should open the bash shell inside the root home folder, everything should be setup for you!
```
docker-compose run cs343
```

#### Option 2: Pull the image
An alternative approach is to simply pull the image from Docker Hub.
```
docker pull phinary/cs343
```

### Usage
Almost everything should be setup already, you can compile u++ code with the `u++` command. Note that the Ubuntu docker image is pretty bare, if you need additional packages installed you will probably need to install them yourself.
