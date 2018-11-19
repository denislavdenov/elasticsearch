# Elasticsearch demo

### This is a sample repo showing how to ship logs with Logstash and Filebeat to Elasticsearch and then visualise with Kibana

## Prerequirements: 
- You need to have Vagrant installed and have some basic knowledge working with.
- At least 8GB RAM

### Vagrantfile
We are creating 3 Virtual machines named `elastic`, `nginx` and `mysql`

- elastic VM contains: Kibana software, Elasticsearch software and Filebeat software - *We are using filebeat to monitor all logs on the system and send them to Elasticsearch software*


- nginx VM contains: Nginx server and Logstash software - *We are using Logstash to ship nginx server logs to Elasticsearch software*

- mysql VM contains: Mysql server and Logstash software - *Currently database server is not actively working, but Logstash is set to monitor the syslog where database events are stored and ship them to Elastic search*

After all logs are shiped to Elasticsearch and indexed, we are using Kibana to visualise them.    
Servers are connected like shown on below grahp:

<img src="screenshots/graph.png" width="500" height="300" />

## Provisioning
All 3 VMs are provisioned with the 3 scripts (one for each VM) placed inside the `scripts` folder.

Using them all needed software is installed, some configurations files (stored in `conf` folder) are replaced in order to configure the software.

## How to use:
- Fork this repo, clone it and navigate to the folder

- Do `vagrant up` and wait until provisioning is over

- System logs from Elastic and Mysql VMs are already ingested in the system

- For NGINX, you can simulate load in the following way:

   Open `localhost:8080` and that will generate a response code 200.    
   Open `localhost:8080/something` that will generate response code 404.
   
- Now you can open Kibana located on localhost:5601
   
   At fist you will be asked to create index patterns based on the indicies that Kibana has received from Elasticsearch
   
   Below you can see that there is indices for mysql,nginx and the system logs from Filebeat
   Index pattern should match part of the name seen below
   
   <img src="screenshots/index.png" width="1000" height="500" />
   
- Now you can go to `Visualize` and create some Visualizatons, for example:
   Create a Pie chart to check what is the count of response codes for your Ngninx server.

- Save your visualizations and go to Dashboard - create new and import your saved visualization into the Dashboard.
   Now you can make some connections toward your nginx server and watch in almost real time how graphs are changing, depending on your refresh interval.
   
<img src="screenshots/kibana.png" width="1000" height="500" />   
   
   
