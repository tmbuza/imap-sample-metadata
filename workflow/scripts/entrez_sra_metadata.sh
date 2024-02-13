#!/bin/bash


esearch -db sra -query 'PRJNA477349[bioproject]' | efetch -format runinfo >data/PRJNA477349_runinfo.csv

esearch -db sra -query 'PRJNA802976[bioproject]' | efetch -format runinfo >data/PRJNA802976_runinfo.csv

esearch -db sra -query 'PRJNA322554[bioproject]' | efetch -format runinfo >data/PRJNA322554_runinfo.csv

esearch -db sra -query 'PRJNA937707[bioproject]' | efetch -format runinfo >data/PRJNA937707_runinfo.csv

esearch -db sra -query 'PRJNA589182[bioproject]' | efetch -format runinfo >data/PRJNA589182_runinfo.csv

esearch -db sra -query 'PRJEB13870[bioproject]' | efetch -format runinfo >data/PRJEB13870_runinfo.csv


