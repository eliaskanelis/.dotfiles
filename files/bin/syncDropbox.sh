#!/usr/bin/env bash

ORG_DIR=/home/tedi/org
REMOTE=dropbox

find -L $ORG_DIR | entr -r rclone sync -v $ORG_DIR $REMOTE:org
