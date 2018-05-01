#!/usr/bin/env python3

from requests import get
import socket


def public_ip():
    ip_address = get('https://api.ipify.org').text
    print('My public IP address is:', ip_address)
    return ip_address


def local_ip():
    ip_address = socket.gethostbyname(socket.gethostname())
    print('My local IP address is:', ip_address)
    return ip_address

print('\n')
print(public_ip())
print('\n')
print(local_ip())
