#!/bin/sh

rsync -a --relative --delete /boot /etc /usr/local /var/lib /home /srv data
