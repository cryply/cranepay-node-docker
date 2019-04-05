#!/bin/sh
set -e

if [ "$1" = 'cranepayd' ]; then
    shift
    exec cranepayd -datadir=/data "$@"
fi

if [ "$1" = 'cranepay-cli' ]; then
    shift
    exec cranepay-cli -datadir=/data "$@"
fi

exec "$@"
