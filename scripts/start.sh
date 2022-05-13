#!/bin/bash

function start_node()
{
    # Determine whether cess-node exists
    if [ ! -f ""$nodedir"/cess-node" ]; then
        log_err ""$nodedir"/cess-node does not exist"
        exit 1
    fi
    docker pull cesslab/cess-testnet
    docker run -itd --name=cess --network=host cesslab/cess_testnet:0.3.0 && docker logs -f cess
}

function start_scheduler()
{
  echo "start scheduler"
}