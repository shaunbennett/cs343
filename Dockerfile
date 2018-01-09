FROM ubuntu:xenial

# Add extra repository for gcc and g++
RUN apt-get update && apt-get install -y software-properties-common \
      && add-apt-repository ppa:ubuntu-toolchain-r/test && rm -rf /var/lib/apt/lists/*

# Install packages required to build u++, along with some additional utilities
# Feel free to add any packages here that you might need, the ubuntu docker image is pretty bare
# Install version 5 and 6 to better represent what is used on the student linux environment
RUN apt-get update && apt-get install -y \
      g++-5 \
      gcc-5 \
      g++-6 \
      gcc-6 \
      make \
      valgrind \
      wget \
      vim \
      iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Setup the linking for g++ and gcc commands
RUN ln -s /usr/bin/g++-5 /usr/bin/g++ && ln -s /usr/bin/gcc-5 /usr/bin/gcc

# Install u++, if wget is not working for you, you can use the ADD command below (copy the file to this folder)
# ADD u++-7.0.0.sh
WORKDIR /root
RUN wget https://plg.uwaterloo.ca/~usystem/pub/uSystem/u++-7.0.0.sh
RUN sh u++-7.0.0.sh
RUN rm u++-7.0.0.sh
