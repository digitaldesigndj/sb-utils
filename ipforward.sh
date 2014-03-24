echo 'Who do we have to kick? I will need that IP address:'
read KICKTHIS
echo $KICKTHIS >> forward.log
echo 'KICKED FORWARD!'
iptables -t nat -A PREROUTING -p tcp -d $KICKTHIS --dport 80 -j DNAT --to-destination 107.170.64.74
echo 'forward up'
sleep 30;
iptables -t nat -D PREROUTING -p tcp -d $KICKTHIS --dport 80 -j DNAT --to-destination 107.170.64.74
echo 'forward down'
