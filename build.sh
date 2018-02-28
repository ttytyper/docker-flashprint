#!/bin/sh
docker build -t ttytyper/flashprint "$(dirname "$0")" "${@}"
