#!/bin/bash

function clockin() {
	echo "${USER} has clocked in at $(date)" >> clock.log;
}

function clockout() {
	echo "${USER} has clocked out at $(date)" >> clock.log;
}
