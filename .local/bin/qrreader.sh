#!/bin/bash

notify-send -e "QR reader: READY" && zbarcam -1 --nodisplay | wl-copy && notify-send "QR reader" $(wl-paste)
