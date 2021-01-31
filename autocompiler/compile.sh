#!/bin/bash
cd /multitheftauto_linux_x64/
EXT="c"
BAK=".bak"

inotifywait -q -r -m -e close_write,moved_to . --format "%w %f" | 
  while read DIR i; do
  cd $DIR
    if [ -d "$i" ]; then
      sleep 1 
    elif [ -f "$i" ]; then
      # Compile if lua file
      if [ ${i: -4} == ".lua" ]; then
        #cp $i $i$BAK
       /app/luac_mta -s -e2 -o $i$EXT $i
        echo "[Compiling] $i"
      fi
    fi
    cd /multitheftauto_linux_x64/
  done