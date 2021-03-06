#!/bin/bash
#CSG6206 – Advanced Scripting
#Workshop 3 – Automatic Proxy Configuration
#Jeewan Parajuli(10436478)

#Network detection
echo "Detecting network location..."
if ping -c 1 proxy.ecu.edu.au
then
	echo "You are on an ECU network"
	#promt user for username and read username
	read -p "Please enter your ECU username: "  username
	#promt user for password and read securely
	read -s -p "please enter your ECU password: " password; printf "\n"

	#Proxy server turn on
	if [ $(id -u) -ne 0 ]
	then
  		echo "Please run as root!(Hints:sudo ./ws3.sh)";
  		exit 1;
	fi

	if [ ! -z username ] && [ ! -z password ]
     	then

		host="ecu.edu.au"
		port=443
		gsettings set org.gnome.system.proxy mode 'manual';
  		gsettings set org.gnome.system.proxy.http host '$host';
		gsettings set org.gnome.system.proxy.http port $port;

		grep PATH /etc/environment > ecu.t
		printf "http_proxy=http://$host:$port/\n"
  		HTTPS_PROXY=http://$host:$port\

  		cat ecu.t > /etc/environment

		printf \
		"Acquire::http::proxy \"http://$username:$password@$host:$port/\"\n"
  		rm -rf ecu.t

		echo "Your proxy has been set!" ; echo "You are \"online\""

	else

 		 printf "Usage of another proxy\n"

	fi
else
	echo "You are off campus"
	#off campus/proxy server off
	if [ $(id -u) -ne 0 ]; then
  		echo "Please run as root.(Hints:sudo ./ws3)";
 		exit 1;
	fi

	gsettings set org.gnome.system.proxy mode 'none' ;

	grep PATH /etc/environment > ecu.t;
	cat ecu.t > /etc/environment;

	printf "" > /etc/apt/apt.conf.d/95proxies;

	rm -rf lol.t;

	echo "Proxy settings have been cleared"
	#connection check
	if ping -c 1 wwww.github.com
	then
		echo "You are \"Online\""
	else
		echo "Your are \"Offline\"" 
	fi
fi

