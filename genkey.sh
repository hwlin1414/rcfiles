#!/bin/sh
exit
openssl genrsa -out server.key 2048
openssl req -new -sha256 -key server.key -out server.csr
openssl x509 -req -days 3650 -signkey server.key -in server.csr -out server.crt
