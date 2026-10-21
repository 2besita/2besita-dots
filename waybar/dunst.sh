#!/usr/bin/env bash

[ "$1" = "toggle" ] && dunstctl set-paused toggle
[ "$(dunstctl is-paused)" = "true" ] && echo "󱏧" || echo ""
