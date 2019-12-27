#  Overview

[Freight Trust](https://freighttrust.com)
[Telegram](https://t.me/freighttrust)
[For a Current List of Bootnodes Read This Google Sheet](https://docs.google.com/spreadsheets/d/1MQkG1gmciT5mw9tdod3sHryRvUxTXBjt7c1fgg9ndQQ/edit?usp=sharing)

This is intended for ensuring you have the correct directory structure along with the valid configuration files
- genesis.json
- static-nodes.json
- auth.toml
- config.toml
node/data

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
If you installed using `homebrew` just run it as `besu`
If you installed using the above links to *Besu 1.3.8* you must append `bin/` to `besu` so that the command reads `bin/besu` in order to run. 
Verify you installed by running `besu --version` or `bin/besu --version` in the *directory*/*folder* that `besu-1.3.8` is located in.

### Clean Install Commands 
#### This uses linuxbrew 
```bash
$ sudo apt update -y
$ sudo apt-get install -y java-common build-essential software-properties-common # curl file git software-properties-common ca-certificates wget gnupg-agent apt-transport-https
$ sudo apt-get update
$ sudo apt-get install -y java-common
$ wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb
$ sudo dpkg -i amazon-corretto-11-x64-linux-jdk.deb
$ sudo apt update
# $ sudo apt install gcc g++ make -y
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile


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
===

enode://35b59bc87330078d687dc769c4b972beb8621fd71f79168b5decca94def69cd8e056340b2fe7e298e80a0904159af5b658602ea38d002fa98099a10eefaae724@3.133.153.14:30303

===
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
