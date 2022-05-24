#!/bin/bash

function stop_node_scheduler()
{
  echo "Check cess-boot container status"
  docker ps -a|grep cess-boot
  if [ $? -eq  0 ]; then
    echo "Start stopping the cess-boot container"
    docker stop cess-boot && docker rm cess-boot
    echo "Successfully stopped the cess-boot container"
  else
    echo "cess-boot container has stopped"
  fi
}