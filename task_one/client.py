import socket
import time
hostname = '185.111.219.128'

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((hostname, 8888))
data = s.recv(1024)
print 'Received', repr(data)
s.sendall("lol\n")
time.sleep(1)
data = s.recv(1024)
print 'Received', repr(data)
s.close()
