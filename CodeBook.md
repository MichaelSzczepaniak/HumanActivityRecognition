# Human Activity Recognition Codebook

## Description of the Measurement Variables and how they were renamed
All variables except **activity** and **subject** are prefixed with **MeanOf** to call out the fact that these are calculated means of values described in the [**features_info.txt**](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/features_info.txt) file and are listed in the [**features.txt**](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/features.txt) file included in the zip file of the original data.  These values represent "means of means" or "means of standard deviations" as described below.

Variable names prefixed with **MeanOfTime** are means calculated from original variables that were prefixed with **t** and represent time based measurements captured at a sampling rate of 50 Hz.

Variable names prefixed with **MeanOfFrequency** are means calculated from original variables that were prefixed with **f** and represent values calculated from a Fast Fourier Transform (FFT) applied to a signal.

Variable names that contain the string **Magnitude** replaced the string **Mag** in the original variable name and refers to scalar quantities that are not associated to a variable with a directional component (i.e. postfixed with X, Y, or Z).

Variable names that contain the string **Gyroscope** replaced the string **Gyro** in the original variable name and refers to measurements taken from the gyroscope of the mobile device.

Variables postfixed with **MeanX**, **MeanY**, or **MeanZ** represent values that were means calculated from data stored in the **Inertial Signals** directory for readings of axial signals in the X, Y, and Z directions respectively.  Variables postfixed with **Mean** without a trailing X, Y or Z represent means of quantities that do not have a directional component associated with them.  Each of these 4 cases represent the "means of means" mentioned earlier.

Variable names postfixed with **StandardDeviationX**, **StandardDeviationY**, or **StandardDeviationZ** represent values that were standard deviations calculated from data stored in the **Inertial Signals** directory for readings of axial signals in the X, Y, and Z directions respectively.  Variables postfixed with **StandardDeviation** without a trailing X, Y or Z represent standard deviations of quantities that do not have a directional component associated with them.  Each of these 4 cases represent the "means of standard deviations" mentioned earlier.

Acceleration signals were separated into **body** and **gravity** signal components.  Values prefixed with **MeanOfBody** represent those values that were the **body** component while values prefixed with **MeanOfGravity** represent those values that were the **gravity** component of the acceleration signal.  The original data called out acceleration values with the string **_Acc_**.  This string was replaced with **_Acceleration_** for clarity.

Consult the [**features_info.txt**](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/features_info.txt) and the [**README.txt**](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/README.txt) files in this project or the original zip file of the downloaded dataset for further details.  These file can be found in the [**UCI HAR Dataset** directory](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/tree/master/UCI%20HAR%20Dataset) of this project.

## Units and Ranges of the Variables
Because the **activity** and **subject** variables are categorical, they are unit-less.  As for the measured variables, the [README.txt file](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/README.txt) in the downloaded dataset states that _"Features are normalized and bounded within [-1,1]"_ which implies that the values for these variables do not have units either.

None of the documentation for the downloaded dataset describes how this normalization was done.  If I had to speculate how this was done, I would say that the mean was subtracted from each original measurement value and that difference then divided by some value larger than the maximum reading of all the data.  A possible choice for this maximum value could be the maximum value the mobile device was capable of detecting.

## Variable Listing
### activity
&nbsp;&nbsp;&nbsp;&nbsp;Activity performed by a subject.  Possible values are:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WALKING  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WALKING\_UPSTAIRS  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WALKING\_DOWNSTAIRS  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SITTING  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STANDING  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LAYING  

### subject
&nbsp;&nbsp;&nbsp;&nbsp;Subject performing one of the activities.  Possible values are coded as integers from 1 to 30  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1, 2, ... 30

### MeanOfTimeBodyAccelerationMeanX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-mean()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationMeanY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-mean()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationMeanZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-mean()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationStandardDeviationX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-std()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationStandardDeviationY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-std()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

#### MeanOfTimeBodyAccelerationStandardDeviationZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAcc-std()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

#### MeanOfTimeGravityAccelerationMeanX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-mean()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeGravityAccelerationMeanY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-mean()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeGravityAccelerationMeanZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-mean()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeGravityAccelerationStandardDeviationX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-std()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeGravityAccelerationStandardDeviationY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-std()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeGravityAccelerationStandardDeviationZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAcc-std()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationJerkMeanX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-mean()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationJerkMeanY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-mean()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationJerkMeanZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-mean()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationJerkStandardDeviationX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-std()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationJerkStandardDeviationY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-std()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationJerkStandardDeviationZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerk-std()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeMeanX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-mean()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeMeanY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-mean()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeMeanZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-mean()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeStandardDeviationX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-std()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeStandardDeviationY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-std()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeStandardDeviationZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyro-std()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeJerkMeanX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-mean()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeJerkMeanY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-mean()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeJerkMeanZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-mean()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeJerkStandardDeviationX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-std()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeJerkStandardDeviationY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-std()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeJerkStandardDeviationZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerk-std()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeGravityAccelerationMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAccMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeGravityAccelerationMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tGravityAccMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationJerkMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerkMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyAccelerationJerkMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyAccJerkMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeJerkMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerkMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfTimeBodyGyroscopeJerkMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _tBodyGyroJerkMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationMeanX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-mean()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationMeanY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-mean()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationMeanZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-mean()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationStandardDeviationX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-std()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationStandardDeviationY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-std()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationStandardDeviationZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAcc-std()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationJerkMeanX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-mean()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationJerkMeanY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-mean()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationJerkMeanZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-mean()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationJerkStandardDeviationX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-std()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationJerkStandardDeviationY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-std()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationJerkStandardDeviationZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccJerk-std()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyGyroscopeMeanX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-mean()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyGyroscopeMeanY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-mean()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyGyroscopeMeanZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-mean()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyGyroscopeStandardDeviationX
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-std()-X_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyGyroscopeStandardDeviationY
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-std()-Y_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyGyroscopeStandardDeviationZ
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyGyro-std()-Z_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyAccelerationMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyAccMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyBodyAccelerationJerkMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyAccJerkMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyAccJerkMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyBodyGyroscopeMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyGyroMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyBodyGyroscopeMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyGyroMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyBodyGyroscopeJerkMagnitudeMean
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyGyroJerkMag-mean()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1

### MeanOfFrequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation
&nbsp;&nbsp;&nbsp;&nbsp; Mean of the original variable _fBodyBodyGyroJerkMag-std()_ by activity and subject  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Values range from -1 to +1