FROM python:3.8

ADD . /dotfiles

WORKDIR /dotfiles

RUN ./install
