#!/bin/bash
[ "$(ddcutil --display 1 getvcp 10 | sed -n 's/.*current value = *\([0-9]\+\).*/\1/p')" -eq 100 ] && echo true || echo false
