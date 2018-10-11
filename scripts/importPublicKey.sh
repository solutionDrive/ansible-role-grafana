#!/usr/bin/env bash

echo "${PUBLIC_KEY}" >> ~/.ssh/authorized_keys
passwd -d root
chown root:root /root/.ssh/authorized_keys

apt-get update
apt-get install -y python
apt-get install -y python3
apt-get install -y gpg

/usr/sbin/sshd -D
