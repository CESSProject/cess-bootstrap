#!/bin/bash
#------------------------------------------------#
# Please modify the scheduler configuration file #
#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#
# RPC address of CESS test chain
RpcAddr=

# The IP address of the machine's public network used by the scheduler
ServiceAddr=

# Port number monitored by the scheduler
ServicePort=

# Phrase words or seeds for identity account
DataDir=

# Name of node
CtrlPrk=

# Role of node
StashAcc=

#---------------------------------------------------#
# Please modify the configuration file of cess-node #
#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#
NodeSecretKey=

function configure() {
    sed -i "s|RpcAddr     = \"\"|RpcAddr     = \"${RpcAddr}\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|ServiceAddr = \"\"|ServiceAddr = \"${ServiceAddr}\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|ServicePort = \"\"|ServicePort = \"${ServicePort}\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|DataDir     = \"\"|DataDir     = \"${DataDir}\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|CtrlPrk     = \"\"|CtrlPrk     = \"${CtrlPrk}\"|g" ${installdir}/scheduler/conf.toml
    sed -i "s|StashAcc    = \"\"|StashAcc    = \"${StashAcc}\"|g" ${installdir}/scheduler/conf.toml
    echo $NodeSecretKey > $installdir/node/secretKey1.txt
}
