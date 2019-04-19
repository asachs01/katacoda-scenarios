#!/bin/sh
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
