#!/data/data/com.termux/files/usr/bin/sh
unset LD_PRELOAD
ARGS="$ARGS --link2symlink"
ARGS="$ARGS -0"
ARGS="$ARGS -r $PREFIX/../home/stable"
for f in dev proc sys; do
	ARGS="$ARGS -b /$f:/$f"
done
if [ -d /sdcard ] && [ -d $PREFIX/../home/stable/media/sdcard ]; then
	ARGS="$ARGS -b /sdcard:/media/sdcard"
fi
ARGS="$ARGS -b $PREFIX/../home/:/root"
ARGS="$ARGS --cwd=/"
ARGS="$ARGS /usr/bin/env -i"
ARGS="$ARGS -i HOME=/root"
ARGS="$ARGS TERM=$TERM"
ARGS="$ARGS LANG=C.UTF-8"
ARGS="$ARGS PATH=/bin:/usr/bin:/sbin:/usr/sbin:/bin"
PROGRAM=/bin/bash
if [ -z "$1" ];then
	ARGS="$ARGS $PROGRAM --login"
	exec proot $ARGS
else
	ARGS="$ARGS --cwd=."
	exec proot $ARGS sh -c "$*"
fi
