# Crestron Simpl#Pro Post Build Script

This script aims to automate the process of uploading a SIMPL#Pro program to a Crestron processor. This saves developer time by not having to use Toolbox or upload a file via SFTP and then running the PROGLOAD command on the processor.

## Prerequisites

- Python 3 needs to be installed. Check your version by running `python -- version` from the command line.
- The Python module called pysftp needs to be installed. Run `pip install pysftp`.
