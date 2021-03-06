#!/bin/bash

basedir=$(cd `dirname $0`;pwd)
installdir=/opt/cess


help()
{
cat << EOF
Usage:
	sh cess_install.sh [Options]

Options:
  help		    Display this help and exit
  install     Install the Cess-Boot on your system
EOF
exit 0
}

install()
{
  echo "################################################################################################################################################"
  echo "################################################################################################################################################"
  echo "#############################################################/ ___| ____/ ___/ ___|#############################################################"
  echo "############################################################| |   |  _| \___ \___ \#############################################################"
  echo "############################################################| |___| |___ ___) |__) |############################################################"
  echo "#############################################################\____|_____|____/____/#############################################################"
  echo "################################################################################################################################################"
  echo "################################################################################################################################################"
  	if [ -f /usr/bin/cess ]; then
  		echo "delete old Cess scriptss"
  		sudo cess uninstall
  	fi
  	echo "install Cess scriptss"
  	if [ ! -f $installdir ]; then mkdir -p $installdir; fi

  	cp -r $basedir/scripts/ $installdir/
  	cp -r $basedir/node/ $installdir/
  	cp -r $basedir/scheduler/ $installdir/
  	cp -r $basedir/log/ $installdir/

  	echo "Cess command line tools Install"
  	chmod +x $installdir/scripts/cess_boot.sh
  	ln -s $installdir/scripts/cess_boot.sh /usr/bin/cess

  	echo "install command line tools successfully!"
}

case "$1" in
	"install")
		install
		;;
	*)
		help
		;;
esac
