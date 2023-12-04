# private

sudo rm -r ~/private || true && sudo rm -r /usr/local/etc/v2ray || true && sudo apt update && sudo apt install git -y

sudo git clone https://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@github.com/mr-mehti/private.git

cd private && sudo chmod +x install.sh && sudo bash install.sh
