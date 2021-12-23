#! /usr/bin/env bash

CATEGORY="$1"
TORRENT="$2"

[ -n "$2" ] || { echo "Usage: $0 <CATEGORY> <MAGNET LINK OR PATH TO TORRENT>" ; exit 1 ; }

DOWNLOAD_DIR="~/TRANSMISSION_DOWNLOADS/${CATEGORY}"

REMOTE=user@basedmiles

PORT=$(( $RANDOM % 50000 + 1024 ))

echo "[+] We're going to use port $PORT"

if [ -f "$2" ] ; then
  echo "[+] $TORRENT is a file, behaving accordingly..."
  REMOTE_TORRENT_LOCATION="/tmp/$(basename TORRENT)"
  scp $TORRENT $REMOTE:"${REMOTE_TORRENT_LOCATION}"
  ssh $REMOTE "mkdir -p ${DOWNLOAD_DIR} && transmission-cli -p $PORT -w ${DOWNLOAD_DIR} -f ~/bin/transmission-finisher.sh ${REMOTE_TORRENT_LOCATION}"
else # assume magnet url
  echo "[+] Assuming $TORRENT is a magnet link, behaving accordingly..."
  MAGNET="$TORRENT"
  ssh $REMOTE "mkdir -p ${DOWNLOAD_DIR} && transmission-cli -p $PORT -w ${DOWNLOAD_DIR} -f ~/bin/transmission-finisher.sh \"${MAGNET}\""
fi
  
