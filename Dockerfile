FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install gpg wget ca-certificates

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list 
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list

RUN apt-get -y install apt-transport-https
RUN apt-get -y update
RUN apt-get -y install dotnet-sdk-2.1.200

RUN mkdir /app
RUN chmod 775 /app

CMD []