#!/usr/bin/env bash

set -x

until helm push $1 $2; do
    echo "helm push failed retrying ..."
    sleep 1
done