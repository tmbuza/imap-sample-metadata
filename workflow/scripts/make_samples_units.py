import os
import glob
import csv
import pandas as pd


# Create samples file. Here we are selecting the sample ID column and another column as condition. Users can pick any column of interest and must be present in their dataset.

samples=pd.read_csv('data/PRJNA208226_tidy_metadata.csv')[['run', 'locname']].rename(columns={
    "run": "sample_name", 
    "locname": "condition"})
samples.to_csv("config/samples.tsv",index=False, sep="\t")


# Create units file
units=pd.read_csv('data/PRJNA208226_tidy_metadata.csv')[['run', 'locname']].rename(
    columns={
    "run": "sample_name", 
    "locname": "condition"})
units.to_csv("config/units.tsv",index=False, sep="\t")


