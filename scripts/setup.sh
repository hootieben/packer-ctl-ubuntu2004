#!/usr/bin/env bash
SUDO=''

if [[ $EUID -ne 0 ]]; then
	SUDO='sudo'
fi

if [[ ! -f /usr/bin/python && ! -f /usr/bin/python3 ]]; then
	$SUDO apt-get -y update && $SUDO apt-get -y upgrade &&
  $SUDO apt-get -y install apt-transport-https ca-certificates &&
  $SUDO apt-get -y install python3 python3-pip sudo
	if [ -f /usr/bin/python3 ] && [ ! -f /usr/bin/python ]; then
		$SUDO ln -s /usr/bin/python3 /usr/bin/python
	fi
fi
