#!/bin/bash

# use wrapper script as git command
if [ -d "/host/usr/bin" ]; then
    cp /scripts/git-wrapper.sh /host/usr/bin/git
    # make git script runnable
    chmod +x /host/usr/bin/git
fi

# generate SSH key for the host
USER_DIR="/host/root"
if [ -d "$USER_DIR" ]; then
    mkdir -p "$USER_DIR/.ssh"
    if [ ! -f "$USER_DIR/.ssh/id_rsa" ]; then
        IP_ADDRESS=$(ifconfig | grep -Pazo 'eth[0-9]\s+\N+\n\s+inet (addr:)?([0-9]*.){3}[0-9]*' | grep -Eao '([0-9]*\.){3}[0-9]*' | grep -va '127.0.0.1'| head -n1)
        ssh-keygen -t rsa -b 4096 -C "$IP_ADDRESS" -N "" -f "$USER_DIR/.ssh/id_rsa"
    fi
    echo "SSH Public Key:"
    cat "$USER_DIR/.ssh/id_rsa.pub"
fi
