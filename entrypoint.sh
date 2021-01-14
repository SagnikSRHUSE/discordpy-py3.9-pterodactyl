#!/bin/bash
sleep 2

cd /home/container
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Run the Server
/usr/local/bin/python -m pip install --upgrade pip
/usr/local/bin/python -m pip install -q -r requirements.txt
${MODIFIED_STARTUP}
