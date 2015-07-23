# Human Activity Recognition

## Description
The purpose of this project is to demonstrate the "_ability to collect, work with, and clean a data set_".  The specific objective, as described in the requirements for the [**Getting and Cleaning Data** course](https://class.coursera.org/getdata-030) project offered by Johns Hopkins through [**Coursera**](https://www.coursera.org/) is to produce "_**tidy data**_" (Wickam 2014) from data collected on human activity recognition, through

1. Merging the training and test sets to create one data set.
2. Extracting only the **mean** and **standard deviation** measurements from the original set of 561 variables.
  - The measurements of interest are postfixed with **-mean()-?** or **-std()-?** where **?** is either of the characters **X**, **Y**, or **Z**.
3. Using descriptive activity names to name the activities in the data set.
4. Appropriately labeling the data set with descriptive variable names.
5. Creating a second independent tidy data set with the average of each variable for each activity and each subject.

The motivation behind this project is that the ability to transform an existing dataset to into one that is tidy, typically consumes a substantial amount of time, is necessary in order to make downstream analysis tractable, and is required by any professional working with large amounts of data.  Therefore, gaining experience in this area serves to enhance future productivity.

The project consists of

* this **README** file which describes the overall project and the procedure for running the analysis
* a **code book** which describes the variables, the data, and transformations that were performed to clean the data
* a set of **R scripts** that were used to transform the existing data into a set that is tidy and
* a set of **raw** and **tidied data files** that were inputs and outputs of the R scripts used for transformation

## Running the Analysis


## Code Book
The code book for this project is provided in the [**CodeBook.md** file](https://linktocodebook) and describes the following:

1. Data Files:  The main function that performs the analysis (**run_analysis.R**) reads the following x data files (in order of size):
  - X_train.txt (~63 Mb)
  - X_test.txt  (~25 Mb)
  - subject_train.txt (~20 Kb)
  - features.txt (~16 Kb)
  - subject_test.txt ()
  
2. Memory Usage:  
  - There are 7352 training records in the X_
3. variables tbd
4. transforms tdb


## Data
The raw data for this project was obtained from here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

which has been adapted from the original source on the **UCI Machine Learning Repository** at:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

and is located in the **data**, **data/test**, and **data/train** directories of this project.  The **code book** provides details on this data.

The tidied data is located in the **data/transforms** directory and is also described in the **code book**.

## R Scripts

TBD - describe how the R code used on the data

## References

Wickam H (2014). "_Tidy Data_ ". "_Journal of Statistical Software_" **59**(10), 1.  URL http://www.jstatsoft.org/v59/i10/paper

