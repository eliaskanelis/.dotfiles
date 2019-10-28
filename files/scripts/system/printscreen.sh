#!/bin/bash

# Print the screen

scrot -e 'mv $f /tmp/ && gimp /tmp/$f' --quality 100
