#!/usr/bin/env python3

from requests import get

ip = get('https://api.ipify.org').text
print('My public IP address is:', ip)

import socket
print('My local IP address is:', socket.gethostbyname(socket.gethostname()))



