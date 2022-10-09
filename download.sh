#!/bin/bash
#
# Copy files automatically from the camera
#
# configuration
DIRECTORY="/data/share/Tough-Camera"
IP=192.168.0.10
BASE_URL="http://$IP/DCIM/100OLYMP"

# constants
PICTURES="pictures.html"

set -e

cd "`dirname \"$0\"`"

if ! [ -d "$DIRECTORY" ]; then
  echo "Cannot access share directory. Exiting."
  exit 1
fi

if ! ping -c 1 "$IP"; then
  echo "Cannot reach $IP. Exiting."
  exit 2
fi

wget --quiet -O "$PICTURES" "$BASE_URL"
pictures="`cat \"$PICTURES\" | grep -oE '[^, ]*\.JPG'`"
#echo "Pictures: $pictures"

for picture in $pictures; do
  echo -n "Downloading $picture ... "
  if wget --quiet --continue -O "$DIRECTORY/$picture" "$BASE_URL/$picture"; then
    echo "ok"
  else
    echo "fail"
  fi
done
