#!/bin/sh
# Join a build's ISO parts and verify the result against its checksum.
# Run from the root of a checked-out build branch (the workflow does this;
# it also works on a local clone of a build branch).
set -eu

iso=$(sed -n 's/^iso: //p' build.txt)
[ -n "$iso" ] || { echo "build.txt names no iso" >&2; exit 1; }

# Parts are named <iso>.part000, <iso>.part001, ... and sort correctly.
cat parts/"$iso".part* > "$iso"
sha256sum -c "$iso.sha256"
