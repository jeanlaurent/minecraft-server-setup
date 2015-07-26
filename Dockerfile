FROM ubuntu:15.04
MAINTAINER Jean-Laurent de Morlhon <jeanlaurent@42craft.com>

RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y curl
RUN apt-get clean

RUN mkdir /minecraft
WORKDIR /minecraft

RUN curl -O https://s3.amazonaws.com/Minecraft.Download/versions/1.8.7/minecraft_server.1.8.7.jar
RUN echo "eula=true" > /minecraft/eula.txt
COPY ./ops.json /minecraft/
COPY ./server-icon.png /minecraft/
COPY ./server.properties /minecraft/

CMD java -Xms1G -Xmx2G -jar minecraft_server.1.8.7.jar --nogui --world world

EXPOSE 25565
