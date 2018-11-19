#!/bin/bash

MAX_BRIGHTNESS=$(cat /sys/class/backlight/*/max_brightness);
USERNAME=$(whoami)

checkUser(){
	if [ $USERNAME != "root" ]; 
		then printf "\nrun this script as root\n" && exit; 
		fi;
}

error_report(){
	printf "error: please provide a brightness value between [0,$MAX_BRIGHTNESS]\n";
}

checkUser;

if [ $# -eq 1 ] && [ $1 -ge 0 ] &&  [ $1 -le $MAX_BRIGHTNESS ]; 
then echo $1 > /sys/class/backlight/intel_backlight/brightness; 
else error_report; 
fi;
