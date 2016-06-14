#/bin/bash

# of compute nodes
NNODES=$1


# ====== CA key pair

# private key ca-priv-key.pem :
openssl genrsa -out ca-priv-key.pem 2048

# public key " :
openssl req -config /usr/lib/ssl/openssl.cnf -new -key ca-priv-key.pem -x509 -days 1825 -subj '/C=US/ST=Oregon/L=Portland/O=IT/CN=ca' -out ca.pem




# ====== Swarm manager key pair

# private key  ca-priv-key.pem :
openssl genrsa -out swarm-mgr-priv-key.pem 2048


# certificate signing request (CSR) swarm-mgr.csr using the private key 
openssl req -subj "/CN=swarm-mgr" -new -key swarm-mgr-priv-key.pem -out swarm-mgr.csr

# public key ":

# openssl req -config /usr/lib/ssl/openssl.cnf -new -key swarm-mgr-priv-key.pem -x509 -days 1825 -subj '/C=US/ST=Oregon/L=Portland/O=IT/CN=swarm-mgr' -out swarm-mgr.pem

openssl x509 -req -days 1825 -in swarm-mgr.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out swarm-mgr-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf

openssl rsa -in swarm-mgr-priv-key.pem -out swarm-mgr-priv-key.pem






# ======  login node key pair

# private key  ca-priv-key.pem :
openssl genrsa -out login-priv-key.pem 2048


# certificate signing request (CSR) swarm-mgr.csr using the private key 
openssl req -subj "/CN=login" -new -key login-priv-key.pem -out login.csr

# public key ":

# openssl req -config /usr/lib/ssl/openssl.cnf -new -key swarm-mgr-priv-key.pem -x509 -days 1825 -subj '/C=US/ST=Oregon/L=Portland/O=IT/CN=swarm-mgr' -out swarm-mgr.pem

openssl x509 -req -days 1825 -in login.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out login-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf

openssl rsa -in login-priv-key.pem -out login-priv-key.pem







for ii in swarm login `seq 1 $NNODES`
  do
    echo "Hello from node $ii\n"
  done
