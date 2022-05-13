#!/bin/bash

function uninstall()
{
	rm -rf $installdir/
	rm /usr/bin/cess
	log_suc "delete cess success"
}