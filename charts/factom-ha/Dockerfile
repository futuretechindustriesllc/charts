FROM ubuntu:latest

RUN useradd -ms /bin/bash runner

WORKDIR /root

RUN mkdir -p /utils
RUN chown runner: /utils

RUN apt update
RUN apt install -y wget netcat bsdtar curl python python-pip
RUN pip install requests
RUN wget https://github.com/FactomProject/distribution/releases/download/v5.1.0/factom-amd64.deb
RUN dpkg -i factom-amd64.deb


USER runner
WORKDIR /home/runner
RUN mkdir -p ~/.factom/m2 && touch ~/.factom/m2/factomd.conf
