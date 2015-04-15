#!/bin/bash
#
# CIS 10.2 Disable System Accounts
#
# NOTE: Evaluate your infrastructure first before using this script!
# Disable all users(except root, shutdown, halt & sync) with UIDs < 500

for user in `awk -F: '($3 < 500) {print $1 }' /etc/passwd`; do
    if [ $user != "root" ]; then
        /usr/sbin/usermod -L $user
        if [ $user != "sync" ] && [ $user != "shutdown" ] && [ $user != "halt" ]; then
            /usr/sbin/usermod -s /usr/sbin/nologin $user
        fi
    fi
done
