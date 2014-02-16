#!/bin/bash
# Starts up the HipHop Virtual Machine within the container.

# Stop on error
set -e

DATA_DIR=/data

(cd $DATA_DIR; \
    hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000)
