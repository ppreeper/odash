#!/bin/bash
if [ -z $1 ]; then
	echo "No Server specified"
	exit
else
	server=$1
fi
if [ -z $2 ]; then
	echo "No Domain specified"
	exit 
else
	domain=$2
fi
echo $server $domain
mv $server.$domain.crt /etc/ssl/certs/$server.$domain.crt
mv $server.$domain.key /etc/ssl/private/$server.$domain.key

