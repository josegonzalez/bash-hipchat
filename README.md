# bash-hipchat

Send hipchat notifications from the command line

## Requirements

- `curl` on the commandline
- `getopts` support in your shell

## Tested against

- `bash` version 3.2

## Installation

Create a directory to hold your personal shell scripts:

    cd ~
    mkdir -p scripts

Then clone this repo there

    cd ~/scripts
    git clone https://github.com/josegonzalez/bash-hipchat.git

Then add this directory to your `PATH` within your `.bashrc` or `.bash_profile`:

    export PATH=${PATH}:${HOME}/scripts/hipchat.sh

# Usage

Run the following command:

    hipchat.sh -h

To get usage instructions:

    hipchat.sh

    usage:

      -h                - This help screen
      -a AUTH_TOKEN     - Authentication token (no default)
      -c COLOR          - Color of notification (default: yellow)
      -f FROM           - Who to send from (default: Nobody)
      -m MESSAGE_FORMAT - Message format (default: html)
      -n NOTIFY         - Whether to notify channel users (default: 0)
      -r ROOM_ID        - Room id (default: 31226)
      
# TODO

- Some sort of unit testing
- Fallback for installations without `curl` - `wget`?
- Proper exit code based on curl response

# License

MIT License
