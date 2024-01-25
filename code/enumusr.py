#SCRIPT enumusr.py

from socket import *
import sys
import time

TIMEOUT_CONN=2
SMTP_PORT = 25

user_list = ["root", "admin","nick","james","julius", "marco","luca","mike"]

ip = sys.argv[1]


connSkt = socket(AF_INET, SOCK_STREAM)
connSkt.settimeout(TIMEOUT_CONN)
connSkt.connect((ip, SMTP_PORT))
rcv_data = connSkt.recv(1024)
print("SMTP server banner: {}".format(rcv_data.decode('utf-8')))
for user in user_list:
    vrfy_data = "VRFY {}\r\n".format(user)
    connSkt.send(vrfy_data.encode())
    rcv_data = connSkt.recv(1024)
    #print(rcv_data.decode('utf-8').strip("\r\n"))
    if rcv_data.decode('utf-8').startswith("252"):
        print(user+" - found!")
    time.sleep(1)
connSkt.close()