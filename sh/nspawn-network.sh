#!/bin/sh

# Network map:
# br-mgmt (all nodes) - controller, storage, compute, network.
# br-vlan (some nodes) - network.
# br-vxlan (some nodes) - compute, network.

echo "Creating bridges ..."
for bridge in br-mgmt br-vlan br-vxlan; do
	sudo ip link add name ${bridge} type bridge
	sudo ip link set dev ${bridge} up
done

echo "Creating host veth cables for each bridge ..."
prefix='ben'
for veth in 0 1 2; do
	sudo ip link add name ${prefix}${veth} type veth peer name ${prefix}-port${veth}
	sudo ip link set dev ${prefix}${veth} up
done

echo "Plugging ports into bridges ..."
# Plug ports into br-mgmt
for port in ve-host1 ve-host2 ve-host3 ve-host4 ben-port0; do
	sudo ip link set dev ${port} up master br-mgmt
done

# Plug ports into br-vlan
for port in vlan-host3 vlan-host4 ben-port1; do
	sudo ip link set dev ${port} up master br-vlan
done

# Plug ports into br-vxlan
for port in vxlan-host2 vxlan-host4 ben-port2; do
	sudo ip link set dev ${port} up master br-vxlan
done

echo "Giving host-specific IP address on host interfaces ..."
sudo ip addr add 10.0.8.1/24 dev ben0
sudo ip addr add 10.0.16.1/24 dev ben1
sudo ip addr add 10.0.24.1/24 dev ben2

echo "Starting dnsmasq ..."
sudo systemctl restart dnsmasq

echo "Bridges built, plugged in and offering network services!"
echo "It's up to you to configure 'iptables -t nat -A POSTROUTING' properly!"
