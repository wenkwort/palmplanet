FROM matthewfeickert/docker-python3-ubuntu
USER root:0
RUN apt-get update && yes | apt-get upgrade
RUN apt-get install net-tools
RUN apt-get install iputils-ping
RUN apt-get install -y iproute2
RUN apt-get install -y nano
RUN apt-get install -y tcpdump
COPY . ./served-files-and-shit
WORKDIR /served-file-and-shit
CMD python3 -m http.server
EXPOSE 8000
RUN echo "== serverside has been built =="
