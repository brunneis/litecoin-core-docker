#!/bin/bash

LITECOIN_CORE_VERSION=$(cat LITECOIN_CORE_VERSION)
TAGS=(latest $(echo $LITECOIN_CORE_VERSION | cut -d '.' -f 1,2) $LITECOIN_CORE_VERSION $LITECOIN_CORE_VERSION-ubuntu $LITECOIN_CORE_VERSION-ubuntu-18.04 $LITECOIN_CORE_VERSION-ubuntu-bionic)

for tag in ${TAGS[@]}
    do
        docker build --build-arg LITECOIN_CORE_VERSION=$LITECOIN_CORE_VERSION -t brunneis/litecoin-core:$tag .
        docker push brunneis/litecoin-core:$tag
    done
