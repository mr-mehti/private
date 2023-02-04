sudo apt install unzip -y
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh)
mv -f ./pub.crt /usr/local/etc/v2ray/
mv -f ./prv.key /usr/local/etc/v2ray/
systemctl start v2ray && systemctl enable v2ray
mv -f ./config.json /usr/local/etc/v2ray
systemctl restart v2ray
