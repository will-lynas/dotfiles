#!/bin/bash

#backup_rm ~/.bashrc
[ -f ~/.bashrc ] || cp /etc/skel/.bashrc ~/.bashrc
LINE="source ~/.df/bash/bashrc"
echo "$LINE" >> ~/.bashrc
