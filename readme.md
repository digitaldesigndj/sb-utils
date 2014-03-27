# Starbound Server Utilities

```
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
```

## Installation

	git clone https://github.com/digitaldesigndj/sb-utils

The easiest way to install these utils is to add a line like this to your bash_profile.


	# Source SB Utils
	source /path/to/sb-utils/clock.sh
	source /path/to/sb-utils/ip_manage.sh
	source /path/to/sb-utils/starbound.sh
	source /path/to/sb-utils/web_manage.sh

_This will need to be done for each user that wants to use the tools._

## Functions made available

### clock.sh

	clockin
	clockout

### ip_manage.sh

	iplist
	iprestore
	ipsave
	ipunban
	ipban
	ipforward
	ipkick
	ipkill
	hammer

### starbound.sh

	sbtail
	sbvanilla
	sbpy
	sbrestart
	sbrestartpy
	savespawn
	restorespawn 

### webmanage.sh

	start_cs
	start_bs
	startweb
	restartweb
