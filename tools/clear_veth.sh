#! /bin/bash

ip netns | xargs -I {} sudo ip netns delete {}
ip link show up | grep -o 'veth[0-9]*'| xargs -I {} sudo ip link del {}