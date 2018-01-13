FROM openjdk:8u131-jre-alpine
MAINTAINER Jean-Laurent de Morlhon <jeanlaurent@42craft.com>

RUN apk add -U curl

WORKDIR /minecraft

RUN curl -O https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar
RUN echo "eula=true" > /minecraft/eula.txt
COPY ./ops.json /minecraft/
COPY ./server-icon.png /minecraft/
COPY ./server.properties /minecraft/

VOLUME /minecraft/world

EXPOSE 25565

ENTRYPOINT java -Xms1G -Xmx3G -jar /minecraft/minecraft_server.1.12.2.jar --nogui --world world
