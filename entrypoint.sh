#!/bin/bash
sleep 2

# Make tmp dir
export TMPDIR=/home/container/tmp/

if [ -d "/home/container/tmp/" ] 
then
    mkdir /home/container/tmp/
fi

cd /home/container
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Run the Server
/usr/local/bin/python3.9 -m pip install pip==20.3.4
/usr/local/bin/python3.9 -m pip install --no-cache-dir -r requirements.txt
${MODIFIED_STARTUP}
