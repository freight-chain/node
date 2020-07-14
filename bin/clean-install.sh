 #!/bin/bash 

 #<!-- INSTALL JAVA -->
sudo apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales java-common build-essential 

 #<!-- INSTALL JAVA: GPG KEYS -->
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9

 #<!-- INSTALL JAVA: AZUL REPO -->
sudo apt-add-repository "deb http://repos.azulsystems.com/ubuntu stable main"

 #<!-- INSTALL JAVA: INSTALL JAVA FINALLY -->
sudo apt-get -qq -y --no-install-recommends install zulu-11=11.39+15
export JAVA_HOME=/usr/lib/jvm/zulu-11

 #<!-- WARM UP THE JVM -->


# <!-- CERTIFICATE -->
sudo apt-get install build-essential libssl-dev openssl -y

# <!-- CERTIFICATE GEN -->
# <!-- DO NOT INCREASE THE BIT VALUE -->
openssl genrsa 2048 > private-key.pem

openssl req -new -x509 -nodes -sha256 -days 365 -key private-key.pem -outform PEM -out certificate.pem


 #<!-- NETWORK TIME PROTOCOL CONFIG -->
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

 #<!-- EDGE CASES -->
sudo sysctl -w vm.max_map_count=262144
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
sudo chown -R $USER:$(id -gn $USER) /home/ubuntu/.config


 #<!-- HYPERLEDGER BESU -->
wget https://dl.bintray.com/hyperledger-org/besu-repo/:besu-1.5.tar.gz

 #<!-- LOAD THE CONFIG -->

. ./.env
. ./.common.sh