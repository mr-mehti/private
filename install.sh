set -e
EXIT_CODE=0
command || EXIT_CODE=$?
echo $EXIT_CODE
sudo apt install unzip -y
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh)
rm /usr/local/etc/v2ray/ -r
mkdir /usr/local/etc/v2ray/
sudo mv -f ~/private/pub.crt /usr/local/etc/v2ray/
sudo mv -f ~/private/prv.key /usr/local/etc/v2ray/
systemctl start v2ray && systemctl enable v2ray
mv -f ./config.json /usr/local/etc/v2ray
systemctl restart v2ray
