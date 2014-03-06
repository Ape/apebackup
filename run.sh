#!/bin/sh

function run {
	[[ $# -ne 1 ]] && echo "Usage: $0 <subsystem_directory>" && exit

	for SUBSYSTEM in $(find $1/* -maxdepth 0 -type d); do
		run_subsystem $SUBSYSTEM
	done
}

function run_subsystem {
	[[ $# -ne 1 ]] && echo "Usage: $0 <subsystem>" && exit
	[[ ! -d $1 ]] && echo "Error: Subsystem '$1' not found!" && exit

	echo "## START '$1' @ $(date)"

	(cd $1 && ./run.sh)

	echo "## END   '$1' @ $(date)"
	echo
}

[[ $UID -ne 0 ]] && echo "Error: Must be root" && exit 1

cd /mnt/storage/backup
run subsystems &>> log.txt
