#! /bin/bash

cd "$(dirname "$0")"
source ./common.sh

for test in $(find . -name run.sh); do
    log INFO "Running test: $test"
    $test
done