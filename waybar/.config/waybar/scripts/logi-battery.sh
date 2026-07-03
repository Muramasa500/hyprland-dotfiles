#!/usr/bin/env bash
# Usage: logi-battery.sh "<name substring from `solaar show`>"
DEVICE="$1"
PCT=$(solaar show 2>/dev/null | awk -v dev="$DEVICE" '
  $0 ~ dev {found=1}
  found && match($0, /[0-9]+%/) {print substr($0, RSTART, RLENGTH); exit}
')
echo "${PCT:-N/A}"
