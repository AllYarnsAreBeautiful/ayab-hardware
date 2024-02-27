Element[0x0 "Tyco Alcoswitch FSM JSM (FSM2JSM, FSM4JSM, FSM6JSM, FSM8JSM, FSM14JSM etc.)" "SWx" "fsmjsma" 26575 15000 -5000 -22000 0 100 ""]
(
	# signal pads
#	Pad[rX1 rY1 rX2 rY2 Thickness Clearance Mask "Name" "Number" SFlags]
	Pad[ -2.3mm -4.9mm -2.3mm -4.2mm 1.4mm 0.5mm 4543 "3"  "3" "square"]
	Pad[ +2.3mm -4.9mm +2.3mm -4.2mm 1.4mm 0.5mm 4543 "1"  "1" "square"]
	Pad[ -2.3mm +4.9mm -2.3mm +4.2mm 1.4mm 0.5mm 4543 "4"  "4" "square"]
	Pad[ +2.3mm +4.9mm +2.3mm +4.2mm 1.4mm 0.5mm 4543 "2"  "2" "square"]
	# the element box
	ElementLine [-11800 -11800 -11800 11800 1000]
	ElementLine [11800 -11800 11800 11800 1000]
	ElementLine [-11800 -11800 11800 -11800 1000]
	ElementLine [-11800 11800 11800 11800 1000]
	# the stylus
	ElementArc[0 0 6900 6900 0 0 1000]
	ElementArc[0 0 6900 6900 0 180 1000]
	# two connected pins
	ElementLine [-8850 -10325 -8850 10325 1000]
	ElementLine [8850 -10325 8850 10325 1000]
	ElementLine [8850 -8850 2950 -8850 1000]
	ElementLine [-8850 -8850 -2950 -8850 1000]
	ElementLine [2950 -10325 -2950 -8850 1000]

	Attribute("author" "Alexander Kurz, Stefan Tauner")
	Attribute("copyright" "2008 Alexander Kurz, 2010 Stefan Tauner")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-2.5")
	Attribute("ref" "tycoelectronics.com document number 2-1437565-7 rev S1 2010-04-10")
	Attribute("comment" "rev S1 of the document has an error: horizontal pad spacing implies 2*1,4 + 3,1 = 5,86. i used 5,9 instead.")
)
