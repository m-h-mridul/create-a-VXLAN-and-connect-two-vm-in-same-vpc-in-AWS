#!/bin/bash


######  step-1->
# docker install 
# create network
sudo apt update -y; sudo apt install -y docker.io; sudo docker network create --subnet 172.20.0.10/16 vxlan-net
# network id 74682c02f436fb3bb60e799e7c2e9861d2c2a54fe52100a66eefbb1a68296ca4
sudo docker network ls
# vxlan-net id 74682c02f436
ip a


##### step-2->
# for betteer understand  search on ChatGPT
# " command "explain each word with easy explanation
# try this --> sudo docker run -d --net vxlan-net --ip 10.10.0.10 ubuntu sleep 3000 explain each word with easy explanation
# create docker run 
sudo docker run -d --net vxlan-net --ip 172.20.0.11 ubuntu sleep 3000; sudo docker ps
# ubuntu container id d9a49a353000
# see docker network details which we are given
sudo  docker inspect d9a49a353000 | grep IPAddress 


##### step-3->
# goto ubuntu container 
sudo docker exec -it d9a49a353000 bash


##### step-4->
# inside the ubunut run this commands
apt-get update; apt-get install net-tools; apt-get install iputils-ping 


##### step-5->
#see bridge id  br-74682c02f436
brctl show
exit 


##### step-6->
# connect vxlan to distination address fixed the port
sudo ip link add vxlan-demo type vxlan id 100 remote 10.10.0.199 dstport 4789 dev eth0
#for see the vxlan 
ip a | grep vxlan


##### step-7->
#up vxlan
sudo ip link set vxlan-demo up
#_ add vxalan to the bridge  
sudo brctl addif br-74682c02f436 vxlan-demo 
#to see the vm route
sudo apt install net-tools
route -n


##### step-8->
# now eveything set to the network
# go to the ubuntu container and see the ping status
sudo docker exec -it d9a49a353000 bash
ping 10.10.0.199 c -2

