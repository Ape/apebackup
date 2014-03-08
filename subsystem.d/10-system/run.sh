#!/bin/sh

mkdir -p data
uname -a > data/kernel.txt
pacman -Q > data/pacmanpkg.txt
