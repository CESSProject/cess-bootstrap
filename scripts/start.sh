#!/bin/bash

function start_all()
{
    # Determine whether cess-node exists
    if [ ! -f ""$nodedir"/cess-node" ] && [ ! -f ""$nodedir"/secretKey1.txt" ]; then
        log_err ""$nodedir"/cess-node incomplete"
        exit 1
    fi

    if [ ! -f ""$schedulerdir"/scheduler" ] && [ ! -f ""$schedulerdir"/conf.toml" ]; then
            log_err ""$schedulerdir"/scheduler incomplete"
            exit 1
    fi
    if [ ${DataDir: -1} = / ]; then
            echo
    else
            DataDir="$DataDir/"
    fi
    docker pull cesslab/cess-boot:0.1.5
    docker run -itd --name cess-boot --network host \
    -v $DataDir:/root/scheduler_data \
    -v $nodedir/:/root/node \
    -v $schedulerdir/:/root/scheduler \
    -v $installdir/log/:/root/log \
    cesslab/cess-boot:0.1.5
}
