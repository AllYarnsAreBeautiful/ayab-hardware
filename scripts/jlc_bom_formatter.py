import pandas as pd
import os, sys, csv

def footprintFix(fpName):
    propertiesList = fpName.split('_')

    if len(propertiesList) == 4:
        if  any(rcl in propertiesList[0] for rcl in ["Resistor", "Capacitor", "Inductor", "Diode"]):
            # For things like R/C/L, return something like C0402
            return propertiesList[1][-1] + propertiesList[2]

    # Strip out library name from FP.
    return fpName.split(":")[-1]

bom_file = pd.read_csv(sys.argv[1])

#Number of columns - ideally this is more unified but I don't want to modify the formatter and the design files in the same PR.
bom_format = bom_file.shape[1]

match bom_format:
    case 4:
        bom_file.columns = ['Designator', 'Value', 'Footprint', 'JLCPCB Part #']
    case 5:
        bom_file.columns = ['Designator', 'Value', 'Footprint', 'Mfg', 'Mfg P/N']
    case 6:
        bom_file.columns = ['Designator', 'Value', 'Footprint', 'Mfg', 'Mfg P/N', 'JLCPCB Part #']

bom_file['Footprint'] = bom_file['Footprint'].apply(lambda x: footprintFix(x))

bom_file.to_csv(sys.argv[2], index=False)
