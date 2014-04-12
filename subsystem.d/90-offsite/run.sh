#!/bin/sh

/usr/local/bin/mount-offsite.sh

if [ ! -d "/mnt/offsite/snapshots" ]; then
	echo "Error: Offsite filesystem is not mounted properly."
	/usr/local/bin/umount-offsite.sh
	exit
fi

ARCHIVE_SNAPSHOT=$(btrfs subvolume list /mnt/archive | tail -n1 | rev | cut -d' ' -f1 | rev | cut -d'/' -f2)
OFFSITE_SNAPSHOT=$(btrfs subvolume list /mnt/offsite | tail -n1 | rev | cut -d' ' -f1 | rev | cut -d'/' -f2)

if [ $ARCHIVE_SNAPSHOT -le $OFFSITE_SNAPSHOT ]; then
	echo "Error: Snapshot numbers are invalid ('$ARCHIVE_SNAPSHOT' with parent '$OFFSITE_SNAPSHOT')."
	/usr/local/bin/umount-offsite.sh
	exit
fi

echo "Sending snapshot $ARCHIVE_SNAPSHOT with parent $OFFSITE_SNAPSHOT"

sync
btrfs send /mnt/archive/.snapshots/$ARCHIVE_SNAPSHOT/snapshot -p /mnt/archive/.snapshots/$OFFSITE_SNAPSHOT/snapshot | btrfs receive /mnt/offsite/snapshots
mv /mnt/offsite/snapshots/snapshot /mnt/offsite/snapshots/$ARCHIVE_SNAPSHOT

/usr/local/bin/umount-offsite.sh
