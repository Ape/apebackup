#!/bin/sh

rsync -a --inplace --delete -r --files-from=target.txt / /mnt/archive
snapper -c archive create -c timeline
snapper -c archive cleanup timeline
