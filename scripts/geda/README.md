# gEDA tools in Docker

The AYAB Interface board (`ayab-interface/`) is designed with the gEDA tool
suite: the schematic in gschem format, the layout in gEDA pcb. Those tools are
no longer packaged for macOS, so this directory provides a Docker image with:

- **Lepton EDA 1.9.18** (maintained fork of gschem): `lepton-schematic`,
  `lepton-netlist`, `lepton-cli`
- **gEDA pcb 4.2.2**, the last version Debian shipped
- **gerbv**, to view and render Gerber files

The GUI tools run on a virtual desktop inside the container (TigerVNC's X
server with the Openbox window manager) that you view with a VNC client.

## Opening the schematic or layout

From the repository root:

```sh
scripts/geda-gui.sh lepton-schematic ayab-interface/schematic/ayab_rs.sch
scripts/geda-gui.sh pcb ayab-interface/layout/ayab_rs.pcb
```

The first command builds the image if needed, starts the desktop (container
`ayab-geda`) and opens a viewer on it. Later commands open more apps on the
same desktop, so the schematic and layout can be open side by side; switch
windows with their title bars or Alt-Tab. The whole repository is mounted at
`/work`, so saving writes straight to your working tree.

```sh
scripts/geda-gui.sh view   # open another viewer on the running desktop
scripts/geda-gui.sh stop   # stop the desktop (unsaved work is lost)
```

The desktop keeps running until stopped. After changing anything in this
directory, stop it so the next launch rebuilds the image.

## Viewers

VNC listens on `localhost:5901` only, password `ayab`. `geda-gui.sh` opens, in
order of preference:

1. **TigerVNC viewer**, recommended: much more responsive than macOS Screen
   Sharing with this server. Install it with
   `brew install --cask tigervnc-viewer` (macOS) or your distribution's
   `tigervnc-viewer` package (Linux).
2. **macOS Screen Sharing**, if TigerVNC is not installed.
3. Otherwise it prints the address to use with any VNC client.

To connect manually, point a VNC client at `localhost:5901` with password
`ayab`, or on macOS `open vnc://:ayab@localhost:5901`.

Settings, read when the desktop starts:

| Variable       | Default     |                              |
| -------------- | ----------- | ---------------------------- |
| `VNC_PORT`     | `5901`      | port on localhost            |
| `VNC_PASSWORD` | `ayab`      | VNC password                 |
| `GEOMETRY`     | `1680x1000` | desktop size; smaller is faster |

## Command-line use

The image also runs the tools without a desktop. Build it once with
`docker build -t ayab-geda scripts/geda`, then from the repository root:

```sh
# Regenerate the netlist from the schematic
# (ayab-interface/schematic/lepton.conf turns off hierarchy traversal)
docker run --rm -v "$PWD":/work -w /work/ayab-interface/schematic ayab-geda \
  lepton-netlist -g PCB -o ayab_rs.net ayab_rs.sch

# Export Gerbers and drill files
docker run --rm -v "$PWD":/work -w /work/ayab-interface/layout ayab-geda \
  pcb -x gerber --gerberfile gerber/ayab_rs ayab_rs.pcb

# Export the schematic as PDF
docker run --rm -v "$PWD":/work -w /work/ayab-interface/schematic ayab-geda \
  lepton-cli export -o ayab_rs.pdf ayab_rs.sch

# Run pcb actions headlessly, e.g. open and resave the layout
docker run --rm -v "$PWD":/work -w /work/ayab-interface/layout ayab-geda \
  xvfb-run -a pcb --action-string "SaveTo(Layout) Quit()" ayab_rs.pcb

# Run the design rule check and write every violation to drc.report
docker run --rm -v "$PWD":/work -w /work/ayab-interface/layout ayab-geda \
  xvfb-run -a pcb --action-string "DRC() DRCReport(drc.report) Quit()" ayab_rs.pcb
```
