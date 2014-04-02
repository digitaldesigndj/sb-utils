#!/bin/bash

function start_cs() {
	cd ~/commandstar/
	echo "Installing/updating dependencies..."
	npm install --production --loglevel error
	# run the server using the local coffee-script
	forever start ~/commandstar/node_modules/coffee-script/bin/coffee ~/commandstarlib/commandstar.coffee
	echo 'started commandstar'
}

function start_bs() {
	cd ~/boundstar/
	export WEBHOOK_KEY=TDY721
	forever start app.js
	echo 'started boundstar'
}

function startweb() {
	start_cs;
	start_bs;
}

function restartweb() {
	forever stopall;
	startweb;
}
