# # # compute-ca
FROM phusion/baseimage


RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates debian-keyring debian-archive-keyring openssl && \
    rm -rf /var/lib/apt/lists/*


MKDIR /bin



# cert creation in bash file

COPY bin/generate-certs.sh bin/generate-certs.sh