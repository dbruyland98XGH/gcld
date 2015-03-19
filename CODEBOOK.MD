rev.8
Author: Dirk Bruyland
This is the codebook for the project described in



codebook
=========
All units of all variables are taken as provided in the raw data.



design
=======
1.All inertia data is discarded:
This is the raw data in the folders with names "inertia signals".

2. Only the features with "mean" OR "std" in their name are kept, the rest is discarded.

So only the below feature variables are used from the X_test files in train and test folder.

The below is cut from run_analysisH.csv file.
the first digit in each row refers to the feature in file features.txt
the second name in each row is the modified feature name used for the variable/column.
The third digit (=1) means the variable/column will be used in the tidy data.

The file run_analysisH.txt contains many other rows with last digit=0 which means these
variables/columns willl not be used in the tidy data.

1,1tBodyAccmeanX,1

2,2tBodyAccmeanY,1

3,3tBodyAccmeanZ,1

4,4tBodyAccstdX,1

5,5tBodyAccstdY,1

6,6tBodyAccstdZ,1

41,41tGravityAccmeanX,1

42,42tGravityAccmeanY,1

43,43tGravityAccmeanZ,1

44,44tGravityAccstdX,1

45,45tGravityAccstdY,1

46,46tGravityAccstdZ,1

81,81tBodyAccJerkmeanX,1

82,82tBodyAccJerkmeanY,1

83,83tBodyAccJerkmeanZ,1

84,84tBodyAccJerkstdX,1

85,85tBodyAccJerkstdY,1

86,86tBodyAccJerkstdZ,1

121,121tBodyGyromeanX,1

122,122tBodyGyromeanY,1

123,123tBodyGyromeanZ,1

124,124tBodyGyrostdX,1

125,125tBodyGyrostdY,1

126,126tBodyGyrostdZ,1

161,161tBodyGyroJerkmeanX,1

162,162tBodyGyroJerkmeanY,1

163,163tBodyGyroJerkmeanZ,1

164,164tBodyGyroJerkstdX,1

165,165tBodyGyroJerkstdY,1

166,166tBodyGyroJerkstdZ,1

201,201tBodyAccMagmean,1

202,202tBodyAccMagstd,1

214,214tGravityAccMagmean,1

215,215tGravityAccMagstd,1

227,227tBodyAccJerkMagmean,1

228,228tBodyAccJerkMagstd,1

240,240tBodyGyroMagmean,1

241,241tBodyGyroMagstd,1

253,253tBodyGyroJerkMagmean,1

254,254tBodyGyroJerkMagstd,1

266,266fBodyAccmeanX,1

267,267fBodyAccmeanY,1

268,268fBodyAccmeanZ,1

269,269fBodyAccstdX,1

270,270fBodyAccstdY,1

271,271fBodyAccstdZ,1

294,294fBodyAccmeanFreqX,1

295,295fBodyAccmeanFreqY,1

296,296fBodyAccmeanFreqZ,1

345,345fBodyAccJerkmeanX,1

346,346fBodyAccJerkmeanY,1

347,347fBodyAccJerkmeanZ,1

348,348fBodyAccJerkstdX,1

349,349fBodyAccJerkstdY,1

350,350fBodyAccJerkstdZ,1

373,373fBodyAccJerkmeanFreqX,1

374,374fBodyAccJerkmeanFreqY,1

375,375fBodyAccJerkmeanFreqZ,1

424,424fBodyGyromeanX,1

425,425fBodyGyromeanY,1

426,426fBodyGyromeanZ,1

427,427fBodyGyrostdX,1

428,428fBodyGyrostdY,1

429,429fBodyGyrostdZ,1

452,452fBodyGyromeanFreqX,1

453,453fBodyGyromeanFreqY,1

454,454fBodyGyromeanFreqZ,1

503,503fBodyAccMagmean,1

504,504fBodyAccMagstd,1

513,513fBodyAccMagmeanFreq,1

516,516fBodyBodyAccJerkMagmean,1

517,517fBodyBodyAccJerkMagstd,1

526,526fBodyBodyAccJerkMagmeanFreq,1

529,529fBodyBodyGyroMagmean,1

530,530fBodyBodyGyroMagstd,1

539,539fBodyBodyGyroMagmeanFreq,1

542,542fBodyBodyGyroJerkMagmean,1

543,543fBodyBodyGyroJerkMagstd,1

552,552fBodyBodyGyroJerkMagmeanFreq,1

555,555angletBodyAccMeangravity,1

556,556angletBodyAccJerkMeangravityMean,1

557,557angletBodyGyroMeangravityMean,1

558,558angletBodyGyroJerkMeangravityMean,1

559,559angleXgravityMean,1

560,560angleYgravityMean,1

561,561angleZgravityMean,1

 
3. The activity names used are as follows, and
will be used in a variable/column as a factor.

1 WALKING

2 WALKINGUPSTAIRS

3 WALKINGDOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING 
 
 
 
 