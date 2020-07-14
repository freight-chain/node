#!/bin/bash
SERVERS=my-key-manager-2:8443,my-agent:443,my-company.symphony.com:443
TRUSTSTORE_FILENAME=truststore
TRUSTSTORE_PASSWORD=changeit

command -v keytool >/dev/null 2>&1||{ echo >&2 "Please add keytool to \$PATH";exit 1;}

# Download all certificates from all servers
for SERVER in $(echo $SERVERS | sed "s/,/ /g")
do
  HOSTNAME="${SERVER%%:*}"
  openssl s_client -showcerts -verify 5 -connect $SERVER< /dev/null | \
    awk -v h=$HOSTNAME '/BEGIN/,/END/{ if(/BEGIN/){a++}; out=h"-"a-1".crt"; print >out}'
done

# Remove end certificates
rm *-0.crt

# Loop unique list of signing certificates
for cert in `shasum *-*.crt | sort -k1 | uniq -w41 | sort -k2 | awk '{print $2}'`
do
  keytool -import -file $cert -alias $cert -trustcacerts -noprompt \
    -keystore $TRUSTSTORE_FILENAME -storepass $TRUSTSTORE_PASSWORD
done

# Cleanup and verify truststore
# rm *-*.crt
keytool -list -keystore $TRUSTSTORE_FILENAME -storepass $TRUSTSTORE_PASSWORD
