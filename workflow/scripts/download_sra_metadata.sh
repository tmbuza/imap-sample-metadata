#!/bin/bash

# Shebang Declaration:
# The script begins with #!/bin/bash, indicating that this is a Bash script.

# Setting up Environment:
# The echo command appends a line to the user's .bashrc file.
# The added line includes the edirect directory in the PATH, and source is used to apply changes immediately.
echo 'export PATH=$PATH:$HOME/edirect' >> ~/.bashrc
source ~/.bashrc

# Create 'data' directory if not available
mkdir -p data

# Retrieving Run Information:
# esearch and efetch commands are employed to retrieve run information for specific bioprojects.
# The retrieved data is saved in CSV files for further analysis.
esearch -db sra -query 'PRJNA477349[bioproject]' | efetch -format runinfo > data/PRJNA477349_runinfo.csv
esearch -db sra -query 'PRJNA802976[bioproject]' | efetch -format runinfo > data/PRJNA802976_runinfo.csv
esearch -db sra -query 'PRJNA322554[bioproject]' | efetch -format runinfo > data/PRJNA322554_runinfo.csv
esearch -db sra -query 'PRJNA937707[bioproject]' | efetch -format runinfo > data/PRJNA937707_runinfo.csv
esearch -db sra -query 'PRJNA589182[bioproject]' | efetch -format runinfo > data/PRJNA589182_runinfo.csv
esearch -db sra -query 'PRJEB13870[bioproject]' | efetch -format runinfo > data/PRJEB13870_runinfo.csv

# Retrieving Detailed Metadata:
# pysradb commands are used to fetch detailed metadata for the same bioprojects.
# Results are stored in CSV files using the --detailed option for more comprehensive information.
pysradb metadata PRJNA477349 --detailed > data/PRJNA477349_pysradb.csv
pysradb metadata PRJNA802976 --detailed > data/PRJNA802976_pysradb.csv
pysradb metadata PRJNA322554 --detailed > data/PRJNA322554_pysradb.csv
pysradb metadata PRJNA937707 --detailed > data/PRJNA937707_pysradb.csv
pysradb metadata PRJNA589182 --detailed > data/PRJNA589182_pysradb.csv
pysradb metadata PRJEB13870 --detailed > data/PRJEB13870_pysradb.csv
