#!/bin/bash

command() {
  local root=$(dirname ${BASH_SOURCE})/../
  pushd ${root}/docker
  for x in *; do
    pushd $x
    sudo docker build -t .bash.d/$x .
    popd
  done
  popd
}

command $@
