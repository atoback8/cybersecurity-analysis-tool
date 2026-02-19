#!/bin/bash

if [[ $EUID -ne 0 ]]; then
echo "This script must be run as root (use sudo)"
exit 1
fi

echo "Starting the process to close port 23 (Telnet)"

echo "Removing port 23 from public zone.."
firewall-cmd --zone=public --remove-port=23/tcp --permanent
firewall-cmd --reload

if systemctl is-active --quiet telnet.socket; then
	echo "Disabling telnet.socket.."
	systemctl stop telnet.socket
	systemctl disable telnet.socket
fi
