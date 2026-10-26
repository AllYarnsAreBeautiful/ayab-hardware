FROM debian:bookworm-slim
# pcb is 4.2.2, the last version Debian shipped
# GUI apps run on TigerVNC's X server (Mesa software GL for pcb), started by start-vnc;
# xvfb is kept for headless scripted runs (xvfb-run)
RUN apt-get update && apt-get install -y --no-install-recommends lepton-eda pcb-gtk fonts-dejavu-core \
    gerbv xvfb xauth libgl1-mesa-dri tigervnc-standalone-server tigervnc-tools openbox xdotool x11-apps \
 && rm -rf /var/lib/apt/lists/*
# Open the main pcb and lepton-schematic windows maximized; dialogs keep their size
RUN sed -i 's|</applications>|<application title="* - PCB"><maximized>yes</maximized></application>\
<application class="Guile-3.0" type="normal"><maximized>yes</maximized></application>\
</applications>|' /etc/xdg/openbox/rc.xml
COPY start-vnc /usr/local/bin/start-vnc
RUN mkdir -m 1777 /tmp/.X11-unix && useradd -m -u 501 user
USER user
