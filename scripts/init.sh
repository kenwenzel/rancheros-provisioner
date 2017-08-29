#!/bin/bash

# use wrapper script as git command
cp /scripts/git-wrapper.sh /host/usr/bin/git
# make git script runnable
chmod +x /host/usr/bin/git
