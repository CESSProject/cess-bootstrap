FROM ubuntu:20.04
MAINTAINER DemosChiang
RUN mkdir -p /root/node
RUN mkdir -p /root/scheduler
RUN mkdir -p /root/install_pbc
RUN mkdir -p /root/install_dependence
RUN mkdir -p /root/log
RUN mkdir -p /root/scheduler_data
COPY startup.sh /root/
COPY cron.sh /root/
COPY install_pbc /root/install_pbc/
COPY install_dependence /root/install_dependence/
WORKDIR /root/install_pbc
RUN sh install_pbc.sh
WORKDIR /root/install_dependence
RUN sh dependence.sh
WORKDIR /root/
CMD sh startup.sh
