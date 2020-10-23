FROM ubuntu:latest

RUN apt-get update -y && apt-get install -y git

WORKDIR /home/niklas

RUN git clone https://github.com/nik-sm/dotfiles.git

WORKDIR dotfiles

RUN ./install
