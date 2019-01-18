#!/bin/bash
#
# uninstall-user.sh

BINDIR="/home/steam/bin"
DATADIR="/home/steam/.local/share/atlasmanager"

for f in "${BINDIR}/atlasmanager" \
         "${DATADIR}/uninstall.sh"
do
  if [ -f "$f" ]; then
    rm "$f"
  fi
done
