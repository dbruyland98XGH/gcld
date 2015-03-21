# Project repository for Course: get and clean data

### Author: Dirk Bruyland


 This is the Readme.md file for
 the course project as described on this site:
[https://class.coursera.org/getdata-012]




#CONTENT
---
What is in this repo.
The following files are in this repo:

## 1 The RAW DATA 
This is a ZIPped file (bzip2) fetched as is on March 03 2015, 13:49
This file was fetched from the site:
["https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  "]

## 2 Readme.md
This is this file

## 3 run_analysis.R
This is the R script that produces the tidy data
from the raw data, and stores the result in Tidy.txt.

## 4 run_analysisH.csv
This is a helper file for the R script
It is a modified copy of features.txt and has
3 columnns. 
It contains per row :

*a)the reference number to the feature,
*b)the modified name of the feature, and whether it will
*c) be included in the tidy data(1) or not(0)

## 5 Tidy.txt
This is the output of running the R script 
run_analysis.R
It is a text file, made with write.table() and row.names=FALSE.

## 6 CODEBOOK.md
This file explains the variables in tidy.txt
This file also explains the design.









# INSTRUCTION
---
How to use this repo.

The raw data should be installed and unzipped in a /data
subdirectory/folder from the working directory/folder , 

the run_analysis.R script and the run_analysisH.csv
should be loaded in the R working directory/folder. 
and then the script run_analysis.R should be run.

The resulting tidy data is provided by the script 
as a .txt fomatted file
called tidy.txt in the working directory. 

If no data directory is there, there will
one be created and the rawdata is fetched from the original site.








# IMPLEMENTATION
---
What this repo does.

The raw data contains all processed information on 561 features/variables.
This is described in the raw data documentation.

From this data 86 features/variables are selected, the ones with "mean" and "std" in their
names.

The observations from these features/variables are sorted according to the subject and the activity/training 
and further summarized by calculating the average/mean per subject and activity/training.

There are 30 subjects involved and 6 training/activities.

The tidy data is thus constructed as a table of 180 rows (30*6) and 86 features/variables.
To this also a column is added to indicate the subject id (a number 0-30) and a column
is added to indicate the training/activity. 

So the tidy table has 180 rows and 88 columns
in total, the entries are separated by spaces.

The tidy data is written in a file called tidy.txt in the same working directory
where the script is run.

The running of run_analysis.R together with run_analysis.csv
will accomplish above.

run_analysis.csv contains the information what to subset from the 561 features/variables
and contains the information what (readable) column names to use.

More technical details are in the codebook.md /Design part
and in the comments of the run_analysis.R script file.