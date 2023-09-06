#!/usr/bin/env bash

youdlplaylist() {
  local URL="$1"
  youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' $URL
}

youdlvideo() {
  local URL="$1"
  youtube-dl -o '%(title)s.%(ext)s' --restrict-filenames $URL
}
