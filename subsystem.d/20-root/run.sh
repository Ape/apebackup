#!/bin/sh

mkdir -p data
rsync -a --delete -r --files-from=target.txt --exclude-from=exclude.txt / data
