# Starbound Server Utilities

## Installation

	git clone https://github.com/digitaldesigndj/sb-utils

The easiest way to install these utils is to add a line like this to your bash_profile.


	# Source SB Utils
	source /path/to/sb-utils/clock.sh
	source /path/to/sb-utils/ip_manage.sh
	source /path/to/sb-utils/starbound.sh
	source /path/to/sb-utils/web_manage.sh


## Functions made available

### clock.sh

	clockin()
	clockout()

### ip_manage.sh

	iplist()
	iprestore()
	ipsave()
	ipunban()
	ipban()
	ipforward()
	ipkick()
	ipkill() *needs fixed
	hammer()

### starbound.sh

	sbtail ()
	sbvanilla ()
	sbpy ()
	sbrestart()
	sbrestartpy()
	savespawn()
	restorespawn() 

### webmanage.sh

	start_cs()
	start_bs()
	startweb()
	restartweb()
