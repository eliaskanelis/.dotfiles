#!/usr/bin/env bash

# Get zoom
ZOOM_DEB=~/dow/zoom_amd64.deb
PATCHED_ZOOM_DEB=~/dow/patched_zoom_amd64.deb


scratch=$(mktemp -d)

# Extract package contents
dpkg -x "${ZOOM_DEB}" "${scratch}"

# Extract package control information
dpkg -e "${ZOOM_DEB}" "${scratch}"/DEBIAN

# Remove the ibus dependency
sed -i -E 's/(ibus, |, ibus)//' "${scratch}"/DEBIAN/control

# Rebuild the .deb
dpkg -b "${scratch}" "${PATCHED_ZOOM_DEB}"

# Install patched zoom
sudo dpkg -i "${PATCHED_ZOOM_DEB}"
