## RP2040 Pico

Use any rpipico board. power is supplied by the board. the machine is entirely powered by USB. No additional interfacing circuitry is required.

## Pin table

| Signal | miniDIN-8 pin | RP2040 GPIO | Direction | Notes |
|:-------|:-----------:|:-----------:|:----------|:------|
| SCK (serial clock) | 4 | 4 | out | CSI master clock, idle low |
| CS (attention) | 7 | 5 | in | active **low** |
| DIN (machine data) | 3 | 7 | in | machine → Pico, active **low** |
| DOUT (reply data) | 5 | 8 | out | Pico → machine |
| 3.3 V | 6 | — | supply | was 5 V on the original CB-1 |
| 5 V | 8 | — | supply | was 12 V on the original CB-1 |
| GND | 1, 2, ring/shield | GND | common |  |
