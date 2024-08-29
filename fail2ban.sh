#!/bin/bash

# 安装 fail2ban
sudo apt install fail2ban -y


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
systemctl restart fail2ban.service

# 查看 fail2ban 状态
sudo fail2ban status sshd
