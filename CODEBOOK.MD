
# codebook for project Getting and Cleaning data
as described in:
[https://class.coursera.org/getdata-012]
##Author: Dirk Bruyland


# CODEBOOK
--
There are 88 variables/columns in the tidy data table in total

## 86 measurements
All UNITS of all 86 measurements/features variables are taken as provided in the raw data.
They have not been scaled or offset by the script, and they are values normalized -1..+1..
They have been averaged out over the recordings for each subject and activity, but this does not
change the unit.



## subject 
column/variable 87 is the subject number and is an integer 1..30.
the subjects with id's: 2,4,9,10,12,13,18,20,24 are "test" subjects.
the other subjects are "training" subjects.



## training activity
column/variable 88 is the activity/training number and is factored as:

1 WALKING

2 WALKINGUPSTAIRS

3 WALKINGDOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING 
 
 

 ##list of variables
 Note the first digits of each name refer to the entry in features.txt file.

1tBodyAccmeanX

2tBodyAccmeanY

3tBodyAccmeanZ

4tBodyAccstdX

5tBodyAccstdY

6tBodyAccstdZ

41tGravityAccmeanX

42tGravityAccmeanY

43tGravityAccmeanZ

44tGravityAccstdX

45tGravityAccstdY

46tGravityAccstdZ

81tBodyAccJerkmeanX

82tBodyAccJerkmeanY

83tBodyAccJerkmeanZ

84tBodyAccJerkstdX

85tBodyAccJerkstdY

86tBodyAccJerkstdZ

121tBodyGyromeanX

122tBodyGyromeanY

123tBodyGyromeanZ

124tBodyGyrostdX

125tBodyGyrostdY

126tBodyGyrostdZ

161tBodyGyroJerkmeanX

162tBodyGyroJerkmeanY

163tBodyGyroJerkmeanZ

164tBodyGyroJerkstdX

165tBodyGyroJerkstdY

166tBodyGyroJerkstdZ

201tBodyAccMagmean

202tBodyAccMagstd

214tGravityAccMagmean

215tGravityAccMagstd

227tBodyAccJerkMagmean

228tBodyAccJerkMagstd

240tBodyGyroMagmean

241tBodyGyroMagstd

253tBodyGyroJerkMagmean

254tBodyGyroJerkMagstd

266fBodyAccmeanX

267fBodyAccmeanY

268fBodyAccmeanZ

269fBodyAccstdX

270fBodyAccstdY

271fBodyAccstdZ

294fBodyAccmeanFreqX

295fBodyAccmeanFreqY

296fBodyAccmeanFreqZ

345fBodyAccJerkmeanX

346fBodyAccJerkmeanY

347fBodyAccJerkmeanZ

348fBodyAccJerkstdX

349fBodyAccJerkstdY

350fBodyAccJerkstdZ

373fBodyAccJerkmeanFreqX

374fBodyAccJerkmeanFreqY

375fBodyAccJerkmeanFreqZ

424fBodyGyromeanX

425fBodyGyromeanY

426fBodyGyromeanZ

427fBodyGyrostdX

428fBodyGyrostdY

429fBodyGyrostdZ

452fBodyGyromeanFreqX

453fBodyGyromeanFreqY

454fBodyGyromeanFreqZ

503fBodyAccMagmean

504fBodyAccMagstd

513fBodyAccMagmeanFreq

516fBodyBodyAccJerkMagmean

517fBodyBodyAccJerkMagstd

526fBodyBodyAccJerkMagmeanFreq

529fBodyBodyGyroMagmean

530fBodyBodyGyroMagstd

539fBodyBodyGyroMagmeanFreq

542fBodyBodyGyroJerkMagmean

543fBodyBodyGyroJerkMagstd

552fBodyBodyGyroJerkMagmeanFreq

555angletBodyAccMeangravity

556angletBodyAccJerkMeangravityMean

557angletBodyGyroMeangravityMean

558angletBodyGyroJerkMeangravityMean

559angleXgravityMean

560angleYgravityMean

561angleZgravityMean

subject

training

 
 
 
 
 
# DESIGN
---
An overview what the repo produces and contains is given in readme.md.
Here some more information is provided on how this is done.
More information is in the comments of the script.

## 1 All inertia data is discarded:
This is the raw data in the folders with names "inertia signals".
They are simply not used by the script.

## 2 Mean and std measurements only
Only the measurements/features with "mean" OR "std" in their name are kept, the rest is discarded.

First a complete table is made with all 561 features/variables.
This is done by reading in the X_test,y_test,subject_test
and X_train,y_train, subject_train files.
One table is made from these files, with 563 columns and 10300rows.
(561 columns for the features/variables and 2 columns for subject id and training/activity
id)
This is accomplished with rbind() and cbind() functions.

The helper file run_analysisH.csv is read into a table
with 3 columns and 563 rows.
The first column refers to the entry in the raw data file features.txt
The 2nd colum provides an edited readable name for the feature
the 3rd column indicates whether the feature is selected(1) for the tidy data
or not selected for the tidy data(0)

Then the selection of features/variables is made in the script.
This is done by subsetting the table with all the 561 features/variables
with the information of the 3rd column of the run_analysis.csv file

## 3 making column means
The subsetted table (named in the script X_sel) is then turned into a list
where each element only contains data for one subject and one activity only.
Each element is a dataframe and the means are made per column with the colMeans()
function.
This is accomplished with the split() and lapply() functions.
The resut is a list with 180 elements, and each element is a vector with 88
column means.

## making a tidy table
The above produced list with summarized column means is turned into a dataframe again
by shifting all the column means in one big vector and reformatting the one big vector
back into one table of 180 rows and 88 variables. 
Then the column with training/activities is made into a factor variable
and then the column names provided by the helper file column 2 are inserted into
the final tidy data table. 