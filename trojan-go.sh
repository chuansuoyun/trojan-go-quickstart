#!/bin/bash

_INSTALL(){
	if [ -f /etc/centos-release ]; then
		yum install -y wget curl zip
	else
		apt install -y wget curl zip
	fi
	mkdir /etc/trojan-go
	mkdir /usr/lib/trojan-go
	wget -N --no-check-certificate https://github.com/chuansuoyun/trojan-go-quickstart/files/7047062/trojan-go-windows-amd64.zip && unzip -d /usr/lib/trojan-go/ ./trojan-go-linux-amd64.zip && mv /usr/lib/trojan-go/trojan-go /usr/bin/ && chmod +x /usr/bin/trojan-go && rm -rf ./trojan-go-linux-amd64.zip
	cp /usr/lib/trojan-go/example/server.json /etc/trojan-go/config.json
	cp /usr/lib/trojan-go/example/trojan-go.service /etc/systemd/system/trojan-go.service
	systemctl daemon-reload
	systemctl enable trojan-go
	echo Done!
}

_INSTALL
