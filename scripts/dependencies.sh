#!/bin/bash
set -e
set -v

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo add-apt-repository --yes ppa:kicad/kicad-8.0-releases
sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt install --install-recommends kicad

mkdir -p ~/.config/kicad
cp /usr/share/kicad/template/fp-lib-table ~/.config/kicad/
cp /usr/share/kicad/template/sym-lib-table ~/.config/kicad/

cp "$DIR/config/eeschema" ~/.config/kicad/
cp "$DIR/config/pcbnew" ~/.config/kicad/