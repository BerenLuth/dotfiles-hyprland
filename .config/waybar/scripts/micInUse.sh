#!/bin/bash

if pw-top -b -n 2 | grep -qE '^R .*(Mic|input)'; then
    echo "in use"
    exit 0
else
    exit 1
fi