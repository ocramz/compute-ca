# # # compute-ca
FROM phusion/baseimage


RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates debian-keyring debian-archive-keyring scp openssl