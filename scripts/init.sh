#!/bin/bash

echo "Initialize GIT on host."

# use wrapper script as git command
if [ -d "/host/usr/bin" ]; then
    cp /scripts/git-wrapper.sh /host/usr/bin/git
    # make git script runnable
    chmod +x /host/usr/bin/git
fi

GIT_CONFIG_DIR="/host/root"
# initialize git config from environment variable
if [ -d "$GIT_CONFIG_DIR" ] && [ ! -f "$GIT_CONFIG_DIR/.gitconfig" ] && [ -n "$GIT_CONFIG_DEFAULT" ] ; then
	echo "$GIT_CONFIG_DEFAULT" > "$GIT_CONFIG_DIR/.gitconfig"
fi
