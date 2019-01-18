#!/bin/bash

configfile="$1"
instancefile="$2"

if ! grep '^atlasSingleInstance=' <"$configfile" >/dev/null 2>&1 && grep "^atlasserverroot=" <"$configfile" >/dev/null 2>&1 && [ ! -f "$instancefile" ]; then
  sed -n '/^#*\(atlas\(\|flag\|opt\)_[^=]*\|atlasserverroot\|serverMap\(\|ModId\)\)=/p' <"$configfile" >"$instancefile"
  sed -i '/^atlas\(serverroot\|_\(RCONPort\|Port\|QueryPort\)\)=/d' "$configfile"
  echo 'defaultinstance="main"' >>"$configfile"
fi
