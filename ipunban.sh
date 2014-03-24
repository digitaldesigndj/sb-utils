echo 'Welcome to the unban command, I will need that IP address:'
read BANTHIS
echo 'Character name or ban-name'
read PLAYER
echo $PLAYER' is getting another chance why?'
read REASON
echo 'Well if you say so...'
echo $BANTHIS >> bans.log
echo $PLAYER' REPEAL: '$REASON >> bans.log
echo 'Fun fact: You can never really be unhammered!'
iptables -D INPUT -s $BANTHIS -j DROP
iptables -D OUTPUT -d $BANTHIS -j DROP
sudo sh -c "iptables-save > /etc/iptables.rules"
echo 'Repeal saved: Welcome back '$BANTHIS
