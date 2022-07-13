#!/bin/bash
#------------------------------------------------#
# Please modify the scheduler configuration file #
#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#

# The ip address of this machine
ServiceAddr=""

# The port of the scheduler service
ServicePort=""

# Scheduler data storage path
DataDir=""

# Controller account mnemonic is used to pay transaction gas fee
CtrlPrk=""

# Stash account address need to have one million TCESS
StashAcc=""

#---------------------------------------------------#
# Please modify the configuration file of cess-node #
#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#
#This account is used to generate and confirm blocks
NodeSecretKey=""

function configure() {
    sed -i "s|RpcAddr     = \"\"|RpcAddr     = \"ws://127.0.0.1:9944\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|ServiceAddr = \"\"|ServiceAddr = \"${ServiceAddr}\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|ServicePort = \"\"|ServicePort = \"${ServicePort}\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|DataDir     = \"\"|DataDir     = \"/root/scheduler_data\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|CtrlPrk     = \"\"|CtrlPrk     = \"${CtrlPrk}\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|StashAcc    = \"\"|StashAcc    = \"${StashAcc}\"|g" ${installdir}/scheduler/conf.toml
    echo $NodeSecretKey > $installdir/node/secretKey1.txt
    if [ ! -f $DataDir ]; then mkdir -p $DataDir; fi
}
