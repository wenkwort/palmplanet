FROM ubuntu:latest
RUN apt-get update && yes | apt-get upgrade && yes | apt-get install nano
RUN apt-get install net-tools
RUN apt-get install -y iproute2
RUN apt-get install -y wget
RUN apt-get install -y iputils-ping
RUN apt-get install -y tcpdump
RUN apt-get install -y dnsutils
RUN apt-get install -y isc-dhcp-client
RUN echo "== clientside has been built  =="
