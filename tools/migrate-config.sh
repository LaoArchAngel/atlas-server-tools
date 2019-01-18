#!/bin/bash

configfile="$1"
newopts=( atlasbackupdir atlasautorestartfile install_bindir install_libexecdir install_datadir mod_appid )
newopt_steamcmd_appinfocache="${PREFIX}/Steam/appcache/appinfo.vdf"
newopt_atlasbackupdir="${PREFIX}/ATLAS-Backups"
newopt_atlasautorestartfile="ShooterGame/Saved/.autorestart"
newopt_install_bindir="${BINDIR}"
newopt_install_libexecdir="${LIBEXECDIR}"
newopt_install_datadir="${DATADIR}"
newopt_mod_appid=834910

if grep '^\(servermail\|atlasstVersion\)=' "${configfile}" >/dev/null 2>&1; then
  sed -i '/^\(servermail\|atlasstVersion\)=/d' "${configfile}"
fi

for optname in "${newopts[@]}"; do
  if ! grep "^${optname}=" "${configfile}" >/dev/null 2>&1; then
    noptname="newopt_${optname}"
    echo "${optname}='${!noptname}'" >>"${configfile}"
  fi
done
