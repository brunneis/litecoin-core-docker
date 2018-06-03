#!/bin/bash
docker run -d \
-v "$(pwd)"/litecoin-data:/root/.litecoin \
--name litecoin-core \
-p 8333:8333 \
--restart always \
brunneis/litecoin-core
