#!/bin/bash

sudo apt-get install -y java-common build-essential software-properties-common
wget https://corretto.aws/downloads/resources/11.0.7.10.1/java-11-amazon-corretto-jdk_11.0.7.10-1_amd64.deb
sudo dpkg -i java-11-amazon-corretto-jdk_11.0.7.10-1_amd64.deb

sudo apt-get --assume-yes install ntp || true

sudo sed -i '/^server/d' /etc/ntp.conf
sudo tee -a /etc/ntp.conf << EOF
server time1.google.com iburst
server time2.google.com iburst
server time3.google.com iburst
server time4.google.com iburst
EOF

sudo systemctl restart ntp &> /dev/null || true
sudo systemctl restart ntpd &> /dev/null || true
sudo service ntp restart &> /dev/null || true
sudo service ntpd restart &> /dev/null || true
sudo restart ntp &> /dev/null || true
sudo restart ntpd &> /dev/null || true
ntpq -p

sudo apt update -y
sudo apt-get update -y

wget https://dl.bintray.com/hyperledger-org/besu-repo/besu-1.4.5.tar.gz
tar xzvf besu-1.4.5.tar.gz
cd besu-1.4.5
wget https://raw.githubusercontent.com/freight-chain/node/master/genesis.json

bin/besu --data-path=data public-key export-address --to=data/nodeAddress
bin/besu --data-path=data --genesis-file=genesis.json --p2p-port=30305 --identity=FreightTrustProxy --bootnodes=enode://694c9cdd1a95ea242cf194d6e0738c44379446ed59abe1a34763dd48f700a3edf3f849b5b2127d38202583ec17eecee604d15d3c7bf83a86494c26571507400e@54.226.223.85:30305
