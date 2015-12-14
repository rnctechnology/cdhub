#!/bin/bash

./installServer hdp

sleep 20

./installAgents hdp

sleep 60

./createCluster hdp
