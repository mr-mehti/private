#!/bin/bash

# Fix User Configuration in v2ray.service
echo "🔧 Fixing V2Ray user configuration in v2ray.service..."

# Check if v2ray.service exists
SERVICE_FILE="/etc/systemd/system/v2ray.service"
if [ ! -f "$SERVICE_FILE" ]; then
    echo "❌ Error: $SERVICE_FILE not found!"
    exit 1
fi

# Replace 'nobody' with 'v2ray' in the service file
sudo sed -i 's/User=nobody/User=v2ray/' "$SERVICE_FILE"
sudo sed -i 's/Group=nobody/Group=v2ray/' "$SERVICE_FILE"

echo "✅ User and group updated to 'v2ray' in $SERVICE_FILE."

# Create v2ray user and group if not exists
if ! id -u v2ray >/dev/null 2>&1; then
    sudo useradd -r -s /bin/false v2ray
    echo "✅ Created user 'v2ray'."
fi

if ! getent group v2ray >/dev/null 2>&1; then
    sudo groupadd v2ray
    echo "✅ Created group 'v2ray'."
fi

# Set ownership of V2Ray directories
echo "🔑 Setting ownership permissions for V2Ray directories..."
sudo chown -R v2ray:v2ray /usr/local/etc/v2ray
sudo chown -R v2ray:v2ray /var/log/v2ray
sudo chown -R v2ray:v2ray /usr/local/bin/v2ray

# Set permissions
sudo chmod -R 755 /usr/local/etc/v2ray
sudo chmod -R 755 /var/log/v2ray
sudo chmod +x /usr/local/bin/v2ray

echo "✅ Ownership and permissions set."

# Reload systemd and restart V2Ray
echo "🔄 Reloading systemd and restarting V2Ray service..."
sudo systemctl daemon-reload
sudo systemctl restart v2ray

# Check V2Ray status
echo "📋 Checking V2Ray service status..."
sudo systemctl status v2ray --no-pager

echo "🚀 V2Ray user configuration fix completed!"
