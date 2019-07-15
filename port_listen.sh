#!/usr/bin/env bash
# __author__: tuan t. pham

# Requirements: netcat

TIMEOUT=${TIMEOUT:=5}
PORT_NUMBER=${PORT_NUMER:=3000}
LISTEN_APP=${LISTEN_APP:=nc}
APP_OPTS=${APP_OPTS:="-l"}

which ${LISTEN_APP} >/dev/null
if [[ $? != 0 ]]; then
    echo "${LISTEN_APP} does not exist!"
    exit 1
fi

${LISTEN_APP} ${APP_OPTS} ${PORT_NUMBER} &
APP_PID=$!

sleep ${TIMEOUT}
kill ${APP_PID} 2>/dev/null

if [[ $? == 0 ]]; then
    exit 1
else
    exit 0
fi

