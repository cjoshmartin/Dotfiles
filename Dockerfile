# this Dockerfile is for testing my dotfiles
FROM ubuntu
MAINTAINER Josh Martin <contact@cjoshmartin.com>

RUN apt-get update && \
    apt-get install -y git \
    && apt-get clean

RUN cd $HOME && \
    git clone https://github.com/cjoshmartin/Dotfiles.git .dotfiles
RUN cd ~/.dotfiles

RUN ~/.dotfiles/install.sh
