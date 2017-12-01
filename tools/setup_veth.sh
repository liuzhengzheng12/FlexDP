#! /bin/bash

# Remove existing network namespaces and veths
ip netns | xargs -I {} sudo ip netns delete {}
ip link show up | grep -o 'veth[0-9]*'| xargs -I {} sudo ip link del {}


sudo ip link add veth1 type veth peer name veth3
sudo ip link add veth2 type veth peer name veth4

sudo ip netns add h1
sudo ip netns add h2

sudo ip link set veth1 netns h1
sudo ip link set veth2 netns h2

sudo ip netns exec h1 ifconfig lo up
sudo ip netns exec h2 ifconfig lo up

sudo ip netns exec h1 ifconfig veth1 hw ether 802200010001
sudo ip netns exec h2 ifconfig veth2 hw ether 802200010002

sudo ip netns exec h1 ifconfig veth1 10.0.0.1 up
sudo ip netns exec h2 ifconfig veth2 10.0.0.2 up

sudo ip netns exec h1 arp -s 10.0.0.2 80:22:00:01:00:02
sudo ip netns exec h2 arp -s 10.0.0.1 80:22:00:01:00:01

sudo ifconfig veth3 up
sudo ifconfig veth4 up