#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: image-verify.sh <image name>"
    exit 1;
fi

IMAGE=$1

echo ">> Verifying image '$IMAGE' can build a project"

mkdir build
docker run --rm -it -v $PWD/build:/pebble $IMAGE new-project test
# Watch the sneaky test volume mount, different from above...
docker run --rm -it -v $PWD/build/test:/pebble $IMAGE clean
docker run --rm -it -v $PWD/build/test:/pebble $IMAGE build