#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: verify-image.sh <image name>"
    exit 1;
fi

IMAGE=$1

echo ">> Verifying image '$IMAGE' can build a project"

mkdir build
echo ">> Image Pebble SDK version"
docker run --rm -it -v $PWD/build:/pebble $IMAGE --version
echo ">> Creating test project"
docker run --rm -it -v $PWD/build:/pebble $IMAGE new-project test
# Watch the sneaky test volume mount, different from above...
echo ">> Cleaning test project"
docker run --rm -it -v $PWD/build/test:/pebble $IMAGE clean
echo ">> Building test project"
docker run --rm -it -v $PWD/build/test:/pebble $IMAGE build