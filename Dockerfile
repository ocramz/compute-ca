# # # compute-ca
FROM ocramz/docker-phusion-supervisor

ENV NNODES 3


RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates debian-keyring debian-archive-keyring openssl && \
    rm -rf /var/lib/apt/lists/*


RUN mkdir -p /bin



# cert creation in bash file

COPY bin/generate-certs.sh bin/generate-certs.sh

# RUN bin/generate-certs.sh 3

RUN ls -lsA

CMD ["/bin/bash", "-c", "bin/generate-certs.sh", "${NNODES}"]