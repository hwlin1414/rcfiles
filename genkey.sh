#!/bin/sh
exit
openssl genrsa -out ssl.key 2048
openssl req -new -sha256 -key ssl.key -out ssl.csr
openssl x509 -req -days 365 -signkey ssl.key -in ssl.csr -out ssl.crt
