#!/bin/bash
set -e
set -v

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo add-apt-repository --yes ppa:kicad/kicad-9.0-releases
sudo apt-get update -qq
sudo apt-get install -qy --install-recommends kicad kicad-packages3d kicad-demos-
sudo apt-get install -qy python3 pip ghostscript

sudo python3 -m pip install pandas
