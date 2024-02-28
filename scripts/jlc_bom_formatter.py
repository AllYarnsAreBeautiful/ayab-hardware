import pandas as pd
import os, sys, csv

bom_file = pd.read(argv[1])

bom_file.drop(0)
bom_file.columns = ['Designator', 'Value', 'Footprint', 'JLCPCB PN']

bom_file.to_csv(argv[2])