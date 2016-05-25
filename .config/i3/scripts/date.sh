#!/bin/bash

date '+%A, %B %_d, %Y  %r'

case $BLOCK_BUTTON in
  1) orage ;;
  3) pkill orage ;;
esac
