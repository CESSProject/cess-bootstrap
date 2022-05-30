# Cess-Bootstrap

## Project background

This project is the startup script project of the consensus node. When running this project, two executable programs will be started: cess-node and scheduler. After successful operation, the cess-node and scheduler programs will be mounted in the cesslab/cess-boot container.

## Install

### Prerequisites:

* Centos7 and above or Ubuntu18.04 and above
* Internet connection required
* Public IP address

### Steps for usage

#### Clone code

First, the operating system needs to be switched to the root role, and then the code needs to be cloned locally. If there is no git tool on your system, please refer to the method for installing the git tool. The working path here is /root

```shell
su
cd /root/
git clone https://github.com/CESSProject/cess-bootstrap.git
```

After the installation is successful, enter the code folder

```shell
cd /root/cess-bootstrap
```

First, please obtain the latest version of the cess-node executable file and place it in the node directory. For the method of obtaining cess-node, please refer to the readme of the CESSProject/cess project: https://github.com/CESSProject/cess/blob/main/README.md, I will place the obtained files in the node directory below.

```shell
mv /root/cess-node /root/cess-bootstrap/node/
```

Secondly, please get the latest version of the scheduler executable file and put it in the scheduler directory, please get the latest scheduler release version in the CESSProject/cess-bootstrap project (https://github.com/CESSProject/cess-bootstrap) , I will place the obtained files in the scheduler directory below.

```shell
mv /root/scheduler /root/cess-bootstrap/scheduler/
```

Finally, please modify the runtime configuration file

```shell
vim /root/cess-bootstrap/scripts/config.sh
```

#### Start a consensus node

##### Prepare 2 CESS accounts

- A stash account with a balance greater than 1,000,001 TCESS.
- Controller account, the balance is greater than 1 TCESS.

##### Establish a binding relationship between the stash account and the controller account

Block Browser Network -> Staking -> Account Actions -> Add Stash

![Image text](https://github.com/CESSProject/W3F-illustration/blob/b08c27a406f3c293877c8be8956d2768723e370d/cess-boostrap/1.jpg)

![Image text](https://github.com/CESSProject/W3F-illustration/blob/b08c27a406f3c293877c8be8956d2768723e370d/cess-boostrap/2.jpg)

- Select stash account and controller account
- Mortgage Amount 1,000,000 TCESS
- Consensus reward receiving account, recommend the second option Stash account (do not increase the amount at stake)

#### Change setting

Finally, an example of filling in the part that needs to be modified in the configuration file is as follows. The specific filling content should be determined according to the local situation:

```shell
#------------------------------------------------#
# Please modify the scheduler configuration file #
#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#
# RPC address of CESS chain
RpcAddr="ws://xxx.xx.xx.xxx:xxxx/"

# The ip address of this machine
ServiceAddr="127.0.0.1"

# The port of the scheduler service
ServicePort="8080"

# Scheduler data storage path
DataDir="/root/log/"

# Controller account mnemonic is used to pay transaction gas fee
CtrlPrk="hello cess hello cess hello cess hello cess hello cess"

# Stash account address need to have one million TCESS
StashAcc="cXjhFfHZtzWXrW1xB9n5s2xAZbNzFAaDyvoxF4wAdcu4U5VyA"

#---------------------------------------------------#
# Please modify the configuration file of cess-node #
#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#
#This account is used to generate and confirm blocks
NodeSecretKey="hello cess hello cess hello cess hello cess hello cess"
```

Configuration file explanation:

* RpcAddr: the connection address of the cess chain
* ServiceAddr: the public IP address of the machine
* ServicePort: The startup port of the scheduler service, which can be customized
* DataDir: The path where the generated files of the scheduler service are mounted, recommended /root/log/
* CtrlPrk: a wallet for paying transaction fees that doesn't require a lot of TCESS
* StashAcc: wallet for staking, requires 1 million TCESS staking
* NodeSecretKey: The account used by cess-node to generate and confirm blocks, you can create an account at will and use its mnemonic

#### Install to this machine

After configuring the above configuration, install cess-bootstrap to this machine

```shell
cd /root/cess-bootstrap/
sh cess_install.sh install
```



## How to use

After completing all the steps of installation, you can start running your consensus node, please make sure that the local port is open and the network is unobstructed.

If you want to start running a consensus node, you can:

```shell
##Run the consensus node
cess start
```

If you want to exit the consensus node, you can:

```shell
##Exit the consensus node
cess stop
```

If you want to restart the consensus node, you can:

```shell
##Restart consensus node
cess restart
```

If you want to completely uninstall cess-bootstrap from your system, you can:

```shell
##Uninstall consensus node
cess uninstall
```

After performing the above steps means that you have registered and running a consensus server, of course you want to become a consensus node, please refer to [this link](https://github.com/CESSProject/cess-bootstrap/blob/main/docs/Become%20Consensus.md).

When you want to stop the consensus node, please refer to [this link](https://github.com/CESSProject/cess-bootstrap/blob/main/docs/Stop%20Consensus.md).



## Related items

The main related projects are: https://github.com/CESSProject/cess

## Participate and contribute

If you want to contribute your code, you can fork the code to your local repository, and make a pull request after modifying the corresponding area. We will review your code as soon as possible, thank you.

## Open source protocol

Apache License
Version 2.0, January 2004
