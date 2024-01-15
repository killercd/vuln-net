FROM ubuntu:latest

RUN apt-get update && apt-get install -y postfix
RUN apt-get update && apt-get install -y telnet
RUN apt-get install -y net-tools

RUN useradd -m -s /bin/bash james
RUN echo 'james:password' | chpasswd

RUN useradd -m -s /bin/bash mike
RUN echo 'mike:password' | chpasswd

#COPY main.cf /etc/postfix/main.cf

EXPOSE 25

CMD ["postfix", "start-fg"]
