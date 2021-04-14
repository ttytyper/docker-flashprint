#!/bin/sh
docker build --network=host -t ttytyper/docker-flashprint "$(dirname "$0")" "${@}"
