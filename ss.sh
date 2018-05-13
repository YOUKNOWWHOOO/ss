sudo apt update
sudo apt install shadowsocks-libev

sudo nano /etc/shadowsocks-libev/config.json

sudo systemctl start shadowsocks-libev-local@config
sudo systemctl status shadowsocks-libev-local@config

sudo systemctl enable shadowsocks-libev-local@config
