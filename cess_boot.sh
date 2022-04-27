#!/bin/bash
rootdir=$(cd `dirname $0`;pwd)
loggerdir=$rootdir/logger
source $loggerdir/logger.sh

# sudo permissions
if [ $(id -u) -ne 0 ]; then
    echo "Please run with sudo!"
    exit 1
fi

help()
{
cat << EOF
Usage:
    help                            show help information
	--update                        Update the system and install dependencies
    --install                       install cess-bucket
    --uninstall                     uninstall cess-bucket
EOF
exit 0
}

install_depenencies()
{
    if [ x"$update" == x"true" ]; then
		log_info "------------Apt update--------------"
		apt-get update
		if [ $? -ne 0 ]; then
			log_err "Apt update failed"
			exit 1
		fi
    fi

    log_info "------------Install depenencies--------------"
    apt install -y ocl-icd-* gcc git curl wget libhwloc* wget util-linux

    if [ $? -ne 0 ]; then
        log_err "Install libs failed"
        exit 1
    fi
	sysctl -w net.ipv4.tcp_syncookies = 1
	sysctl -w net.ipv4.tcp_tw_reuse = 1
	sysctl -w net.ipv4.tcp_tw_recycle = 1
	sysctl -w net.ipv4.tcp_fin_timeout = 30
	sysctl -w net.ipv4.tcp_keepalive_time = 120
    sysctl -w net.core.rmem_max=2500000
	sysctl -w net.ipv4.ip_local_port_range = 1024 65530
}

update="false"
action=""
while true ; do
    case "$1" in
        --install)
            # TODO
            action=$1
            break;
            ;;
		--uninstall)
            # TODO
            action=$1
            break;
            ;;
		--update)
            # TODO
            action=$1
			update="true"
            break;
            ;;
        *)
            help
            break;
            ;;
    esac
done
