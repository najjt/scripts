#!/bin/sh

# Make sure only one instance is running
start() {
  [ -z "$(pidof -x $1)" ] && ${2:-$1 --notify=none} &
}

start pasystray
