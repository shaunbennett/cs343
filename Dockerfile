FROM ubuntu:xenial

# Install packages required to build u++, along with some additional utilities
# Feel free to add any packages here that you might need, the ubuntu docker image is pretty bare
RUN apt-get update && apt-get install -y \
      g++-4.9 \
      gcc-4.9 \
      make \
      valgrind \
      vim \
      iputils-ping \
      wget

# Link g++-4.9 and gcc-4.9 to the g++ and gcc commands respectively
RUN ln -s /usr/bin/g++-4.9 /usr/bin/g++ && ln -s /usr/bin/gcc-4.9 /usr/bin/gcc

# Install u++, if wget is not working for you, you can use the ADD command below (copy the file to this folder)
# ADD u++-7.0.0.sh
WORKDIR /root
RUN wget https://plg.uwaterloo.ca/~usystem/pub/uSystem/u++-7.0.0.sh
RUN sh u++-7.0.0.sh
RUN rm u++-7.0.0.sh
