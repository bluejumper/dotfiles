#!/bin/sh

# nspawn arguments
host1="host1 --network-veth"
host2="host2 --network-veth --network-veth-extra=storage-host2 --network-veth-extra=vxlan-host2"
host3="host3 --network-veth --network-veth-extra=storage-host3 --bind /mnt/usb1:/mnt/sheep/hdd"
host4="host4 --network-veth --network-veth-extra=vlan-host4 --network-veth-extra=vxlan-host4"

network="~/sh/nspawn-network.sh"

echo -e "Using separate terminal windows, execute the following commands:\n"
# echo nspawn command hosts.
for host in host1 host2 host3 host4; do
	case $host in
		# Define case for unprivileged containers.
		host3)
			echo "sudo systemd-nspawn -bD /var/lib/machines/$(eval echo \$$host)"
			;;
		*)
			echo "sudo systemd-nspawn -bUD /var/lib/machines/$(eval echo \$$host)"
			;;
	esac
done

echo -e "\nThen execute:\n\n$network"
