#!/bin/bash
# Open design files in lepton-schematic or pcb on a shared desktop running in Docker,
# displayed over VNC. The desktop is started on first use and keeps running.
# See scripts/geda/README.md.
# Usage: scripts/geda-gui.sh lepton-schematic ayab-interface/schematic/ayab_rs.sch
#        scripts/geda-gui.sh pcb ayab-interface/layout/ayab_rs.pcb
#        scripts/geda-gui.sh view    # open another viewer on the running desktop
#        scripts/geda-gui.sh stop
# Environment (read when the desktop starts):
#   VNC_PORT (default 5901), VNC_PASSWORD (default ayab), GEOMETRY (default 1680x1000)
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO="$( cd "$DIR/.." && pwd )"
NAME=ayab-geda
PORT="${VNC_PORT:-5901}"
PASSWORD="${VNC_PASSWORD:-ayab}"

running() { [ "$( docker inspect -f '{{.State.Running}}' "$NAME" 2>/dev/null )" = true ]; }

# Prefer the TigerVNC viewer (much snappier than macOS Screen Sharing), then
# Screen Sharing, otherwise print the address for any VNC client.
view() {
  PORT="$( docker port "$NAME" 5900 | head -1 | sed 's/.*://' )"
  PASSFILE="${TMPDIR:-/tmp}/$NAME.vncpasswd"
  docker exec -e P="$PASSWORD" "$NAME" sh -c 'printf "%s\n" "$P" | vncpasswd -f' >"$PASSFILE"
  chmod 600 "$PASSFILE"
  if [ "$(uname)" = Darwin ] && [ -d /Applications/TigerVNC.app ]; then
    open -n -a TigerVNC --args -passwd "$PASSFILE" "localhost:$PORT"
  elif command -v vncviewer >/dev/null; then
    vncviewer -passwd "$PASSFILE" "localhost:$PORT" >/dev/null 2>&1 &
  elif [ "$(uname)" = Darwin ]; then
    open "vnc://:$PASSWORD@localhost:$PORT"
  else
    echo "Connect a VNC viewer to localhost:$PORT (password: $PASSWORD)"
  fi
}

case "$1" in
  stop) docker stop "$NAME" >/dev/null; exit ;;
  view) running || { echo "$NAME is not running" >&2; exit 1; }; view; exit ;;
esac

APP="$1"
FILE="$( cd "$( dirname "$2" )" && pwd )/$( basename "$2" )"
case "$FILE" in
  "$REPO"/*) ;;
  *) echo "$2 is not inside $REPO" >&2; exit 1 ;;
esac
REL="${FILE#$REPO/}"

if ! running; then
  docker build -q -t ayab-geda "$DIR/geda" >/dev/null
  # The whole repo is mounted so that pcb can reach the schematic's netlist
  docker run -d --rm --name "$NAME" -p "127.0.0.1:$PORT:5900" \
    -e VNC_PASSWORD="$PASSWORD" -e GEOMETRY="${GEOMETRY:-1680x1000}" \
    -v "$REPO":/work ayab-geda start-vnc >/dev/null
  for i in $(seq 1 100); do nc -z localhost "$PORT" 2>/dev/null && break; sleep 0.2; done
  STARTED=1
fi

docker exec -d -e DISPLAY=:1 -w "/work/$( dirname "$REL" )" "$NAME" "$APP" "$( basename "$REL" )"

if [ -n "$STARTED" ]; then view; fi
