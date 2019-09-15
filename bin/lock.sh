#!/usr/bin/bash

import -screen -window root -silent png:- | convert png:- -scale 5% -scale 2000% -depth 8 png:- | convert png:- $HOME/pics/lock.png -gravity center -composite -matte RGB:- | i3lock -u --raw 1920x1080:rgb -i /dev/stdin
