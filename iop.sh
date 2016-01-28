#!/bin/bash

./installServer iop

sleep 20

./installAgents iop

sleep 60

./createCluster iop
