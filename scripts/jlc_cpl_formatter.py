import pandas as pd
import os, sys, csv

def reduce_layer(layername):
    if 'top' in layername:
        return 'T'
    elif 'bottom' in layername:
        return 'B'
    else:
        return ''

if __name__ == "__main__":
    cpl_file = pd.read_csv(sys.argv[1],skipfooter=1,engine='python')
    
    # Assign names and sort rows to match JLC format
    cpl_file.columns = ['Designator', 'Val', 'Package', 'Mid X', 'Mid Y', 'Rotation', 'Layer']
    cpl_file = cpl_file.reindex(columns=['Designator', 'Mid X', 'Mid Y', 'Layer', 'Rotation'])

    # Change top/bottom to T/B
    cpl_file['Layer'] = cpl_file['Layer'].apply(reduce_layer)

    # Write file to disk
    cpl_file.to_csv(sys.argv[2], index=False)