#! /bin/bash

# ensure the script runs from the directory where it is located
cd "$(dirname "$0")"

source ../common.sh

log INFO "Pulling local repo tarball for testing"
repo_tar=./repo.tar
rm -f "$repo_tar"
repo_tmp_tar=$(mktemp)
tar -cf "$repo_tmp_tar" ../../
mv "$repo_tmp_tar" "$repo_tar"

# build and load the rock
rockcraft pack
rockcraft.skopeo --insecure-policy copy \
    oci-archive:manifest_latest_amd64.rock \
    docker-daemon:manifest:latest

# extract the manifest from the docker image
manifest=$(mktemp)
docker run -it --rm manifest:latest exec busybox cat "/usr/share/rocks/dpkg.query" > "$manifest"

log INFO "Testing manifest exists and is not empty."
test -s "$manifest"

log INFO "Ensure manifest contains expected headers"
grep -P "^# os-release" "$manifest" > /dev/null
grep -P "^# dpkg-query" "$manifest" > /dev/null