FROM python:3.8
WORKDIR /app
RUN apt-get update && apt-get install -y telnet
RUN apt-get install -y net-tools
RUN apt-get install -y nano
RUN apt-get install -y nmap
RUN apt-get install -y iputils-ping

#RUN apt-get install -y telnet
RUN apt-get install -y git && \
    git clone https://github.com/killercd/sshscan.git

# COPY requirements.txt .
# RUN pip install -r requirements.txt


#CMD ["python", "main.py"]
