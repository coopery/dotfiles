#!/bin/bash

date '+%A, %B %_d, %Y  %r'

case $BLOCK_BUTTON in
  1) pkill orage || orage & ;; # open/close orage on left click
esac
