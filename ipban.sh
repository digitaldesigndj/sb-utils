echo 'Welcome to the ban command, I will need that IP address:'
read BANTHIS
echo 'Character name or ban-name'
read PLAYER
echo 'Now what did this '$PLAYER' do?'
read REASON
echo 'That nerd!'
echo $BANTHIS >> bans.log
echo $PLAYER' BAN: '$REASON >> bans.log
echo 'Here comes the hammer!'
iptables -A INPUT -s $BANTHIS -j DROP
iptables -A OUTPUT -d $BANTHIS -j DROP
sudo sh -c "iptables-save > /etc/iptables.rules"
echo 'Hammering saved: '$BANTHIS' DEFEATED'
