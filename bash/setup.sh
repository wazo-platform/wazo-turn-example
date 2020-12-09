#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
    coturn \
    coreutils  # tee

sudo cp /vagrant/turnserver.conf /etc/turnserver.conf

sudo mkdir -p /usr/lib/systemd/system/coturn.service.d/
cat <<EOF | sudo tee /usr/lib/systemd/system/coturn.service.d/bind.conf
[Service]
# Allow binding coturn on ports < 1024, but it doesn't seems to work with Coturn
# AmbientCapabilities=CAP_NET_BIND_SERVICE
# Hence running with root user
User=root
Group=root
EOF

sudo systemctl daemon-reload
sudo systemctl restart coturn.service
