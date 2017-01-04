#!/bin/sh
lock() {
    ~/dev/scripts/i3l.sh
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && sudo pm-suspend
        ;;
    hibernate)
        s2both
        ;;
    reboot)
        sudo /sbin/reboot
        ;;
    shutdown)
        sudo /sbin/poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
