#!/bin/bash

function start_cs() {
	forever stopall
	forever start ./node_modules/coffee-script/bin/coffee lib/commandstar.coffee
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
