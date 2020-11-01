FROM ubuntu:latest

LABEL maintainer="umit.haciyusufoglu@gmail.com"

RUN apt-get update && apt-get upgrade -y
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install zip bash tar unzip lib32z1 libncursesw5 screen htop wget -y

RUN apt-get install inotify-tools -y
RUN apt-get install zlib1g:i386 -y
RUN apt-get install lib32stdc++6 -y

COPY /autocompiler/compile.sh /app/
COPY /autocompiler/luac_mta /app/
RUN chmod -R 777 /app/compile.sh
RUN chmod -R 777 /app/luac_mta

COPY mta-install.sh /app/
RUN chmod a+x /app/mta-install.sh
RUN bash /app/mta-install.sh

COPY starter.sh /app/
RUN chmod a+x /app/starter.sh

CMD ["/app/starter.sh"]