#!/bin/bash

if [ "$HOME" == "/" ]; then
    HOME="/root"
fi

WORKDIR=$(pwd)
WORKDIR="${WORKDIR:-"/tmp"}"
DOCKER_ARGS=()
ARGS=()

lastArg="${@: -1}"

# iterate arguments
while test ${#} -gt 0
do
    if [ "$1" == "--work-tree" ]; then
      # mount work-tree
      shift
      WORKDIR="$1"
    elif [ "$1" == "--git-dir" ]; then
      # TODO support mounting of git-dir, ignored at the moment
      shift
    else
      ARGS+=("$1")
    fi
    shift
done

# git clone:
# if last argument is a directory then mount it as volume
if [ -d "$lastArg" ]; then
    DOCKER_ARGS+=(-v "$lastArg:$lastArg")
elif [ -d $(dirname "$lastArg") ]; then
    dir=$(dirname "$lastArg")
    DOCKER_ARGS+=(-v "$dir:$dir")
fi

# echo RUN: docker run -i --rm -v ${HOME}:/root -v ${WORKDIR}:/git "${DOCKER_ARGS[@]}" alpine/git "${ARGS[@]}" >> /tmp/git.log

docker run -i --rm -v ${HOME}:/root -v ${WORKDIR}:/git "${DOCKER_ARGS[@]}" alpine/git "${ARGS[@]}"
