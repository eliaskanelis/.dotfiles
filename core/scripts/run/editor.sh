#!/usr/bin/env bash

# Run emacs

file="${1}"

if [[ -z "${file}" ]]; then
    emacsclient -create-frame --alternate-editor=
else
    emacsclient -create-frame --alternate-editor= "${file}"
fi
