#!/bin/bash

notify-send -e "QR reader: READY" && zbarcam -1 | wl-copy && notify-send "QR reader" $(wl-paste)
