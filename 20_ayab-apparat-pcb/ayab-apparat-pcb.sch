EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Dispositivos_I2C
LIBS:ayab-apparat-pcb-cache
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 4600 2050 950  1050
U 52E14CBB
F0 "machine_interface" 50
F1 "machine_interface.sch" 50
F2 "EOL_L" I L 4600 2900 60 
F3 "SDA" I L 4600 2150 60 
F4 "SCL" I L 4600 2250 60 
F5 "EOL_R" I L 4600 3000 60 
F6 "BELTSHIFT" I L 4600 2750 60 
F7 "V1" I L 4600 2550 60 
F8 "V2" I L 4600 2650 60 
$EndSheet
$Sheet
S 3250 2100 800  900 
U 52E804E1
F0 "atmega" 50
F1 "atmega.sch" 50
F2 "V2" I R 4050 2650 60 
F3 "V1" I R 4050 2550 60 
F4 "BELTSHIFT" I R 4050 2750 60 
F5 "SCL" I R 4050 2250 60 
F6 "SDA" I R 4050 2150 60 
$EndSheet
Wire Wire Line
	4050 2550 4600 2550
Wire Wire Line
	4050 2650 4600 2650
Wire Wire Line
	4050 2750 4600 2750
Wire Wire Line
	4050 2250 4600 2250
Wire Wire Line
	4050 2150 4600 2150
$EndSCHEMATC
