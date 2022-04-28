#!/bin/bash

function log_info()
{
    printf "\033[0;33m$1\033[0m\n" "$1"
}

function log_suc()
{
    printf "\033[0;32m$1\033[0m\n" "$1"
}

function log_err()
{
    printf "\033[0;31m$2\033[0m\n" "[ERROR] $1"
}
