# poor-man-parallel

This is a way of launching jobs on a cluster. It is very simple to use, and mostly meant for clusters that lack proper queueing systems. 

## Installation
1. Install tmux
2. Add this line to your `.tmux.conf`: 
  `bind-key y set-window-option synchronize-panes`
3. Put `crunch.sh` into your path
4. Modify `crunch.sh` to change .csail.mit.edu domains to your domain

## Usage
1. Start tmux
2. Run command: `crunch N machine1 machine2 machine3` where `N` is the number of replicas you want, and the rest are the hostnames of the machines you want to connect. This will cause tmux to open N*number_of_hosts panes, with SSH connections into each machine.
3. Press `Ctrl+b y` to synchronize all the panes.
4. Start typing, and your input will be broadcast to all machines.

