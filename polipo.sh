# http://xuhuan.leanote.com/post/Socks%E4%BB%A3%E7%90%86%E8%BD%AC%E6%8D%A2%E6%88%90HTTP%E4%BB%A3%E7%90%86
sudo apt-get install polipo
# 假设系统已经打开了 socks 代理，可以使用ShadowSocks或者ssd -D 来创建。即有socks5://127.0.0.1:1080可用。
# polipo使用本地的8123 端口进行 HTTP代理。转为http://127.0.0.1:8123进行HTTP代理。
# 执行以下命令快速使用：
sudo polipo socksParentProxy=localhost:1080
# 提示：系统可能提示8123端口已经被占用，查看进程发现polipo已经存在，可以先执行
sudo service polipo stop停止 polipo 进程，然后修改配置文件后再重新执行
sudo service polipo start启动 polipo进程，期间可以执行
sudo tail -f /var/log/polipo/polipo.log查看日志。

/etc/polipo/config
# 添加如下：

# Ubuntu: /etc/polipo/config
daemonise = true
socksParentProxy = "127.0.0.1:1080"
socksProxyType = socks5
# both IPv4 and IPv6: 
# proxyAddress = "::0"
# or IPv4 only
proxyAddress = "0.0.0.0"
proxyPort = 8123

# 然后再次启动 polipo ：
sudo polipo -c /etc/polipo/config

# Polipo Web Interface
# http://localhost:8123/polipo/
# 可以通过此 URL 在浏览器配置 Polipo
