# Human Activity Recognition

## Contents  
- [Description](#id-description)  
- [Running the Analysis](#id-running-the-analysis)  
- [Code Book](#id-codebook)  
- [Raw and Prcessed Data](#id-data)
- [The Tidy Data Set](#id-tidy)
- [References](#id-refs)

<div id='id-description'/>
## Description
The purpose of this project is to demonstrate the "_ability to collect, work with, and clean a data set_".  The specific objective, as described in the requirements for the [**Getting and Cleaning Data** course](https://class.coursera.org/getdata-030) project offered by Johns Hopkins through [**Coursera**](https://www.coursera.org/) is to produce "_**tidy data**_" (Wickam 2014) \[[1](#id-refs)\] from data collected on human activity recognition, by executing the following steps:

1. Merging the training and test sets to create one data set.
  - Reading the **X_test.txt** and **X_train.txt** files into their own dataframes and then putting them together.
2. Extracting only the **mean** and **standard deviation** measurements from the original set of 561 variables.
  - The measurements of interest are postfixed with **-mean()-?** or **-std()-?** where **?** is either of the characters **X**, **Y**, or **Z**.
  - This reduced the measurement variable count from 561 to 66.
3. Using descriptive activity names to name the activities in the data set.
  - Raw data encoded activities as integers from 1 through 6.
  - The encoded values corresponded to: **_WALKING_**, **_WALKING\_UPSTAIRS_**, **_WALKING\_DOWNSTAIRS_**, **_SITTING_**, **_STANDING_**, and **_LAYING_** respectively.
4. Appropriately labeling the data set with descriptive variable names.
  - Details of how this was done are described in the [CodeBook.md file](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/CodeBook.md).
5. Creating a second independent tidy data set with the average of each variable for each activity and each subject.
  - The wide form of the tidy data was selected.
  - Measurement variables were prepended with **MeanOf**
  - This summary file was written out using:  
    <pre>
    write.table(summarizedByActivityAndSubject,
                    file = paste0(outputDir, "./HARByActivityAndSubject.txt"),
                    row.names = FALSE)
    </pre> where <code>outputDir = ./UCI HAR Dataset/output</code> relative to the current working directory.
  - The summaray file is called [HARByActivityAndSubject.txt](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/output/HARByActivityAndSubject.txt) and can be read in using:
  <pre>
  finalTable <- read.table("./UCI HAR Dataset/output/HARByActivityAndSubject.txt",
                                  header = TRUE, sep = " ")
  </pre>
  from the current working directory.

The motivation behind this project is that the ability to transform an existing dataset into one that is tidy typically consumes a substantial amount of time, is necessary in order to make downstream analysis tractable, and is required by any professional working with large amounts of data.  Therefore, gaining experience in this area serves to enhance future productivity.

The project consists of

* this **README** file which describes the overall project, the files used, and the procedure for running the analysis
* a **code book** which describes the variables in the final output, their units (or lack thereof) and how they were renamed.
* an **R script** that was used to transform the existing data into a set that is tidy and
* a set of **raw**, **processed** and **tidied data files** that were inputs and outputs of the R script used build the final tidy dataset described in **step 5.** above.

<div id='id-running-the-analysis'/>
## Running the Analysis

<div id='id-codebook'/>
## Code Book
The code book for this project is provided in the [**CodeBook.md** file](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/CodeBook.md) and describes the following:

1. Description of the Variables and how they were Renamed
2. Units and Ranges of the Variables
3. Variable Listing

<div id='id-data'/>
## Raw and Processed Data
The raw data for this project was obtained from here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

which has been adapted from the original source on the **UCI Machine Learning Repository** at:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

and is located in the [**UCI HAR Dataset**](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/tree/master/UCI%20HAR%20Dataset), directory of this project.  The raw data read and processed by **run\_analysis.R** are as follows (in order of size):  

  - [UCI HAR Dataset/X_train.txt](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/test/X_test.txt)
    - training data set
    - 7352 records, 561 fields
    - ~63 Mb
  - [UCI HAR Dataset/X_test.txt](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/test/X_test.txt)
    - testing data set
    - 2947 records, 561 fields (same as training data set)
    - ~25 Mb
  - [subject\_train.txt](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/train/subject_train.txt)
    - list of subjects corresponding to the training data set activities
    - 7352 records, single field
    - ~20 Kb
  - [features.txt](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/features.txt)
    - list of all the measured or calculated variables in the dataset
    - 561 records, single field
    - described in the [**features\_info.txt**](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/features_info.txt) file
    - ~16 Kb
  - [subject\_test.txt](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/test/subject_test.txt)
    - list of subjects corresponding to the testing data set activities
    - 2947 records, single field
    - ~8 Kb

<div id='id-tidy'/>
## The Tidy Data Set

<div id='id-refs'/>
## References

[1] Wickam H (2014). "_Tidy Data_ ". "_Journal of Statistical Software_" **59**(10), 1.  URL http://www.jstatsoft.org/v59/i10/paper

