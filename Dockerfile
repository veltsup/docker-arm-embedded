FROM ubuntu:latest
MAINTAINER Veli-Matti Puurunen <veli-matti.puurunen@monidor.com>
LABEL Description="Docker image for building arm-embedded projects"

# To update image, in Docker Quickstart Terminal run:
# docker build -t eaglesandotherbirds/gcc-arm-embedded .
# docker push eaglesandotherbirds/gcc-arm-embedded

# General dependencies
RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  cmake \
  make \
  software-properties-common \
  cpputest \
  curl


# arm-none-eabi custom ppa
RUN add-apt-repository ppa:team-gcc-arm-embedded/ppa && \
  apt-get update && \
  apt-get install -y gcc-arm-embedded

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt

