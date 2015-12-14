# cdhub
Cloud Deployment HUB<br>
RNCTechnology is your best friend for cloud hadoop cluster deployment<br>
please find what you want here /github.com/rnctechnology/cdhub/ <br>

## Features
1, deploy Hadoop Cluster on 3-master nodes and x-data nodes<br>
2, cleanup Hadoop Cluster for reinstall<br>
3, prepare hosts for Hadoop Cluster installation<br>
4, current support HDP 2.3 stack<br>

## Requirements
Currently only support linux 64 bits binary (CentOS 6.x / RedHat 6.x)<br>
based on Apache Ambari 2.1.x Open Source<br>
passwordless SSH from Ambari-server node to all other nodes<br>

## Usage
1, edit hosts.txt file base on your layout <br>
2, setup SSH passwordless <br>
   ./utils/setSSH -- setup passwordless SSH<br>
3, run preCheckAll <br>
   ./preCkeckAll -- prepare hosts for new installation<br> 
4, create brand new hadoop cluster<br>
   ./hdp.sh   -- create new Hadoop Cluster (HDP 2.3)<br>

for reinstall your cluster <br>
1, ./cleanup.sh  -- cleanup existing cluster and prepare hostsfor new installation<br>
2, ./hdp.sh <br>


## Configuration
 all default configuartion are in blueprint file.<br>
 Ambari-server http port 8088, admin user default admin/admin<br>
 All components default password is "Admin123"<br>
