import pandas as pd
import csv
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-i', '--fin', help='path to the input file')
parser.add_argument('-o', '--fout', help="path to the output file, use input file path if not provided", nargs='?')
parser.add_argument('-q', '--quoting', help='quoting style of the output [all, minimal, ...] (not case sensitive) '
                                          'see list in https://docs.python.org/3/library/csv.html#csv.QUOTE_ALL', default='all')

def to_quote(*, fin, fout=None, quoting=csv.QUOTE_ALL):
    if fout is None:
        fout = fin
    df =  pd.read_csv(fin, dtype=str, keep_default_na=False, na_values=[], encoding='latin_1')
    df.to_csv(fout, index=False, quoting=quoting)

def main():
    kwargs = vars(parser.parse_args())
    quoting = getattr(csv, f"QUOTE_{kwargs.pop('quoting').upper()}")

    to_quote(quoting=quoting, **kwargs)

if __name__ == '__main__':
    main()







