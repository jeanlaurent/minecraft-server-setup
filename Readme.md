# Minecraft server

## Using this image
* 'docker $(docker-machine config foo) run -d -p 25565:25565 --name minecraft jeanlaurent/minecraft'

**wip**

quick guide to setup a minecraft server on a kimsuffi ovh host, 100% automated, using ansible & docker.

## install locally
Docker, Docker-Machine, Ansible

## Setup KimSufi host
  * add default ssh key or use template and make sure you can ssh into the box

## Run ansible on host
this needs some work to be "100% automated"

  * `ansible-playbook install.yml -i prod`
  * `docker-machine --debug create --driver generic --generic-ip-address 178.32.222.190 --generic-ssh-key ~/.ssh/id_docker-machine foo`
  * 'docker $(docker-machine config foo) run -d -p 25565:25565 --name minecraft jeanlaurent/minecraft'


## Launch minecraft client and connect to host.
