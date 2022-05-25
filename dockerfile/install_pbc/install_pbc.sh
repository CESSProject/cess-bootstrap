#! /bin/bash
basedir=$(pwd)
apt-get update
ubuntu_install()
{
	echo "********************************************************"
	echo "              INSTALLING PBC DEPENDENCES"
	echo "********************************************************"
	apt-get install -y m4 g++ flex bison make
	tar -xvf $basedir/gmp-6.2.1.tar
	cd $basedir/gmp-6.2.1
	chmod +x ./configure
	./configure --enable-cxx
	make
	make check
	make install
	cd ..
	echo "********************************************************"
	echo "              INSTALLING PBC LIBRARY"
	echo "********************************************************"
	tar -zxvf $basedir/pbc-0.5.14.tar.gz
	cd $basedir/pbc-0.5.14
	chmod +x ./configure
	./configure
	make
	make install
	touch /etc/ld.so.conf.d/libpbc.conf
	test -s /etc/ld.so.conf.d/libpbc.conf && sed -i "\$a /usr/local/lib" /etc/ld.so.conf.d/libpbc.conf || echo "/usr/local/lib" >> /etc/ld.so.conf.d/libpbc.conf
	ldconfig
}
ubuntu_install
