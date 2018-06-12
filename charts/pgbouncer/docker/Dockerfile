FROM ubuntu:16.04
RUN apt-get update && apt install -y pgbouncer postgresql-client-9.5
RUN useradd pgbouncer -b '/' -m
USER pgbouncer
COPY run.sh /run.sh
COPY do_probe.sh /do_probe.sh
ENTRYPOINT /run.sh
