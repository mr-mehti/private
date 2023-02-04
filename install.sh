set -e
sudo apt update || true
sudo apt install unzip -y || true
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh)
mkdir /usr/local/etc/v2ray/ || true
sudo mv -f ~/private/pub.crt /usr/local/etc/v2ray/ || true
sudo mv -f ~/private/prv.key /usr/local/etc/v2ray/ || true
systemctl start v2ray && systemctl enable v2ray
mv -f ./config.json /usr/local/etc/v2ray || true
chmod +x ./bbr.sh && sudo bash ./bbr.sh && sudo ufw disable || true
systemctl restart v2ray
