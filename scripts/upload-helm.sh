#!/usr/bin/env bash

set -x

# Get current working directory
SCRIPT_DIR=$(cd `dirname $0` && pwd)
TOP_DIR=$(dirname ${SCRIPT_DIR})
ARTIFACT_DIR=$TOP_DIR/artifacts

cd $ARTIFACT_DIR

helm registry login \
  -u $USER \
  -p $PASS \
  https://registry-1.docker.io

helm push $CHART $REGISTRY --debug

# until helm push $CHART $REGISTRY; do
#     echo "helm push failed retrying ..."
#     sleep 1
# done