#!/bin/bash

# 安装 fail2ban
sudo apt update
sudo apt install fail2ban -y

# 备份原始配置文件
sudo cp /etc/fail2ban/jail.local /etc/fail2ban/jail.local.bak

# 写入 sshd 配置到 jail.local
sudo bash -c 'cat <<EOF >> /etc/fail2ban/jail.local

[sshd]
enabled = true
port = ssh
bantime = 600
findtime = 600
maxretry = 3

EOF'

# 重启 fail2ban 服务
sudo systemctl restart fail2ban.service

# 查看 fail2ban 状态
sudo fail2ban-client status sshd
