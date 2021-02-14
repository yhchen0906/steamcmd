#! /bin/sh

if [ ! -x "${STEAMROOT}/steamcmd.sh" ]; then
  DOWNLOAD_URL="https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"
  mkdir -p "${STEAMROOT}"
  wget -qO- "${DOWNLOAD_URL}" | tar zxvC /opt/Steam
  "${STEAMROOT}/steamcmd.sh" +quit
fi

exec "$@"