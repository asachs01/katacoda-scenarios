#!/bin/sh
# Set up the IP address variable for output at the end of the script
IPADDR=$(/sbin/ip -o -4 addr list enp0s8  | awk '{print $4}' | cut -d/ -f1)

# Install nano and set as default editor
sudo yum install nano -y
export EDITOR=nano

# Install Sensu backend, agent, and sensuctl
curl -s https://packagecloud.io/install/repositories/sensu/stable/script.rpm.sh | sudo bash
sudo apt-get install sensu-go-backend sensu-go-agent sensu-go-cli -y

# Download and copy example configuration files
sudo curl https://docs.sensu.io/sensu-go/5.5/files/agent.yml -o agent.yml
sudo cp agent.yml /etc/sensu/agent.yml
sudo curl https://docs.sensu.io/sensu-go/5.5/files/backend.yml -o backend.yml
sudo cp backend.yml /etc/sensu/backend.yml

# Start Sensu backend
sudo systemctl start sensu-backend
sudo systemctl start sensu-agent

# Configure sensuctl, but wait a sec first to let the computer catch up
sleep 3
sensuctl configure -n --username "admin" --password 'P@ssw0rd!' --url "http://127.0.0.1:8080"  
