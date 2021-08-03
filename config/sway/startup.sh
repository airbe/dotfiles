#!/usr/bin/env bash

swaymsg exec "pulseaudio --daemonize"
swaymsg exec "redshift"
swaymsg exec "mako"
swaymsg exec "kanshi"
