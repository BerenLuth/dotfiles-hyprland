#!/usr/bin/env bash

set -euo pipefail

echo "Detecting displays..."

mapfile -t displays < <(ddcutil detect | awk '/Display [0-9]+/ {print $2}')

if [[ ${#displays[@]} -eq 0 ]]; then
  echo "No displays found."
  exit 1
fi

echo "Found displays: ${displays[*]}"

for d in "${displays[@]}"; do
  echo "Putting display $d to sleep..."

  # Power mode: 0xD6 = 0x04 (Standby / Sleep)
  ddcutil setvcp 0xD6 4 --display "$d" || {
    echo "Warning: failed to sleep display $d"
  }
done

echo "Done."
