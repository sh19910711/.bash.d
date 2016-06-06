aizu_hosts() {
  for x in $(seq 1121 1125); do
    echo stdrsv$x
  done
  for x in $(seq 1 5); do
    echo std34rsv$x
  done
  for x in $(seq 2121 2128); do
    echo stdrsv$x
  done
  for x in $(seq 3121 3123); do
    echo stdrsv$x
  done
}

# aizu_pkill <id>
aizu_pkill() {
  local user=$1; shift
  for host in $(aizu_hosts); do
    echo host: ${host}
    ssh -2C -i $HOME/.ssh/id_aizu $user@$host.u-aizu.ac.jp pkill -u $user
  done
}
