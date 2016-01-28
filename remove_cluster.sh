#!/bin/bash

BPSTACK=hdp
if [ $# -gt 0 ]; then
  var1=$1
  if [ "${var1,,}" = "iop" ]; then
   BPSTACK="iop"
  fi
fi

if [ "$BPSTACK" = "hdp" ]; then
  ./cleanupServer hdp
  sleep 30 
  ./cleanupAgents hdp
else
  ./cleanupServer iop
  sleep 30
  ./cleanupAgents iop
fi

sleep 60
./preCheckAll
