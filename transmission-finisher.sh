#! /usr/bin/env bash

## 
# Called when finished. Moves a download from ${TR_TORRENT_DIR} to its
# destination dir. The destination dir is found by taking the last subdir
# of the torrent dir
## 

[ -n "${TR_TORRENT_DIR}" ] || { echo "TR_TORRENT_DIR not defined"; exit 1; }
[ -n "${TR_TORRENT_NAME}" ] || { echo "TR_TORRENT_NAME not defined"; exit 1; }

SUBDIR=$(basename ${TR_TORRENT_DIR})
DESTDIR="/${SUBDIR}"

echo "$(date): Finished torrenting ${TR_TORRENT_NAME}, moving from ${TR_TORRENT_DIR}/${TR_TORRENT_NAME} to ${DESTDIR}/${TR_TORRENT_NAME}" \
  >> ~/transmission-finisher.log

mv -v "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}" "${DESTDIR}/${TR_TORRENT_NAME}"

echo "Attempting to kill parent process..."

kill $PPID




