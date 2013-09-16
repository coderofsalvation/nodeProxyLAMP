nodeServerPlatform
==================

installscript for Linuxservers to have a node multi-app multi-port environment up and running in no time

Problem
=======
Node is fun, but to get a productionserver going which is plug'n'play for multiple node-apps is timeconsuming.

<br><img src="README.jpg"/<br>

Solution
========
This is a plugnplay solution which can be installed by running one install.sh-script, it installs:

    * forever             <-- tool which restarts apps automatically upon crash/suprises etc
    * /etc/init.d/forever <-- an initd-script which can start/stop/restart/list app(s)..or all at once during reboot
    * /etc/forever.d/     <-- directory where each configfile represents an node app on a specific port
    * proxyServer         <-- a router which sits on port 80, and which can redirect any request internally to other ports

This is a mashup of akuznecov's [initscript](https://github.com/akuznecov/forever-initscript) (slightly modified) and the http-proxy module.

How
===
Well you can run this:

    (login to your new productionserver)
    git clone https://github.com/coderofsalvation/nodeServerPlatform.git
    cd nodeServerPlatform
    sudo ./install.sh

or review [install.sh](https://github.com/coderofsalvation/nodeServerPlatform/blob/master/install.sh) if you wanna check before doing that.    

Dependancies
============
The install.sh-script installs dependancies automatically, but just for convenience here are the local moduleversions 
which were used for testing:

    └─┬ http-proxy@0.10.3
      ├── colors@0.6.2
      ├─┬ optimist@0.3.7
      │ └── wordwrap@0.0.2
      ├── pkginfo@0.2.3
      └─┬ utile@0.1.7
        ├── async@0.1.22
        ├── deep-equal@0.0.0
        ├── i@0.3.2
        ├── mkdirp@0.3.5
        ├── ncp@0.2.7
        └── rimraf@1.0.9
    
