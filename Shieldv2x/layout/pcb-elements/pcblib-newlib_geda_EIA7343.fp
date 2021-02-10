	# how much to grow the pads by for soldermask
	# clearance from planes
Element(0x00 "Tantalum SMT capacitor (pin 1 is +)" "" "EIA7343" 0 0 229 0 3 100 0x00)
(
	ElementLine(-219 -117 -219 117 20)
	    ElementLine(-219 117 -158 150 10)
	    ElementLine(-158 150 209 150 10)
	    ElementLine(209 150 209 -150 10)
	    ElementLine(209 -150 -158 -150 10)
	    ElementLine(-158 -150 -219 -117 10)
	Pad(-115 -56 
		-115 56
		123 20 129 "1" "1" 0x00000100)
	    Pad(115 -56 
		115 56
		123 20 129 "2" "2" 0x00000100)
)
