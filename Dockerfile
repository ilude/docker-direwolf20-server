FROM ubuntu:16.04
MAINTAINER Mike Glenn <mglenn@ilude.com>

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y curl unzip nano openjdk-8-jre-headless 
RUN mkdir -p /srv/minecraft/world 
RUN cd /srv/minecraft/ && curl https://addons-origin.cursecdn.com/files/2364/761/FTBPresentsDirewolf20110Server_1.3.2.zip --output direwolf_server.zip

RUN cd /srv/minecraft/ && \ 
	unzip direwolf_server.zip && \
	echo 'eula=true' > eula.txt && \
	rm direwolf_server.zip && \
	rm *.bat && \
	chmod +x ServerStart.sh && \
	echo 'JAVA_PARAMETERS="$JAVA_PARAMETERS -Dfml.queryResult=confirm"' > settings-local.sh && \
	sh ./FTBInstall.sh

RUN apt-get autoremove -y && apt-get clean

VOLUME /srv/minecraft/world
VOLUME /backups

CMD /srv/minecraft/ServerStart.sh
