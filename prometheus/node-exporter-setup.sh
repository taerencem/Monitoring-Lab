#!/bin/bash

echo "Installing Node Exporter..."

wget https://github.com/prometheus/node_exporter/releases/latest/download/node_exporter-1.7.0.linux-amd64.tar.gz
tar -xvf node_exporter-*.tar.gz
sudo mv node_exporter*/node_exporter /usr/local/bin/

sudo useradd -rs /bin/false node_exporter

sudo bash -c 'cat > /etc/systemd/system/node_exporter.service <<EOF
[Unit]
Description=Node Exporter

[Service]
User=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
EOF'

sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

echo "Node Exporter installed and running."
