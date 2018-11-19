#!/usr/bin/env bash

# Update the system
apt-get update -y
#apt-get upgrade -y

# Install vim
apt-get install vim -y

# Install java
apt-get install openjdk-8-jdk -y

# Download and install the public key required for Elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# You may need to install the apt-transport-https package on Debian before proceeding
apt-get install apt-transport-https -y

# Save the repository definition to /etc/apt/sources.list.d/elastic-6.x.list:
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list

# Install Logstash

apt-get update && apt-get install logstash -y

# Configure Logstash
systemctl daemon-reload
systemctl enable logstash
cp /vagrant/conf/logstash_mysql.conf /etc/logstash/conf.d/logstash_mysql.conf
systemctl start logstash
#/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/logstash1.conf

# Start the log collecting

cp /vagrant/conf/collect-logs_mysql.service /etc/systemd/system/collect-logs_mysql.service
systemctl daemon-reload
systemctl enable collect-logs_mysql.service
systemctl start collect-logs_mysql.service