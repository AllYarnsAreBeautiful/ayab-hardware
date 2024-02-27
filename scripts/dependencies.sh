#!/bin/bash
set -e

if [[ -z "${GITHUB_WORKFLOW}" ]]; then
    >&2 echo "Aborting! This script is meant to be run in CI (Github Actions) only. It may modify/damage your system configuration if run outside of CI."
    exit 1
fi

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