#!/usr/bin/env bash
pkill waybar 2>/dev/null
nohup waybar > /tmp/waybar.log 2>&1 &
disown
