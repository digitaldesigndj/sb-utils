#!/bin/bash

function sbtail () {
	#this is the tail.sh code
	cd /root/starbound
	tail -f starbound_server.log
}

function sbvanilla () {
	echo '|  Making sure that starbound and starry py are off'
	stop starbound
	stop pystarbound
	cd /root/starbound
	rm starbound.config
	cp starbound.configVanillaPort starbound.config
	echo '|  Configuring the game port in starbound.config to 25024'
	start starbound
	echo '|  Starbound started in vanilla mode'
}

function sbpy () {
	echo '|  Making sure that starbound and starry py are off'
	stop starbound
	stop pystarbound
	cd /root/starbound
	rm starbound.config
	cp starbound.configPyPort starbound.config
	echo '|  Configuring the game port in starbound.config to 25024'
	start starbound
	start pystarbound
}

function sbrestart() {
	service starbound stop
	service starbound start
}

function sbrestartpy() {
	pkill python
	service starbound stop
	cd /root/StarryPy3k
	nohup python3.4 server.py >/dev/null 2>&1&
	service starbound start
}

function savespawn() {
	#AS long as the spawn planet is still:
	#alpha_59_61_-6139775_2_11.world
	#This will copy it FROM the saves folder when run.
	stop starbound
	sleep 2
	cp -f /root/starbound/saves/alpha_59_61_-6139775_2_11.world /root/starbound/universe/alpha_59_61_-6139775_2_11.world
	sleep 2
	start starbound
}

function restorespawn() {
	#AS long as the spawn planet is still:
	#alpha_59_61_-6139775_2_11.world
	#This will copy it FROM the saves folder when run.
	stop starbound
	sleep 2
	cp -f /root/starbound/saves/alpha_59_61_-6139775_2_11.world /root/starbound/universe/alpha_59_61_-6139775_2_11.world
	sleep 2
	start starbound
}

function sbhelp() {
	echo "| 
|  Welcome to Munlock & Fanservice's
| 
|   __                                          
|  (_ _|_ _  __|_  _    __  _|   | |_|_ o  | _ 
|  __) |_(_| | |_)(_)|_|| |(_|   |_| |_ |  | _> 
|
|  
|  The following commands are available
|
|  restorespawn : Brings back spawn
|  savespawn :    Saves this image of spawn
|  sbrestartpy :  Restarts StarryPy3k
|  sbrestart :    Restarts Starbound
|  sbpy :         Sets the config file for py3k
|  sbvanilla :    Sets the config file for Vanilla Starbound
|  sbtail :       Follow the log file as it updates
|  sbhelp :       This junk again
|"
}

