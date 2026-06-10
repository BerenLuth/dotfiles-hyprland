#!/usr/bin/env bash

set -euo pipefail

echo "Detecting displays..."

# Extract display numbers from ddcutil detect output
mapfile -t displays < <(ddcutil detect | awk '/Display [0-9]+/ {print $2}')

if [[ ${#displays[@]} -eq 0 ]]; then
  echo "No displays found."
  exit 1
fi

echo "Found displays: ${displays[*]}"

for d in "${displays[@]}"; do
  echo "Waking display $d..."

  # Power mode: 0xD6 = 0x01 (On)
  ddcutil setvcp 0xD6 1 --display "$d" || {
    echo "Warning: failed to wake display $d"
  }
done

echo "Done."
