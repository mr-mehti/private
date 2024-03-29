# private

sudo rm -r ~/private || true && sudo rm -r /usr/local/etc/v2ray || true && sudo apt update && sudo apt install git -y

sudo git clone https://github.com/mr-mehti/private.git

cd private && sudo chmod +x install.sh && sudo bash install.sh
