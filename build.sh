#!/bin/sh

openssl genrsa -aes256 -out ca.key -passout pass:Pass123 4096
openssl req -new -x509 -key ca.key -out ca.cer -sha256 -config ca.cnf -passin pass:Pass123

openssl genrsa -out server.key 4096
openssl req -sha256 -new -key server.key -config server.cnf -out server.csr

openssl x509 -req -extensions v3_req -sha256 -in server.csr -CA ca.cer -CAkey ca.key -CAcreateserial -out server.cer -extfile server.cnf -passin pass:Pass123

rm server.csr