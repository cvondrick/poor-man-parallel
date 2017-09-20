# tmux-parallel

This is a simple recipe for launching jobs on a cluster.

It is mostly meant for clusters that lack proper queueing systems (such as the vision cluster at MIT). 

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

## Best practices
If you write your scripts in the right way, you can use the above workflow to process data in parallel. Below is a psuedo-code that shows the basic idea. It assumes you are using a networked file system (such as NFS).

    workload = ["file1.json", "file2.json", ...]
    
    random.shuffle(workload) # in matlab, you must remember to set the random seed
    
    for workitem in workload:
      in_path = "input/" + workitem
      out_path = "output/" + workitem
      lock_path = out_path + ".lock"
      
      if exist(out_path) or exist(lock_path):
        continue
      mkdir(lock_path) # create lock file
      
      # do heavy lifting here that eventually writes out_path
      
      rmdir(lock_path) # remove lock file

## CSAIL instructions

Remember, everytime you connect to a CSAIL machine, you must authenticate, otherwise your jobs will be killed eventually. To get around this, you can start your session with `longscreen`, and start tmux inside the longscreen. 
