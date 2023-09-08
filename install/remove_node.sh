#!/bin/bash
sudo apt-get purge nodejs
sudo apt-get purge npm
sudo rm -r /etc/apt/sources.list.d/nodesource.list
sudo rm -r /etc/apt/keyrings/nodesource.gpg
