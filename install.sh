#!/bin/bash

CURPATH="$(dirname "$(readlink -f "$0")" )"
cd "$CURPATH"

_error(){ echo "something went wrong..please review install.sh"; exit 1; }

if [[ "$(whoami)" != "root" ]]; then 
  printf "hey, you are not root..that would help..check out what I was about to do:\n\n\n"
  cat $0 | while read line; do echo "   -> $line"; done
  exit
fi

if ! id nodejs &>/dev/null ; then 
  read -p "node nodejs-user found..wanna create one for security reasons? (y/n)" answer
  [[ "$answer" == "y" ]] && adduser --ingroup www-data --no-create-home --disabled-login nodejs
fi

sudo npm -g install forever  || _error  # this is needed to have your apps automatically restarted after crash/suprises
npm install http-proxy       || _error  # with this you can redirect weburls (port 80) to nodejs ports (so webbrowser can easily access it)
sed -i "s|/some/path|$CURPATH|g" forever.d/proxyserver.conf # setting right path for proxyserver
echo "copying initscripts + configscripts" 
cp init.d/* /etc/init.d/.               # copying forever initscript
cp forever.d/* /etc/forever.d/.          # copying config files
echo "adding forever service (apps will be restarted upon (server)crashes e.g.)" 
sudo update-rc.d forever defaults
sudo /etc/init.d/forever start
