FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nano
RUN apt-get install -y net-tools
RUN apt-get install -y iproute2
RUN apt-get install -y wget
RUN apt-get install -y iputils-ping
RUN apt-get install -y tcpdump
RUN apt-get install -y dnsmasq
# ======= Работает, не трож!!! (Установка resolvconf на контейнер, способ с SO) =======
RUN apt-get update \
&& apt-get install -y apt-utils debconf-utils dialog \
&& echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
&& echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections \
&& apt-get update \
&& apt-get install -y resolvconf
# =====================================================================================
RUN echo "=== dnsserver has been built ==="

