#!/usr/bin/env bash

command_exists() {
    type "$@" > /dev/null 2>&1
}

updates_available=0

if command_exists pamac; then
    updates_available=$(pamac checkupdates -a -q | wc -l)
elif command_exists checkupdates; then
    updates_available=$(checkupdates | wc -l)
else
    exit 1
fi

    
if [ "$updates_available" -eq 0 ]; then
    class="uptodate"
    tooltip="Your system is up-to-date"
else
    class="needsupdate"
    tooltip="$updates_available updates available"
fi

echo -e "{\"class\": \"$class\",\"percentage\": $updates_available,\"tooltip\": \"$tooltip\"}"
