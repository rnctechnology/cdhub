#!/bin/bash
#by RNCTechnology
#Author Zilin Chen zilinchen@yahoo.com
set -e

configDone="/tmp/configDone"
msg="MariaDB configure and setup done!"
dd=`date +%Y-%m-%d:%H:%M:%S`
if [ ! -f $configDone ]; then
  #if [ $(grep "$msg" $configDone | wc -l) -lt 1 ]; then
  #fi
  echo "start configure MariaDB on $dd ...." > $configDone

  /root/configMariaDB.sh $ROOT_PWD

  echo 'Finished configure MariaDB!' >> $configDone

  if [ -z $TA_PWD ]; then
    /root/configComponents.sh $ROOT_PWD $AMBARI_PWD $HIVE_PWD $OOZIE_PWD
  else
    /root/configComponents.sh $ROOT_PWD $AMBARI_PWD $HIVE_PWD $OOZIE_PWD $TA_PWD
  fi

  echo $msg >> $configDone
fi

bash
