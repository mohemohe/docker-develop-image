#!/bin/sh
docker run \
       --rm \
       -it \
       -e UID="$UID" \
       -e GID="$GID" \
       -e USER="$(whoami)" \
       -v /var/run/docker.sock:/var/run/docker.sock \
       -v "${HOME}/.ssh:/home/$(whoami)/.ssh" \
       -v "${HOME}/.aws:/home/$(whoami)/.aws" \
       dev
