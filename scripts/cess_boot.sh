#!/bin/bash

installdir=/opt/cess
scriptdir=$installdir/scripts
nodedir=$installdir/node

source $scriptdir/logger.sh
source $scriptdir/install.sh
source $scriptdir/start.sh
source $scriptdir/stop.sh
source $scriptdir/uninstall.sh
source $scriptdir/update.sh

DISTRO=""
# sudo permissions
if [ $(id -u) -ne 0 ]; then
    echo "Please run with sudo!"
    exit 1
fi

function cess_help()
{
cat << EOF
Usage:
    cess [Options]
Options:
    help                          Show help information
    update                        Update the system and install dependencies
    install                       Install cess
    uninstall                     Uninstall cess
EOF
exit 0
}

function get_sys_name()
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

function start_node()
{
    # Determine whether cess-node exists
    if [ ! -f ""$nodedir"/cess-node" ]; then
        log_err ""$nodedir"/cess-node does not exist"
        exit 1
    fi
    
}

get_sys_name
case "$1" in
    start)
        install_depenencies DISTRO
        start_node
    	  ;;
		uninstall)
        uninstall
        ;;
		update)
        # TODO
        ;;
    stop)
    		# TODO
    		;;
    *)
      cess_help
      ;;
    esac
