# # # compute-ca
FROM phusion/baseimage


RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates debian-keyring debian-archive-keyring scp openssl




# private key called ca-priv-key.pem for the CA:

RUN openssl genrsa -out ca-priv-key.pem 2048

# public key :

RUN openssl req -config /usr/lib/ssl/openssl.cnf -new -key ca-priv-key.pem -x509 -days 1825 -out ca.pem