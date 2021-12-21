#! /usr/bin/env bash

## 
# Called when finished. Moves a download from ${TR_TORRENT_DIR} to its
# destination dir. The destination dir is found by taking the last subdir
# of the torrent dir
## 

SUBDIR=$(basename ${TR_TORRENT_DIR})
DESTDIR="/${SUBDIR}"

echo "$(date): Finished torrenting ${TR_TORRENT_NAME}, moving from ${TR_TORRENT_DIR}/${TR_TORRENT_NAME} to ${DESTDIR}/${TR_TORRENT_NAME}" \
  >> ~/transmission-finisher.log

mv -v ${TR_TORRENT_DIR}/${TR_TORRENT_NAME} ${DESTDIR}/${TR_TORRENT_NAME}

