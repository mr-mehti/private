set -e
sudo apt update || true
sudo apt install unzip -y || true
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh)
mkdir /usr/local/etc/v2ray/ || true
chmod +x ./pub.crt && chmod +x ./prv.key && chmod +x ./default|| true
sudo mv -f ./pub.crt /usr/local/etc/v2ray/ || true
sudo mv -f ./prv.key /usr/local/etc/v2ray/ || true
systemctl start v2ray && systemctl enable v2ray
sudo mv -f ./config.json /usr/local/etc/v2ray || true
chmod +x ./bbr.sh && sudo bash ./bbr.sh && sudo ufw disable || true
systemctl restart v2ray
sudo apt install nginx-full -y || true
sudo mv -f ./default /etc/nginx/sites-enabled || true
sudo systemctl restart nginx || true
