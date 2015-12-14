#!/bin/bash

./cleanupServer hdp
sleep 30

./cleanupAgents hdp

sleep 60

./preCheckAll
