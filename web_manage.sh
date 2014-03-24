#!/bin/bash

function start_cs() {
	cd ~/commandstar/
	bash forever.sh
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
