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

# Install Elasticsearch
apt-get update && apt-get install elasticsearch -y

# Reload services
systemctl daemon-reload

# Enable elasticsearch service
systemctl enable elasticsearch

# Start elasticsearch service
systemctl start elasticsearch

# Copy edited elasticsearch yaml file
cp /vagrant/conf/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

# Restart elasticsearch
systemctl restart elasticsearch

sleep 5

# Install Kibana
apt-get install kibana -y

# Start service
cp /vagrant/conf/kibana.yml /etc/kibana/kibana.yml
systemctl daemon-reload
systemctl enable kibana
systemctl start kibana

# Install Filebeat

apt-get install filebeat -y

# Configure Filebeat
systemctl daemon-reload
systemctl enable filebeat
filebeat modules enable system
cp /vagrant/conf/filebeat.yml /etc/filebeat/filebeat.yml
systemctl start filebeat