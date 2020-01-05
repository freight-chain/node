ARG BESU_VERSION=1.3.8

FROM hyperledger/besu:$BESU_VERSION

ENV BESU_OPTS=''

# Copy new entrypoint scripts
COPY start.sh /opt/besu/
# Copy genesis template
COPY genesis.json /var/lib/besu/

# Install a dos 2 unix EOL converter (supporting either alpine or ubuntu images)
RUN (apt-get update && apt-get install dos2unix curl wget git || apk add --update dos2unix) && \
    rm -rf /var/cache/apt/* && rm -rf /var/cache/apk/*

# Run dos2unix EOL conversion on all shell scripts to prevent scripts to fail if edited with a windows IDE
# that rewrote the EOL to CRLF before we build the image. See issue #4
RUN find /opt/besu/*.sh -type f -print0 | xargs -0 dos2unix

# specify default entrypoint to start the node
ENTRYPOINT ["/opt/besu/start.sh"]
