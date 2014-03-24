#!/bin/bash

function iplist() {
	grep "Client '" /root/starbound/starbound_server.log*;
}

function iprestore() {
	iptables-restore < /etc/iptables.rules;
}

function ipsave() {
	sudo sh -c "iptables-save > /etc/iptables.rules";
}

function ipunban() {
	echo 'Welcome to the unban command, I will need that IP address:';
	read BANTHIS;
	echo 'Character name or ban-name';
	read PLAYER;
	echo $PLAYER' is getting another chance why?';
	read REASON;
	echo 'Well if you say so...';
	echo $BANTHIS >> bans.log;
	echo $PLAYER' REPEAL: '$REASON >> bans.log;
	echo 'Fun fact: You can never really be unhammered!';
	iptables -D INPUT -s $BANTHIS -j DROP;
	iptables -D OUTPUT -d $BANTHIS -j DROP;
	sudo sh -c "iptables-save > /etc/iptables.rules";
	echo 'Repeal saved: Welcome back '$BANTHIS;
}

function ipban() {
	echo 'Welcome to the ban command, I will need that IP address:';
	read BANTHIS;
	echo 'Character name or ban-name';
	read PLAYER;
	echo 'Now what did this '$PLAYER' do?';
	read REASON;
	echo 'That nerd!';
	echo $BANTHIS >> bans.log;
	echo $PLAYER' BAN: '$REASON >> bans.log;
	echo 'Here comes the hammer!';
	iptables -A INPUT -s $BANTHIS -j DROP;
	iptables -A OUTPUT -d $BANTHIS -j DROP;
	sudo sh -c "iptables-save > /etc/iptables.rules";
	echo 'Hammering saved: '$BANTHIS' DEFEATED';
}

function ipforward() {
	echo 'Who do we have to kick? I will need that IP address:';
	read KICKTHIS;
	echo $KICKTHIS >> forward.log;
	echo 'KICKED FORWARD!';
	iptables -t nat -A PREROUTING -p tcp -d $KICKTHIS --dport 80 -j DNAT --to-destination 107.170.64.74;
	echo 'forward up';
	sleep 30;
	iptables -t nat -D PREROUTING -p tcp -d $KICKTHIS --dport 80 -j DNAT --to-destination 107.170.64.74;
	echo 'forward down';
}

function ipkick() {
	echo 'Who do we have to kick? I will need that IP address:';
	read KICKTHIS;
	echo $KICKTHIS >> kicks.log;
	echo 'KICK!';
	iptables -A INPUT -s $KICKTHIS -j DROP;
	iptables -A OUTPUT -d $KICKTHIS -j DROP;
	echo 'They should of froze';
	sleep 1;
	echo 'Sleeping for';
	echo '3';
	sleep 1;
	echo '2';
	sleep 1;
	echo '1';
	iptables -D INPUT -s $KICKTHIS -j DROP;
	iptables -D OUTPUT -d $KICKTHIS -j DROP;
	echo 'bringing them back to life and saving';
	sudo sh -c "iptables-save > /etc/iptables.rules";
	echo 'Kick finished';
	echo ' ';
}

## this function is not working... syntax error?
function ipkill() {
	echo "Whose connection to kill?";
	read NAME;
	LINE=$(less /root/StarryPy/server.log | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep player | grep $NAME | tail -1);
	echo $LINE;
	IP=$(less /root/StarryPy/server.log | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep player | grep $NAME | tail -1 | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}');
	while true;
		do;
		read -p "Kill this connection to $NAME with $IP? [Y/N]" yn;
		case $yn in;
			[Yy]* ) tcpkill host $IP && iptables -A INPUT -s $IP -j DROP; break;
			[Nn]* ) exit;
			* ) echo "Please answer yes or no.";;
		esac;
	done;
}

function hammer() {
	green='\e[0;32m'; # '\e[1;32m' is too bright for white bg.
	red='\e[0;31m';
	endColor='\e[0m';

	echo -e "${red}Welcome to bash Hammer! ${endColor}"
	echo -e "${green}FIND YOUR TARGET:${endColor}"
	read PLAYER;
	THISTHEM=$(grep "Client '" /root/starbound/starbound_server.log* | grep $PLAYER | tail -1 );
	LINE=$(grep "Client '" /root/starbound/starbound_server.log* | grep $PLAYER | tail -1 | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}');
	echo $THISTHEM;
	echo $LINE;
	echo -e "Is this them? \n${red}If not press ctrl-c and bash iplist${endColor}";

	echo 'Now what did this '$PLAYER' do?';
	read REASON;
	echo 'That nerd!';
	echo $LINE $BANTHIS >> bans.log;
	echo $PLAYER" $(date)BAN: "$REASON >> bans.log;
	echo 'Here comes the hammer!';
	iptables -A INPUT -s $LINE -j DROP;
	iptables -A OUTPUT -d $LINE -j DROP;
	sudo sh -c "iptables-save > /etc/iptables.rules";
	echo 'Hammering saved: '$PLAYER' DEFEATED';
}