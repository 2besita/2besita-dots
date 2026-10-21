#!/usr/bin/env bash

cp "$1" "$HOME/Imagetic/papes/current.png"
awww img --transition-type outer --transition-step 90 --transition-fps 120 --resize crop "$1"
