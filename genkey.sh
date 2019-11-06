#!/bin/sh
exit
openssl genrsa -out ssl.key 2048
openssl req -new -sha256 -key ssl.key -out ssl.csr
openssl x509 -req -days 365 -signkey ssl.key -in ssl.csr -out ssl.crt

# sign from ca
openssl x509 -req -in ssl.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out ssl.crt -days 365 -sha256

# one step gen key and csr
openssl req -new -newkey rsa:2048 -nodes -out cs.csr -keyout cs.key

# one step gen key and crt
openssl req -new -nodes -utf8 -sha256 -days 365 -batch -x509 -newkey rsa:2048 -out ssl.crt -keyout ssl.key

# gen pubkey from privkey
openssl rsa -in ssl.key -out ssl.pub -pubout

# verify key
openssl rsa -in ssl.key -check
openssl rsa -in ssl.key -pubout
# verify csr
openssl req -text -noout -verify -in ssl.csr
# verify crt
openssl x509 -in ssl.crt -noout -text

# sign and verify file
openssl dgst -sha256 -sign rsa.key -out file.sig  file
openssl dgst -sha256 -verify rsa.pub -signature file.sig  file
