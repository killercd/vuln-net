FROM ubuntu:latest

RUN apt-get update && apt-get install -y postfix
RUN apt-get update && apt-get install -y openssh-server
RUN apt-get update && apt-get install -y telnet
RUN apt-get install -y net-tools
RUN apt-get install -y nano
RUN apt-get install -y nmap


RUN mkdir /var/run/sshd
RUN useradd -m -s /bin/bash james
RUN echo 'james:password' | chpasswd

RUN useradd -m -s /bin/bash mike
RUN echo 'mike:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY main.cf /etc/postfix/main.cf

EXPOSE 25
EXPOSE 22

#CMD ["postfix", "start-fg"]
CMD ["/usr/sbin/sshd", "-D"]