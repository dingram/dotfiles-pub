#!/bin/sh

SKIP_CHECKS=yes compiz --replace --sm-disable ccp >&2 &
PID=$!
emerald --replace &
wait $PID
