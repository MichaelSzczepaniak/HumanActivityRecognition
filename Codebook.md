# Human Activity Recognition Codebook

All variables except **activity** and **subject** are prefixed with **MeanOf** to call out the fact that these are calculated means of values described in the **features_info.txt** and listed in the **features.txt** file included in the zip file of the original data.  These values represent "means of means" or "means of standard deviations" as described below.

Values prefixed with **MeanOfTime** are means calculated from original variables that were prefixed with **t** and represent time based measurements captured at a sampling rate of 50 Hz.

Values prefixed with **MeanOfFrequency** are means calculated from original variables that were prefixed with **f** and represent values calculated from a Fast Fourier Transform (FFT) applied to a signal.

Values postfixed with **MeanX**, **MeanY**, or **MeanZ** represent values that were means calculated from data stored in the **Inertial Signals** directory for readings of axial signals in the X, Y, and Z directions respectively.  These the "means of means" mentioned earlier.

Values postfixed with **StdDeviationX**, **StdDeviationY**, or **StdDeviationZ** represent values that were standard deviations calculated from data stored in the **Inertial Signals** directory for readings of axial signals in the X, Y, and Z directions respectively.  These the "means of standard deviations" mentioned earlier.

Acceleration signals were separated into **body** and **gravity** signal components.  Values prefixed with **MeanOfBody** represent those values that were the **body** component while values prefixed with **MeanOfGravity** represent those values that were the **gravity** component of the acceleration signal.

Consult the **features_info.txt** and the **README.txt*** files in the original zip file of the downloaded dataset for further details.  These file can also be found in the **UCI HAR Dataset** directory of this project.

