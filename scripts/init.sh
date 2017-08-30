#!/bin/bash

echo "Initialize GIT and SSH keys on host."

# use wrapper script as git command
if [ -d "/host/usr/bin" ]; then
    cp /scripts/git-wrapper.sh /host/usr/bin/git
    # make git script runnable
    chmod +x /host/usr/bin/git
fi
