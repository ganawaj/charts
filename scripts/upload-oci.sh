#!/usr/bin/env bash

set -x

# Get current working directory
SCRIPT_DIR=$(cd `dirname $0` && pwd)
TOP_DIR=$(dirname ${SCRIPT_DIR})

cd $TOP_DIR/artifacts

# Upload artificats to Dockerhub
helm registry login git.juanah.com -u ${GITHUB_ACTOR} -p ${PASS}
helm push ${CHART}-${CHART_VERSION}.tgz ${registry}

# Upload artificats to Github
echo $GHCR_PAT | docker login ghcr.io -u <GITHUB-USERNAME> --password-stdin