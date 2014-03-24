green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
red='\e[0;31m'
endColor='\e[0m'

echo -e "${green}Welcome to bash Hammer! ${endColor}"
echo -e "${red}FIND YOUR TARGET:${endColor}"
read PLAYER
THISTHEM=$(grep "Client '" /root/starbound/starbound_server.log* | grep $PLAYER | tail -1 )
LINE=$(grep "Client '" /root/starbound/starbound_server.log* | grep $PLAYER | tail -1 | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
echo $THISTHEM
echo $LINE
echo -e "Is this them? \n${red}If not press ctrl-c and bash iplist${endColor}"

echo 'Now what did this '$PLAYER' do?'
read REASON
echo 'That nerd!'
echo $LINE $BANTHIS >> bans.log
echo $PLAYER" $(date)BAN: "$REASON >> bans.log
echo 'Here comes the hammer!'
iptables -A INPUT -s $LINE -j DROP
iptables -A OUTPUT -d $LINE -j DROP
sudo sh -c "iptables-save > /etc/iptables.rules"
echo 'Hammering saved: '$PLAYER' DEFEATED'
