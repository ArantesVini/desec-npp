import socket
import time
import sys

target_ip = '172.16.1.3'
ports = [33024,33054,43001,44289,49222]

def scan_port(target, port):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.connect((target, port))
        print('[+] Banner: ' + str(sock.recv(1024)))
        sock.close()
    except:
        print('[-] Port Closed: ' + str(port))

def scan_target(target, ports):
    print('\nScanning Target: ' + target)
    for port in ports:
        scan_port(target, port)

scan_target(target_ip, ports)