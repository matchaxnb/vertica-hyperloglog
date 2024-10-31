#!/bin/bash
docker build -t vertica-builder:local .

rm -rf build
mkdir -p build
docker kill vbuilder-hyperloglog || true
docker rm vbuilder-hyperloglog || true
docker run --rm --name vbuilder-hyperloglog -v=$PWD/SOURCES:/sources  -v=$PWD/build:/build -v=/opt/vertica/sdk:/opt/vertica/sdk  -d vertica-builder:local sleep 3600
echo "Run docker exec -ti vbuilder-hyperloglog bash # now"
