#!/usr/bin/env bash
# __author__: tuan t. pham

# Requirements: netcat for now
# LISTEN APP quits as soon as it received a message and connection is closed by client
# The received message is printed out to STDOUT

TIMEOUT=${TIMEOUT:=5}
PORT_NUMBER=${PORT_NUMER:=3000}
LISTEN_APP=${LISTEN_APP:=nc}
APP_OPTS=${APP_OPTS:="-l"}
APP_PID=0
RECV_MSG_FLAG=0

function echoerr()
{
    echo "$@" 1>&2;
}

function check_app()
{
    which ${LISTEN_APP} >/dev/null
    if [[ $? -ne 0 ]]; then
        echoerr "${LISTEN_APP} does not exist!"
        exit 1
    fi
}

# First fork
function listen_port()
{
    ${LISTEN_APP} ${APP_OPTS} ${PORT_NUMBER} &
    APP_PID=$!
}

# This is a blocking call from main process
function wait_pid()
{
    wait ${APP_PID} && RECV_MSG_FLAG=1
}

# Second fork
function timer()
{
    sleep ${TIMEOUT}
    kill ${APP_PID} 2>/dev/null

    exit 0
}

function finish()
{
    echoerr "Exiting..."
    if [[ $RECV_MSG_FLAG -eq 1 ]]; then
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
    echoerr "Waiting on ${APP_PID}"
    wait_pid
}

trap finish EXIT TERM
main
