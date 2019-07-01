#!/bin/sh
docker run --rm -it -e UID="$UID" -e GID="$GID" -e USER="$(whoami)" -v /var/run/docker.sock:/var/run/docker.sock dev
