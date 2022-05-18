#!/bin/bash

function stop_node_scheduler()
{
  docker stop cess-boot && docker rm cess-boot
}