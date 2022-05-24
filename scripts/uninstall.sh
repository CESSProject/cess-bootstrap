#!/bin/bash

function uninstall()
{
	rm -rf $installdir/
	rm /usr/bin/cess
	stop_node_scheduler
	log_suc "delete cess success"
}