#!/bin/bash

# basic i3 lock

# i3lock -u -c "101218"

# Takes screenshot of desktop blurs and locks
# ~/.i3/i3lock-fancy/lock


# suspending dunst
# pkill -u "$USER" -USR1 dunst

# just a simple lock with style inside
i3lock --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e \
        --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 \
        --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c \
        -c "101218"
        -n

# resume message display
# pkill -u "$USER" -USR2 dunst
