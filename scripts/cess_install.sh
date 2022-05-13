#!/bin/bash

function install_depenencies()
{
  case "$1" in
  		CentOS)
          echo "CentOS Linux"
          yum install docker -y
          systemctl start docker
          systemctl enable docker
          log_info "------------Install depenencies--------------"
          yum install -y ocl-icd-* gcc git curl wget libhwloc* wget util-linux
          if [ $? -ne 0 ]; then
              log_err "Install libs failed"
              exit 1
          fi
          ;;
      Ubuntu)
          echo "Ubuntu"
          if [ x"$update" == x"true" ]; then
            log_info "------------Apt update--------------"
            sudo apt-get update
            if [ $? -ne 0 ]; then
               log_err "Apt update failed"
               exit 1
            fi
            fi
          sudo apt-get update
          sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
          curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
          echo \
          "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
          $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/nul
          sudo apt-get update
          sudo apt-get install docker-ce docker-ce-cli containerd.io -y
          systemctl start docker
          systemctl enable docker
          log_info "------------Install depenencies--------------"
          apt install -y ocl-icd-* gcc git curl wget libhwloc* wget util-linux
          if [ $? -ne 0 ]; then
             log_err "Install libs failed"
             exit 1
          fi
          ;;
      esac
    sysctl -w net.ipv4.tcp_syncookies = 1
    sysctl -w net.ipv4.tcp_tw_reuse = 1
    sysctl -w net.ipv4.tcp_tw_recycle = 1
    sysctl -w net.ipv4.tcp_fin_timeout = 30
    sysctl -w net.ipv4.tcp_keepalive_time = 120
    sysctl -w net.core.rmem_max=2500000
	sysctl -w net.ipv4.ip_local_port_range = 1024 65530
}