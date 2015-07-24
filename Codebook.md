# Human Activity Recognition Codebook

## Description
This code book describes the files and variables used in this analysis.  Files are broken down into two types:

  1. Raw data - These are the original unprocessed files obtained prior to any processing.  These files are as follows (in order of size):
   - UCI HAR Dataset/train/X_train.txt (~63 Mb)
   - UCI HAR Dataset/test/X_test.txt  (~25 Mb)
   - UCI HAR Dataset/train/subject_train.txt (~20 Kb)
   - UCI HAR Dataset/features.txt (~16 Kb)
   - UCI HAR Dataset/test/subject_test.txt (~? Kb)
   - UCI HAR Dataset/train/subject_train.txt (~? Kb)
  
  2. Processed data - These files were generated as outputs from R scripts that used the raw or other processed data as inputs.  These files are as follows:
   - **output/xtestdf.R**  deparsed dataframe constructed by running  
     <code>read.fwf(file = "./UCI HAR Dataset/test/X_test.txt", rep(c(-1, 15), 561))</code>  
     from the main project directory
   - **output/xtraindf.R**  deparsed dataframe constructed by running  
     <code>read.fwf(file = "./UCI HAR Dataset/train/X_train.txt", rep(c(-1, 15), 561))</code>  
     from the main project directory

## Raw Data


## Processed Data

1. Data Files:  The main function that performs the analysis (**run_analysis.R**) reads the following x data files (in order of size):

  
2. Dimensions of the data sets:
  - Both **X\_train.txt** and **X\_test.txt** have **561** fields (referred to as features by the original authors of the data)
  - There are **7352** training records in the **X_train.txt** file.
  - There are **2947** testing records in the **X_test.txt** file.
3. variables tbd
4. transforms tdb


## Data Source
The raw data for this project was obtained from here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

which has been adapted from the original source on the **UCI Machine Learning Repository** at:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

and is located in the **UCI HAR Dataset**, **UCI HAR Dataset/test**, and **UCI HAR Dataset/train** directories of this project.  Details will be described below.

## Description of Variables / Features

TBD - describe the variables

## References

