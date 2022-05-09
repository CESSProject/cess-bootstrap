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
    --install                       install cess
    --uninstall                     uninstall cess
EOF
exit 0
}

get_sys_name()
{
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        DISTRO='Aliyun'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
    else
        DISTRO='unknow'
    fi
    echo $DISTRO;
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

start_node()
{
    # Determine whether cess-node exists
    if [ ! -f "./node/cess-node" ]; then
        log_err $rootdir"/node/cess-node does not exist"
        exit 1
    fi
    
}

while true ; do
    case "$1" in
        --install)
            # TODO
            break;
            ;;
		--uninstall)
            # TODO
            break;
            ;;
		--update)
            # TODO
            break;
            ;;
        *)
            help
            break;
            ;;
    esac
done
