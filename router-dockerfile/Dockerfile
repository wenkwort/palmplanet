FROM ubuntu:latest
RUN apt-get update && yes | apt-get upgrade && yes | apt-get install nano
RUN yes | apt-get install net-tools
RUN yes | apt-get install iputils-ping
RUN yes | apt-get install iptables
RUN apt-get install -y tcpdump
RUN apt-get install -y iproute2
RUN echo "== router is running =="
