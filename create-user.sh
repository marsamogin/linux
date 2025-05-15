#!/bin/bash
useradd -d /home/keite keite
usermod -aG wheel keite
mkdir /home/keite/.ssh
touch /home/keite/.ssh/authorized_keys
chown -R keite:keite /home/keite/.ssh
chmod 700 /home/keite/.ssh
chmod 600 /home/keite/.ssh/authorized_keys
