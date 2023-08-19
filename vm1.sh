#!/bin/bash


######  step-1->
# docker install & create network
sudo apt update -y; sudo apt install -y docker.io; sudo docker network create --subnet 172.10.0.10/16 vxlan-net
# get id 3627f53b0c1624d9f537004d95d431e7aa651bfe1edfffee4697b80aaf78e4c9
sudo docker network ls
# vxlan-net id 3627f53b0c16
ip a


##### step-2->
# for betteer understand  search on ChatGPT
# " command "explain each word with easy explanation
# try this --> sudo docker run -d --net vxlan-net --ip 10.10.0.10 ubuntu sleep 3000 explain each word with easy explanation
# create docker run
sudo docker run -d --net vxlan-net --ip 172.10.0.11 ubuntu sleep 3000; sudo docker ps
# ubuntu container id d9a49a353000
# see docker network details which we are given
sudo  docker inspect 50d5fb95c30a | grep IPAddress 


##### step-3->
# goto ubuntu container 
sudo docker exec -it 50d5fb95c30a bash


##### step-4->
# inside the ubunut run this commands
apt-get update; apt-get install net-tools; apt-get install iputils-ping

##### step-5->
#see bridge id  br-6d4ed662e578 
brctl show
exit 


##### step-6->
# connect vxlan to distination address fixed the port
sudo ip link add vxlan-demo type vxlan id 100 remote 10.10.0.137 dstport 4789 dev eth0
#for see the vxlan 
ip a | grep vxlan


##### step-7->
sudo ip link set vxlan-demo up
#_ add vxalan to the bridge
sudo brctl addif br-6d4ed662e578 vxlan-demo 
#to see the vm route
sudo apt install net-tools
route -n


##### step-8->
# now eveything set to the network
# go to the ubuntu container and see the ping status
sudo docker exec -it 042c3ac34628 bash
ping 10.10.0.137 -c 2

