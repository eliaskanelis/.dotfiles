#!/usr/bin/env python3

from i3ipc import Connection


def restart():
    i3 = Connection()
    i3.command("reload")
    i3.command("restart")


restart()
