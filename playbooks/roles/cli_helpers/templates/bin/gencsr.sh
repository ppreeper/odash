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
openssl genrsa -des3 -out $server.$domain.key.secure 2048
openssl rsa -in $server.$domain.key.secure -out $server.$domain.key
openssl req -new -key $server.$domain.key -out $server.$domain.csr
