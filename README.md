# <img src="header.png" alt="Freight Trust Node" height="60px">

> Freight Trust Besu Node Quickstart Guide and Overview 

## Bootnode

`enode://694c9cdd1a95ea242cf194d6e0738c44379446ed59abe1a34763dd48f700a3edf3f849b5b2127d38202583ec17eecee604d15d3c7bf83a86494c26571507400e@54.226.223.85:30305`

#### Command Line Start
```bash
# This command changes you into the folder for hyperledger besu
$ cd besu-1.3.8

# This command generates your nodes private keys and address
$ bin/besu --data-path=data public-key export-address --to=data/nodeAddres 

# This command creates the gensis.json file
$ nano 

# A window will show now. You will COPY and PASTE the genesis.json file located below, then hit COMMAND+O to WRITE OUT the file. Type genesis.json to save the file as genesis.json 
# Now we start TMUX
# First make sure that we can scroll up in case you have errors!
$ echo 'set -g mouse on' >> ~/.tmux.conf
# start TMUX window
$ tmux
# Now that tmux is running you can start to connect to the network and once you disconnect from the node, it will still be running.

# This command connects you to the network - You can name your identity anything.
bin/besu --data-path=data --genesis-file=genesis.json --p2p-port=30305 --identity=FreightTrustProxy --bootnodes=enode://694c9cdd1a95ea242cf194d6e0738c44379446ed59abe1a34763dd48f700a3edf3f849b5b2127d38202583ec17eecee604d15d3c7bf83a86494c26571507400e@54.226.223.85:30305
```
# Planned upgrade of network (client upgrade)
For most recent testing of planned network upgrade to 1.4.4 besu client please see [network upgrade](https://github.com/freight-chain/network-upgrade)


## [Files](#files)
Install Java 11.0.5 and Besu 1.3.8 (linux files .deb) for other package managers use the Corretto Download Page (e.g. rpm)
[Corretto Java 11.0.5](https://corretto.aws/downloads/resources/11.0.5.10.1/java-11-amazon-corretto-jdk_11.0.5.10-1_amd64.deb)
[Besu 1.3.8](https://bintray.com/api/ui/download/hyperledger-org/besu-repo/besu-1.3.8.tar.gz)

Install Java 11.0.5 and Besu 1.3.8 (mac and windows)
[Corretto Java 11.0.5 Download Page](https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/downloads-list.html)
[Besu 1.3.8 Windows/Mac](https://bintray.com/api/ui/download/hyperledger-org/besu-repo/besu-1.3.8.zip)
[Pegasys Solutions Page](https://pegasys.tech/solutions/hyperledger-besu/)

Install using `unzip besu-1.3.8.zip` or `tar zxvf besu-1.3.8.tar.gz`


#### Genesis File 

```json
{
  "config":{
    "chainId":211,
    "constantinoplefixblock":0,
    "clique":{
      "blockperiodseconds":10,
      "epochlength":600000
    }
  },
  "coinbase":"0x0000000000000000000000000000000000000000",
  "difficulty":"0x1",
"extraData":"0x0000000000000000000000000000000000000000000000000000000000000000ebf35eb8d75ba70f939d2e1269202c60c864432e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  "gasLimit":"0xa00000",
  "mixHash":"0x63746963616c2062797a616e74696e65206661756c7420746f6c6572616e6365",
  "nonce":"0x0",
  "timestamp":"0x5c51a607",
  "alloc": {
      "343676336d43aa00cd8a054f3f7c7a0d3f22fee3": {
        "balance": "0xad78ebc5ac6200000"
      },
      "298c1d624d08a540b680fe3a90e99f0405b6e260": {
        "balance": "900000000000000000000"
      },
      "f4a54b1652799eea9b5c2ba12abf5eaa3ccb2885": {
        "balance": "100000000000000000000"
      },
      "4ea7f4d4fdaccc0c26327468e851c5dfd5446bd2": {
        "balance": "900000000000000000000"
      }
   },
  "number":"0x0",
  "gasUsed":"0x0",
  "parentHash":"0x0000000000000000000000000000000000000000000000000000000000000000"
}
```

## References

[![asciicast](https://asciinema.org/a/9FtsNbMP4KaYOX8n4s4bvb88r.svg)](https://asciinema.org/a/9FtsNbMP4KaYOX8n4s4bvb88r)

[Freight Trust](https://freighttrust.com)
[Telegram](https://t.me/freighttrust)
[For a Current List of Bootnodes Read This Google Sheet](https://docs.google.com/spreadsheets/d/1MQkG1gmciT5mw9tdod3sHryRvUxTXBjt7c1fgg9ndQQ/edit?usp=sharing)

This is intended for ensuring you have the correct directory structure along with the valid configuration files
- genesis.json
- static-nodes.json
- auth.toml
- config.toml
node/data


### Already Installed Hyperledger/Besu
If you already have Hyperledger/Besu installed, simply
```bash
git clone https://github.com/freight-chain/node.git
cd node
besu --data-path=data public-key export-address --to=data/nodeAddres
besu --data-path=data --genesis-file=genesis.json --config-file=config.toml --p2p-port=30303 --rpc-http-enabled --rpc-http-api=ETH,NET,CLIQUE --host-whitelist="*" --rpc-http-cors-origins="all" --rpc-http-port=8545
```
Always `git pull` to make sure you have the latest `config.toml` file. 

### Abstract
The intent of this guide is to get you to connect to the dry-run network on your personal computer. Having a GUI will help those unfamiliar with using the command line. Please note that this is written from the perspective of a Mac OS X user, and we are working on fixing any Windows issues.

Where you see /home/user/ for windows it would be C:\Home\User


## [Files](#files)
Install Java 11.0.5 and Besu 1.3.8 (linux files .deb) for other package managers use the Corretto Download Page (e.g. rpm)
[Corretto Java 11.0.5](https://corretto.aws/downloads/resources/11.0.5.10.1/java-11-amazon-corretto-jdk_11.0.5.10-1_amd64.deb)
[Besu 1.3.8](https://bintray.com/api/ui/download/hyperledger-org/besu-repo/besu-1.3.8.tar.gz)

Install Java 11.0.5 and Besu 1.3.8 (mac and windows)
[Corretto Java 11.0.5 Download Page](https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/downloads-list.html)
[Besu 1.3.8 Windows/Mac](https://bintray.com/api/ui/download/hyperledger-org/besu-repo/besu-1.3.8.zip)
[Pegasys Solutions Page](https://pegasys.tech/solutions/hyperledger-besu/)

Install using `unzip besu-1.3.8.zip` or `tar zxvf besu-1.3.8.tar.gz`

**<!> Running below 1.3.8 is not supported <!>**

## Notes
If you installed using `homebrew` just run it as `besu` (Mac OS Only)
If you installed using the above links to *Besu 1.3.8* you must append `bin/` to `besu` so that the command reads `bin/besu` in order to run. 
Verify you installed by running `besu --version` or `bin/besu --version` in the *directory*/*folder* that `besu-1.3.8` is located in.

### Clean Install Commands 

```bash
$ sudo apt update -y
$ sudo apt-get install -y java-common build-essential software-properties-common # curl file git software-properties-common ca-certificates wget gnupg-agent apt-transport-https
$ sudo apt-get update
$ sudo apt-get install -y java-common
$ wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb
$ sudo dpkg -i amazon-corretto-11-x64-linux-jdk.deb
$ sudo apt update
// Removed Linuxbrew, no longer supporting this install method

$ sudo yum -y install ntp || true
$ sudo apt-get --assume-yes install ntp || true

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

$ sudo apt upgrade

$ brew tap hyperledger/besu
$ brew install besu
$ git clone https://github.com/freight-chain/node.git
$ cd node
$ besu --data-path=data public-key export-address --to=data/nodeAddress
```

```bash
nohup besu --data-path=data --genesis-file=genesis.json --p2p-port=30303 --rpc-http-enabled --rpc-http-api=ETH,NET,CLIQUE --host-whitelist="*" --rpc-http-cors-origins="all" --rpc-http-port=8545 > /home/ubuntu/ft-node-log 2>&1 &
```
---

(c) 2020 - FreightTrust & Clearing Corporation . All Rights Reserved of their respective owners.
