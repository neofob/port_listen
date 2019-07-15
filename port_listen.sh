#!/usr/bin/env bash
# __author__: tuan t. pham

# Requirements: netcat

TIMEOUT=${TIMEOUT:=5}
PORT_NUMBER=${PORT_NUMER:=3000}
LISTEN_APP=${LISTEN_APP:=nc}
APP_OPTS=${APP_OPTS:="-l"}
APP_PID=0
RECV_MSG=0

function check_app()
{
    which ${LISTEN_APP} >/dev/null
    if [[ $? != 0 ]]; then
        echo "${LISTEN_APP} does not exist!"
        exit 1
    fi
}

function listen_port()
{
    ${LISTEN_APP} ${APP_OPTS} ${PORT_NUMBER} &
    APP_PID=$!
}

function wait_pid()
{
    wait ${APP_PID} && RECV_MSG=1
}

function timer()
{
    sleep ${TIMEOUT}
    kill ${APP_PID} 2>/dev/null

    exit 0
}

function finish()
{
    echo "Exit"
    echo "RECV_MSG=${RECV_MSG}"
    if [[ $RECV_MSG -eq 1 ]]; then
        exit 0
    else
        exit 1
    fi
}
function main()
{
    check_app
    listen_port
    timer &
    echo "Waiting on ${APP_PID}"
    wait_pid
}

trap finish EXIT TERM
main
