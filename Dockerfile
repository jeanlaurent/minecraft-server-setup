FROM openjdk:8u131-jre-alpine
MAINTAINER Jean-Laurent de Morlhon <jeanlaurent@42craft.com>

RUN apk add -U curl

WORKDIR /minecraft

ENV MINECRAFT_VERSION=1.12.2

RUN curl -O https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_VERSION/minecraft_server.$MINECRAFT_VERSION.jar
RUN echo "eula=true" > /minecraft/eula.txt
COPY ./ops.json /minecraft/
COPY ./server-icon.png /minecraft/
COPY ./server.properties /minecraft/

VOLUME /minecraft/world

EXPOSE 25565

ENTRYPOINT java -Xms1G -Xmx3G -jar /minecraft/minecraft_server.$  MINECRAFT_VERSION.jar --nogui --world world
