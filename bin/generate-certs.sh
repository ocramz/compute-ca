#/bin/bash

# of compute nodes
NNODES = $1

# private key called ca-priv-key.pem for the CA:

openssl genrsa -out ca-priv-key.pem 2048

# public key :

openssl req -config /usr/lib/ssl/openssl.cnf -new -key ca-priv-key.pem -x509 -days 1825 -subj '/C=US/ST=Oregon/L=Portland/O=IT/CN=www.example.com' -out ca.pem


for ii in {1..${NNODES}}
do
    echo "Hello from node $ii"
done
