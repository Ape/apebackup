#!/bin/sh

rsync -a --delete -r --files-from=target.txt / data
