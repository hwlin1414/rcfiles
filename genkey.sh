#!/bin/sh
exit
openssl genrsa -out ssl.key 2048
openssl req -new -sha256 -key ssl.key -out ssl.csr
openssl x509 -req -days 365 -signkey ssl.key -in ssl.csr -out ssl.crt

# sign from ca
openssl x509 -req -in ssl.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out ssl.crt -days 365 -sha256

# gen key and csr
openssl req -new -newkey rsa:2048 -nodes -out cs.csr -keyout cs.key

# verify key
openssl rsa -in ssl.key -check
# verify csr
openssl req -text -noout -verify -in ssl.csr
# verify crt
openssl x509 -in ssl.crt -noout -text
