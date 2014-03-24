#!/bin/bash
 
echo "Whose connection to kill?"
read NAME
 
LINE=$(less /root/StarryPy/server.log | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep player | grep $NAME | tail -1)
echo $LINE
IP=$(less /root/StarryPy/server.log | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep player | grep $NAME | tail -1 | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
 
while true; do
    read -p "Kill this connection to $NAME with $IP? [Y/N]" yn
    case $yn in
        [Yy]* ) tcpkill host $IP && iptables -A INPUT -s $IP -j DROP; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
