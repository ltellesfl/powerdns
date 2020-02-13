FROM debian:10-slim

RUN apt-get update && \
    apt-get install -y curl gnupg2

RUN echo 'deb [arch=amd64] http://repo.powerdns.com/debian buster-auth-43 main' >> /etc/apt/sources.list && \
    curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add -

RUN apt-get update && apt-get install -y pdns-server && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/pdns_server"]
