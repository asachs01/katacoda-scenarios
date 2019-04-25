#!/bin/sh
# Install Sensu backend, agent, and sensuctl
curl -s https://packagecloud.io/install/repositories/sensu/stable/script.deb.sh | sudo bash
sudo apt-get install sensu-go-backend sensu-go-agent sensu-go-cli bc -y

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

# Install a basic CPU check script
sudo curl https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-cpu-checks/03a99bab0237c81121ce702b0c5a5a3b44908535/bin/check-cpu.sh \
-o /usr/local/bin/check-cpu.sh && \
sudo chmod +x /usr/local/bin/check-cpu.sh

cat <<EOF > /etc/sensu/check-cpu.yaml
api_version: core/v2
type: CheckConfig
metadata:
  namespace: default
  name: check-cpu
spec:   
  command: check-cpu.sh -w 75 -c 90
  subscriptions:
  - system
  handlers:
  - slack
  publish: true
  interval: 60
EOF
