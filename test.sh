#!/usr/bin/env bash

topo="clab-02_bgp_fix"

testping() {
  # echo -n "Ping $1  -> $2  "
  dest=$2
  docker exec -it $topo-$1 ping -c1 -W1 ${!dest} > /dev/null
  if [ $? -eq 0 ]; then echo -n "   ok  "; else echo -e -n " \033[31m FAIL \033[0m"; fi
}

pingall() {
  nodes=$1
  # Create Header Line
  echo -n "    "
  for dest in ${nodes}; do
  printf "%-7s" ${dest}
  done
  echo ""
  #
  # Now go through each source
  for source in ${nodes}; do
    echo -n "${source}"
    for dest in ${nodes}; do
      if [ ${source} = ${dest} ]; then
        echo -n "  ---- "
      else
        testping ${source} ${dest}
      fi
    done
    echo ""
  done 
}

nodes="h1 h2 h3 h4"

echo "Ping from each Host to each other host"
echo ""
echo "IPv4:"
h1="192.168.1.2"
h2="192.168.2.2"
h3="192.168.2.66"
h4="192.168.3.2"
pingall "${nodes}"
#

