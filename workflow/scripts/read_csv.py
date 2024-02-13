import os
import glob
import csv
import pandas as pd


# ACCESSIONS=pd.read_csv("config/samples.tsv", sep="\t").loc[0:3]['sample_name']
# print(ACCESSIONS)

# SAMPLES=pd.read_csv("config/samples.tsv", sep="\t").loc[0:3]['sample_name'].tolist()
# print(SAMPLES)

# UNITS=pd.read_csv("config/units.tsv", sep="\t").loc[0:3]['sample_name'].tolist()
# print(UNITS)


# METADATA=pd.read_csv('data/metadata.csv')
# ACCESSIONS=METADATA['run'].tolist() # Specify the column containing the accession, in this demo is Run

BIOPROJ=pd.read_csv('data/metadata.csv').bioproject.unique().tolist()
print(BIOPROJ)

with open('data/bioproj_accessions.txt', 'w') as f:
    print(BIOPROJ, file=f)