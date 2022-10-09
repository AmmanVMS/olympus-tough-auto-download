#!/bin/bash

set -e

cd "`dirname \"$0\"`"

secret="./download.sh-jsdkfhsdjhkfhdskjhfkjsdhkjfhdskhfkjhsdkhfkjs.secret.sh"

if ps -e | grep -q "$secret"; then
  echo "Job already running."
  exit
else
  echo "Nothing running... starting download."
fi

(
  date
  cp ./download.sh "$secret"
  "$secret"
) 1> cron.log 2>cron.log
