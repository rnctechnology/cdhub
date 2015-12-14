# cdhub
cloud data hub

## Features
1, deploy Hadoop Cluster on 3-master nodes and x-data nodes
2, cleanup Hadoop Cluster for reinstall
3, prepare hosts for Hadoop Cluster installation
4, current support HDP 2.3 stack

## Requirements
Currently only support linux 64 bits binary (CentOS 6.x / RedHat 6.x)
based on Apache Ambari 2.1.x Open Source
passwordless SSH from Ambari-server node to all other nodes

## Usage
./hdp.sh   -- create new Hadoop Cluster (HDP 2.3)
./cleanup.sh  -- cleanup existing cluster and prepare hostsfor new installation
./preCkeckAll -- prepare hosts for new installation
./utils/setSSH -- setup passwordless SSH

## Configuration
 all default configuartion are in blueprint file.
 Ambari-server http port 8088, admin user default admin/admin
 All components default password is "Admin123"
