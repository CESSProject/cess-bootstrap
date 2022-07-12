#!/bin/bash

#chmod 777 /root/scheduler/scheduler
#cd /root/scheduler/
#nohup ./scheduler run >/root/scheduler/scheduler.log 2>&1 &
#processScheNum=`ps -fe | grep scheduler | grep -v grep | wc -l`
#        if [ $processScheNum -eq 0 ];then
#                echo scheduler not start >> /root/log/start.log
#		exit
#        else
#                echo scheduler running >> /root/log/start.log
#        fi
chmod 777 /root/node/cess-node
echo start run cess-node >> /root/log/start.log
#nohup /root/node/cess-node --base-path /node/t026 --chain cess-testnet --validator >/dev/null 2>&1 &
#sleep 5
#ps -ef | grep cess-node | grep -v grep | awk '{print $2}' | xargs kill -9
#echo stop run cess-node >> /root/log/start.log

echo add crontab script >> /root/log/start.log
chmod 777 /root/cron.sh
touch /var/spool/cron/crontabs/root
echo "* * * * * root sh /root/cron.sh" >> /etc/crontab
service cron start >> /root/log/start.log

/root/node/cess-node key insert --base-path /node/t026 --chain cess-testnet --scheme Sr25519  --key-type babe --suri /root/node/secretKey1.txt
/root/node/cess-node key insert --base-path /node/t026 --chain cess-testnet --scheme Ed25519  --key-type gran --suri /root/node/secretKey1.txt
nohup /root/node/cess-node --base-path /node/t026 --chain cess-testnet --validator >/root/node/node.log 2>&1 &
sleep 30s
chmod 777 /root/scheduler/scheduler
cd /root/scheduler/
./scheduler run
#processScheNum=`ps -fe | grep scheduler | grep -v grep | wc -l`
#        if [ $processScheNum -eq 0 ];then
#                echo scheduler not start >> /root/log/start.log
#		exit
#        else
#                echo scheduler running >> /root/log/start.log
#        fi