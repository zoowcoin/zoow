#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-zoowpay/zoowd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/zoowd docker/bin/
cp $BUILD_DIR/src/zoow-cli docker/bin/
cp $BUILD_DIR/src/zoow-tx docker/bin/
strip docker/bin/zoowd
strip docker/bin/zoow-cli
strip docker/bin/zoow-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
