#!/usr/bin/bash

i3lock -u -i <(import -screen -window root -silent png:- | convert png:- -scale 5% -scale 2000% png:- | convert png:- $HOME/pics/lock.png -gravity center -composite -matte png:-)
