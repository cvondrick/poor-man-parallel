repeat=$1
first=$2
shift 2
for i in `seq 1 $repeat`
do
  for var in "$@"
  do
      echo $var
      cmd="ssh $var.csail.mit.edu"
      tmux split-window "$cmd"
      tmux select-layout tiled > /dev/null
  done
done
repeat=$((repeat-1))
for i in `seq 1 $repeat`
do
    echo $first
    cmd="ssh $first.csail.mit.edu"
    tmux split-window "$cmd"
    tmux select-layout tiled > /dev/null
done
echo $first
ssh $first.csail.mit.edu
