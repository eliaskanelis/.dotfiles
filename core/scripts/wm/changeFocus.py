#!/usr/bin/env python3

import sys
import subprocess
from i3ipc import Connection


# ------------------------------------------------------------------------------
# Notify-send
def notify_send(msg):
    subprocess.call(['notify-send', 'WM', msg])

# ------------------------------------------------------------------------------
# App


# @direction up, down, right, left
def changeFocus(direction):
    i3 = Connection()
    if direction == "up":
        pass
    elif direction == "down":
        pass
    elif direction == "right":
        pass
    elif direction == "left":
        pass
    else:
        pass

    i3.command(f"focus {direction}")


argv = len(sys.argv)
if argv != 2:
    notify_send(f"Failed to change focus")
    exit

direction = str(sys.argv[1])
changeFocus(direction)
