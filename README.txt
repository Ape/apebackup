This is just my personal backup script that I decided to share. The script is
really simple and minimal, but may still have some bugs. Please contact me in
case you can suggest any improvements or fixes.

The idea is to have a collection of small subsystems that execute various
backup commands (or anything else). New subsystems may be created by just
adding a folder inside 'subsystem.d'. That folder should contain 'run.sh',
which executes the commands. Nothing else is required, but I have some
conventions like storing any backup data in a folder called 'data' inside the
subsystem.  The subsystems are executed in alphabetical order so integer
prefixes may be added if specific ordering is needed.

The subsystems in this repository are just examples that make a lot of
assumptions about the environment. Do not run the default subsystems directly,
but instead create your own to replace them.
