# Quick Start Guide

This guide is for running on your home computer for understanding before you get into operating your servers. We have trimmed down everything to the basic stuff.

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
$ sudo apt-get install -y java-common build-essential curl file git software-properties-common ca-certificates wget gnupg-agent apt-transport-https
$ wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb
$ sudo dpkg -i amazon-corretto-11-x64-linux-jdk.deb

$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

brew tap hyperledger/besu
git clone https://github.com/freight-chain/node.git
cd node
besu --data-path=data public-key export-address --to=data/nodeAddress
```