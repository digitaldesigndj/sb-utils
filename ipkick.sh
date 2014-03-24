echo 'Who do we have to kick? I will need that IP address:'
read KICKTHIS
echo $KICKTHIS >> kicks.log
echo 'KICK!'
iptables -A INPUT -s $KICKTHIS -j DROP
iptables -A OUTPUT -d $KICKTHIS -j DROP
echo 'They should of froze'
sleep 1;
echo 'Sleeping for'
echo '3'
sleep 1;
echo '2'
sleep 1;
echo '1'
iptables -D INPUT -s $KICKTHIS -j DROP
iptables -D OUTPUT -d $KICKTHIS -j DROP
echo 'bringing them back to life and saving'
sudo sh -c "iptables-save > /etc/iptables.rules"
echo 'Kick finished'
echo ' '

