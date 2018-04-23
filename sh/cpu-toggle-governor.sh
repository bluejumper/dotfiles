#!/bin/sh

# Toggles the scaling_governor property on all CPU cores.

state=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

case $state in
	powersave)
	echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	state=performance
	;;

	performance)
	echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	state=powersave
	;;
esac

echo "CPU: 'scaling_governor' on all cores set to '$state'."
notify-send "CPU: 'scaling_governor' on all cores set to '$state'."
