#!/bin/bash
#
# uninstall.sh

BINDIR="/usr/bin"
DATADIR="/usr/share/atlasmanager"
LIBEXECDIR="/usr/libexec/atlasmanager"
INITSCRIPT=

if [ -f "/etc/rc.d/init.d/atlasmanager" ]; then
  INITSCRIPT="/etc/rc.d/init.d/atlasmanager"
  if [ -f "/etc/rc.d/init.d/functions" ]; then
    chkconfig atlasmanager off
  fi
elif [ -f "/etc/init.d/atlasmanager" ]; then
  INITSCRIPT="/etc/init.d/atlasmanager"
  if [ -f "/lib/lsb/init-functions" ]; then
    update-rc.d -f atlasmanager remove
  elif [ -f "/sbin/runscript" ]; then
    rc-update del atlasmanager default
  fi
elif [ -f "/etc/systemd/system/atlasmanager.service" ]; then
  INITSCRIPT="/etc/systemd/system/atlasmanager.service"
  systemctl disable atlasmanager.service
fi

if [ -n "$INITSCRIPT" ]; then
  for f in "${INITSCRIPT}" \
           "${BINDIR}/atlasmanager" \
           "${LIBEXECDIR}/atlasmanager.init" \
           "${LIBEXECDIR}/atlasmanager-uninstall.sh"
  do
    if [ -f "$f" ]; then
      rm "$f"
    fi
  done
fi

# remove bash_completion.d
if [ -f "/etc/bash_completion.d/atlasmanager" ]; then
   rm "/etc/bash_completion.d/atlasmanager"
fi
