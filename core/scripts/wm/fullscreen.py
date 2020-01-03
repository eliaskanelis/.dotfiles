#!/usr/bin/env python3

from i3ipc import Connection


# Toggle fullscreen from the focused container
def fullscreen():
    i3 = Connection()
    i3.command("fullscreen toggle")


fullscreen()
