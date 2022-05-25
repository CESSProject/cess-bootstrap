#!/bin/sh

sleep 10
processScheNum=`ps -fe | grep scheduler | grep -v grep | wc -l`
        if [ $processScheNum -eq 0 ];then
		echo processScheNum:$processScheNum >> /root/log/cron.log
		echo kill cess-node >> /root/log/cron.log
                ps -ef | grep cess-node | grep -v grep | awk '{print $2}' | xargs kill -9
		echo stop cess-boot success >> /root/log/cron.log
        else
                echo scheduler is alive >> /root/log/cron.log
        fi
processNodeNum=`ps -fe | grep cess-node | grep -v grep | wc -l`
        if [ $processNodeNum -eq 0 ];then
		echo processNodeNum:$processNodeNum >> /root/log/cron.log
                echo kill scheduler >> /root/log/cron.log
                ps -ef | grep scheduler | grep -v grep | awk '{print $2}' | xargs kill -9
		echo stop cess-boot success >> /root/log/cron.log
        else
                echo cess-node is alive >> /root/log/cron.log
        fi
