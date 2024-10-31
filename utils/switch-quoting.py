#!/usr/bin/env python

import pandas as pd
import csv
from pathlib import Path

# add quoting switch => csv.QUOTE_MINIMAL // csv.QUOTE_ALL
oed_root_path = Path(Path(__file__).parent.parent, "OpenExposureData")
oed_files = list(oed_root_path.glob('*.csv'))

for filename in oed_files:
    df = pd.read_csv(filename, dtype=str, na_values=[], keep_default_na=False)
    df.to_csv(filename, index=False, quoting=csv.QUOTE_MINIMAL)
