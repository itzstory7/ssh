#!/bin/bash

echo "Port 34000" >> /etc/ssh/sshd_config

iptables -P INPUT ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 34000 -j DROP
iptables -I INPUT -s 89.163.132.56 -p tcp -m tcp --dport 34000 -j ACCEPT
iptables -I INPUT -s 46.99.0.0/16 -p tcp -m tcp --dport 34000 -j ACCEPT
iptables -I INPUT -s 46.99.0.0/18 -p tcp -m tcp --dport 34000 -j ACCEPT
iptables -I INPUT -s 46.99.202.0/23 -p tcp -m tcp --dport 34000 -j ACCEPT
iptables -I INPUT -s 46.99.249.0/24 -p tcp -m tcp --dport 34000 -j ACCEPT
iptables -I INPUT -s 46.99.64.0/18 -p tcp -m tcp --dport 34000 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 53 -j ACCEPT
iptables -I OUTPUT -p tcp -m tcp --dport 53 -j ACCEPT
iptables -I INPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -I OUTPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -I INPUT -s 149.28.43.230 -p tcp -m tcp --dport 27015:27030 -j ACCEPT
iptables -I INPUT -s 45.77.96.90 -p tcp -m tcp --dport 27015:27030 -j ACCEPT
iptables -I INPUT -s 108.61.78.150 -p tcp -m tcp --dport 27015:27030 -j ACCEPT
iptables -I INPUT -s 108.61.78.149 -p tcp -m tcp --dport 27015:27030 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 21 -j ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -I OUTPUT -j ACCEPT
iptables -I FORWARD -j ACCEPT
iptables -I INPUT -s 89.163.132.56 -j ACCEPT
iptables -I INPUT -s 217.17.187.41 -j ACCEPT
iptables -I INPUT -s 62.141.38.170 -j ACCEPT
iptables -I INPUT -s 185.222.00.00/9 -j ACCEPT
iptables -I INPUT -s 217.79.187.41 -j ACCEPT
iptables -I INPUT -p udp -m udp --dport 27015:27030 -j ACCEPT
iptables-save
service sshd restart
clear

echo "Done"
