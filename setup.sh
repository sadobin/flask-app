#! /bin/bash

file="./nginx/app.conf"
instances=$1
prefix="172.30.1."
IPs=()
servers=""

function file_existence
{
		if [ ! -f $file ];
		then
				echo "file <$file> not found"
				exit 1
		fi
}

function generate_srv
{
		if [ $instances ];
		then
				for i in $(seq 1 $instances);
				do
						host_ip="${prefix}$(expr 9 + $i)"
						IPs[ ${#IPs[@]} ]=$host_ip
						servers="${servers}\n\tserver ${host_ip}:5000;"
				done
		fi
}

function config_nginx
{
		if [ -w $file ]; 
		then
				pattern="s/server\ .[1-9]+.+;$/$servers/g"
				sed -Ei "$pattern" $file
		else
				echo "file <$file> missed write permission"
				exit 1
		fi
}


if [ $1 == "reset" ];
then
		echo "[+] Reseting configuration file"
		cp ./nginx/template ./nginx/app.conf
		exit 1
fi

# Checking existence of file 
file_existence


# Generating range of IP addresses
generate_srv


# Modifying nginx.conf content
config_nginx

#echo -e $servers
#echo -e $IPs


echo "docker-compose build"
for i in $( seq 1 ${#IPs[@]} );
do
		echo "docker run -it -d --rm --name app$i --network flask-app_net --ip ${IPs[ $(expr $i - 1) ]} flask-app_app"
done
echo "docker run -it -d --rm --name app-nginx --network flask-app_net flask-app_nginx"
