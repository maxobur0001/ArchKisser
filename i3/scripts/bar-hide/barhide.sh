#!/bin/bash
is_runned=`ps aux | grep polybar | grep -v grep`

if [ "$is_runned" != "" ]
then
  i3-msg gaps top all set 0
  killall polybar
else
  i3-msg gaps top all set 50
  polybar&
fi
