#!/bin/bash
#CSG6206 – Advanced Scripting
#Workshop 3 – Automatic Proxy Configuration
#Jeewan Parajuli(10436478)

#Network detection
echo "Detecting network location..."
if ping -c 1 proxy.ecu.edu.au
then
	echo "You are on an ECU network"
	read -p "Please enter your ECU username: "  username
	read -s -p "please enter your ECU password: " password


else
	echo "You are off campus"
fi

