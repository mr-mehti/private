#!/bin/bash

echo "🔧 Configuring V2Ray service to auto-restart on failure..."

# Define service file location
SERVICE_FILE="/etc/systemd/system/v2ray.service"

# Check if service file exists
if [ ! -f "$SERVICE_FILE" ]; then
    echo "❌ Error: $SERVICE_FILE not found!"
    exit 1
fi

# Backup the original service file
sudo cp "$SERVICE_FILE" "$SERVICE_FILE.bak"
echo "💾 Backup of the original service file created at $SERVICE_FILE.bak"

# Configure the service file with auto-restart options
sudo sed -i '/\[Service\]/a Restart=always' "$SERVICE_FILE"
sudo sed -i '/\[Service\]/a RestartSec=5s' "$SERVICE_FILE"
sudo sed -i '/\[Service\]/a StartLimitBurst=5' "$SERVICE_FILE"
sudo sed -i '/\[Service\]/a StartLimitIntervalSec=30' "$SERVICE_FILE"

echo "✅ Restart options added to $SERVICE_FILE"

# Reload systemd and restart the service
sudo systemctl daemon-reload
sudo systemctl restart v2ray
echo "🔄 Systemd reloaded and V2Ray service restarted"

# Enable the service to start on boot
sudo systemctl enable v2ray
echo "🚀 V2Ray service enabled to start on boot"

# Show service status
sudo systemctl status v2ray --no-pager

echo "✅ V2Ray auto-restart configuration completed!"
