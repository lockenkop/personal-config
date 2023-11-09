#!/bin/sh

if ! [ -f ~/.vnc/mersewm_passwd ]; then
  echo "passwd File download"
  scp travis@travis-wm:/home/travis/.vnc/passwd ~/.vnc/mersewm_passwd
else
  echo "passwd found, skipping download"
fi

echo "opening ssh tunnel"
ssh -fL 6001:localhost:5901 travis@travis-WM sleep 1

echo "connecting vnc viewer"
vncviewer -SecurityTypes VncAuth -passwd ~/.vnc/mersewm_passwd localhost:6001 
