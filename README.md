#Author: Dirk Bruyland
 This is the Readme.md file for
# the project repo for Course: get and clean data
 as described on this site:


Content
=======
The following files are in this repo:

1. The RAW DATA 
This is a ZIPped file (bzip2) fetched as is on March 03 2015, 13:49
This file was fetched from the site:
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  "

2. Readme.md
This is this file

3.run_analysis.R
This is the R script that produces the tidy data
from the raw data, and stores the result in Tidy.txt.

4.run_analysisH.csv
This is a helper file for the R script
It is a modified copy of features.txt and has
3 columnns. It contains per row :
a)the reference number to the feature,
b)the modified name of the feature, and whether it will
c) be included in the tidy data(1) or not(0)

5. Tidy.txt
This is the output of running the R script 
run_analysis.R
It is a text file.

6. CODEBOOK.md
This file explains the variables in tidy.txt
This file also explains the design.




Instruction
============

The raw data should be installed and unzipped in a /data
subdirectory/folder from the working directory/folder , 

the run_analysis.R script and the run_analysisH.csv
should be loaded in the R working directory/folder. 
and then the script run_analysis.R should be run.

The resulting tidy data is provided by the script 
as a .txt fomatted file
called tidy.txt in the working directory. 

If newer raw data is provided or the user prefers to fetch the raw data
the relevant download.file comments in run_analysis.R
can be removed for that.

