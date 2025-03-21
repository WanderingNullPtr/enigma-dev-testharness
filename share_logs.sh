#!/bin/bash

if [[ $# -gt 0 ]]; then
    cd test-harness-out
    mkdir "$1"
fi
for log in "/tmp/enigma_libegm.log" "/tmp/enigma_compiler.log" "/tmp/enigma_compile.log" "/tmp/enigma_game.log";
do
  echo -n "$log: "
  cat $log | sed -r 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g' | curl -F 'sprunge=<-' http://sprunge.us
  if [[ $# -gt 0 ]]; then
    mv "$log" "$1"
  fi
  if [[ "$TRAVIS" == "true" ]]; then 
    rm -f "$log"
  fi

done
