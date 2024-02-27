# AYAB Hardware
[![AYAB-ESP32 Status](https://github.com/VIPQualityPost/ayab-hardware/actions/workflows/pio.yml/badge.svg?branch=master)](https://github.com/VIPQualityPost/ayab-hardware/actions/workflows/pio.yml)

This is the respository for the open-source first-party hardware that interfaces with the AYAB desktop software. It contains design files, production files, and assembly documentation, sorted by hardware generation.

The AYAB project started with the original AYAB Shield, which mounts to an Arduino Uno. The shield does not fit inside the machine and it must remain open while installed. These are often sold in kits and require assembly by the user.\
This design was later incorporated into a replacement PCB to be installed into the knitting machine, called the AYAB-Interface, and was designed and produced by Evil Mad Scientist Labs (EMSL).\
In anticipation of the new generation of AYAB software with the launch of v1.0, we have also started design on a new generation of hardware with a custom, fully integrated ESP32 microcontroller. AYAB-ESP32 supports KH 270, 900, 910, 930, 940, 950, 960, and CK-35, which would replace the internal motherboard of the knitting machine (in an easily reversible way) and allow for wireless pattern upload and operation from various mobile devices.
