# In this project, Create one VPC in AWS or GPC. Then create two ec2 in the same VPC and connect them With VxLAN. [![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@mhmridul2400/what-is-vxlan-why-vxlan-and-how-7ab9ed6d2f4c)

# In Pordhi the given question is : Create a multi-container host network using VXLAN overlay network.
<p align=center>
    <img src="assets/WhatsApp Image 2023-07-11 at 11.55.52 PM.jpeg" width="65%" height="65%">
</p>


# The full architecture of this project is:

<p align=center>
    <img src="assets/exam. -3.jpg" width="65%" height="65%">
</p>

# Create VPC
First, we must create a vpc form aws or gpc. For creating a VPC, Geivn is the name of the VPC, here I selected us-weast1 as the location and set the ip address 10.10.0.0/16, for the firewall rule click all buttons for the IPV4 rule so that we can ignore unwanted error form communication.

# After creating VPC we will start creating VM. 
For both VMs first give the name of the VM, then select the region which is the same as VPC and give the zone. Here I selected A and C zone for my two VMs. You can select any of them, which are given. For the firewall rules accepted both HTTP and HTTPS protocols. The network portion selected the VPC and it will be set automatically subnet for the VM. 

# Now it is time to ssh both VMs and run some commands for the VXLAN communication:
1. update and install docker both VMS
2. run the docker container and give an ip address to both VMs
3. go inside the docker container.
4. update, and install net tools, and iputils for checking the ping.
5. exit and go back to the VM.
6. give VXLAN name, type, set ID, add a remote address to the another/destination VM, and set the interface and port.
7. up the VXLAN and add the VXALN to the bridge of the VM, install net-tools for ping.
8. again go to inside docker and check ping the other VM.







