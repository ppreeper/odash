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
openssl ecparam -name secp224r1 -out $server.$domain.key -genkey
openssl x509 -req -days 365 -in $server.$domain.csr -signkey $server.$domain.key -out $server.$domain.crt