## activity
### &nbsp;&nbsp;&nbsp;&nbsp;Activity Performed
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WALKING
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WALKING_UPSTAIRS
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WALKING_DOWNSTAIRS
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SITTING
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STANDING
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LAYING
#### 
## subject
### &nbsp;&nbsp;&nbsp;&nbsp;Subject performing the activity coded as an integer 1 through 30
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1, 2, ... 30
## MeanOfTimeBodyAccMeanX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-mean()-X_ by activity and subject
## MeanOfTimeBodyAccMeanY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-mean()-Y_ by activity and subject
## MeanOfTimeBodyAccMeanZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-mean()-Z_ by activity and subject
## MeanOfTimeBodyAccStdDeviationX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-std()-X_ by activity and subject
## MeanOfTimeBodyAccStdDeviationY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-std()-Y_ by activity and subject
## MeanOfTimeBodyAccStdDeviationZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-std()-Z_ by activity and subject
## MeanOfTimeGravityAccMeanX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-mean()-X_ by activity and subject
## MeanOfTimeGravityAccMeanY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-mean()-Y_ by activity and subject
## MeanOfTimeGravityAccMeanZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-mean()-Z_ by activity and subject
## MeanOfTimeGravityAccStdDeviationX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-std()-X_ by activity and subject
## MeanOfTimeGravityAccStdDeviationY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-std()-Y_ by activity and subject
## MeanOfTimeGravityAccStdDeviationZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-std()-Z_ by activity and subject
## MeanOfTimeBodyAccJerkMeanX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-mean()-X_ by activity and subject
## MeanOfTimeBodyAccJerkMeanY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-mean()-Y_ by activity and subject
## MeanOfTimeBodyAccJerkMeanZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-mean()-Z_ by activity and subject
## MeanOfTimeBodyAccJerkStdDeviationX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-std()-X_ by activity and subject
## MeanOfTimeBodyAccJerkStdDeviationY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-std()-Y_ by activity and subject
## MeanOfTimeBodyAccJerkStdDeviationZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-std()-Z_ by activity and subject
## MeanOfTimeBodyGyroMeanX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-mean()-X_ by activity and subject
## MeanOfTimeBodyGyroMeanY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-mean()-Y_ by activity and subject
## MeanOfTimeBodyGyroMeanZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-mean()-Z_ by activity and subject
## MeanOfTimeBodyGyroStdDeviationX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-std()-X_ by activity and subject
## MeanOfTimeBodyGyroStdDeviationY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-std()-Y_ by activity and subject
## MeanOfTimeBodyGyroStdDeviationZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-std()-Z_ by activity and subject
## MeanOfTimeBodyGyroJerkMeanX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-mean()-X_ by activity and subject
## MeanOfTimeBodyGyroJerkMeanY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-mean()-Y_ by activity and subject
## MeanOfTimeBodyGyroJerkMeanZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-mean()-Z_ by activity and subject
## MeanOfTimeBodyGyroJerkStdDeviationX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-std()-X_ by activity and subject
## MeanOfTimeBodyGyroJerkStdDeviationY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-std()-Y_ by activity and subject
## MeanOfTimeBodyGyroJerkStdDeviationZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-std()-Z_ by activity and subject
## MeanOfTimeBodyAccMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccMag-mean()_ by activity and subject
## MeanOfTimeBodyAccMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccMag-std()_ by activity and subject
## MeanOfTimeGravityAccMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAccMag-mean()_ by activity and subject
## MeanOfTimeGravityAccMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAccMag-std()_ by activity and subject
## MeanOfTimeBodyAccJerkMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerkMag-mean()_ by activity and subject
## MeanOfTimeBodyAccJerkMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerkMag-std()_ by activity and subject
## MeanOfTimeBodyGyroMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroMag-mean()_ by activity and subject
## MeanOfTimeBodyGyroMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroMag-std()_ by activity and subject
## MeanOfTimeBodyGyroJerkMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerkMag-mean()_ by activity and subject
## MeanOfTimeBodyGyroJerkMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerkMag-std()_ by activity and subject
## MeanOfFrequencyBodyAccMeanX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-mean()-X_ by activity and subject
## MeanOfFrequencyBodyAccMeanY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-mean()-Y_ by activity and subject
## MeanOfFrequencyBodyAccMeanZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-mean()-Z_ by activity and subject
## MeanOfFrequencyBodyAccStdDeviationX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-std()-X_ by activity and subject
## MeanOfFrequencyBodyAccStdDeviationY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-std()-Y_ by activity and subject
## MeanOfFrequencyBodyAccStdDeviationZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-std()-Z_ by activity and subject
## MeanOfFrequencyBodyAccJerkMeanX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-mean()-X_ by activity and subject
## MeanOfFrequencyBodyAccJerkMeanY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-mean()-Y_ by activity and subject
## MeanOfFrequencyBodyAccJerkMeanZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-mean()-Z_ by activity and subject
## MeanOfFrequencyBodyAccJerkStdDeviationX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-std()-X_ by activity and subject
## MeanOfFrequencyBodyAccJerkStdDeviationY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-std()-Y_ by activity and subject
## MeanOfFrequencyBodyAccJerkStdDeviationZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-std()-Z_ by activity and subject
## MeanOfFrequencyBodyGyroMeanX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-mean()-X_ by activity and subject
## MeanOfFrequencyBodyGyroMeanY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-mean()-Y_ by activity and subject
## MeanOfFrequencyBodyGyroMeanZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-mean()-Z_ by activity and subject
## MeanOfFrequencyBodyGyroStdDeviationX
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-std()-X_ by activity and subject
## MeanOfFrequencyBodyGyroStdDeviationY
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-std()-Y_ by activity and subject
## MeanOfFrequencyBodyGyroStdDeviationZ
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-std()-Z_ by activity and subject
## MeanOfFrequencyBodyAccMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccMag-mean()_ by activity and subject
## MeanOfFrequencyBodyAccMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccMag-std()_ by activity and subject
## MeanOfFrequencyBodyBodyAccJerkMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyAccJerkMag-mean()_ by activity and subject
## MeanOfFrequencyBodyBodyAccJerkMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyAccJerkMag-std()_ by activity and subject
## MeanOfFrequencyBodyBodyGyroMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyGyroMag-mean()_ by activity and subject
## MeanOfFrequencyBodyBodyGyroMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyGyroMag-std()_ by activity and subject
## MeanOfFrequencyBodyBodyGyroJerkMagMean
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyGyroJerkMag-mean()_ by activity and subject
## MeanOfFrequencyBodyBodyGyroJerkMagStdDeviation
### &nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyGyroJerkMag-std()_ by activity and subject