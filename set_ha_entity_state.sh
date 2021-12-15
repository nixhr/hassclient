#!/bin/bash
source /opt/hassclient/hassclient.cfg

#ENTITY=x270_screenlock
ENTITY=$1

# STATE can be: 'LOCKED' or 'UNLOCKED'
STATE=$2

curl -X POST -H "Authorization: Bearer ${HATOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"state": "'$STATE'"}' \
  "${APIHOSTPORT}/api/states/binary_sensor.${ENTITY}"
