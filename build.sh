#!/bin/sh
export DOCKER_BUILDKIT=0
docker build --tag dev . "$@"
