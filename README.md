# Human Activity Recognition

## Contents  
- [Introduction](#id-intro)
- [Description](#id-description)  
- [Running the Analysis](#id-running-the-analysis)  
  - [Simple way to run the analysis script](#id-simple)
  - [Other ways to run the analysis script](#id-other)
  - [Performance](#id-perf)
- [Code Book](#id-codebook)  
- [Raw and Processed Data](#id-data)
  - [Raw data](#id-raw)
  - [Processed data](#id-processed)
- [The Tidy Data Set](#id-tidy)
- [References](#id-refs)

<div id='id-intro'/>
## Introduction
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).  Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.\[[6](#id-refs)\].  The data which this project works with comes from such a study of human activity as described [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

<div id='id-description'/>
## Description
The purpose of this project is to demonstrate the "_ability to collect, work with, and clean a data set_".  The specific objective, as described in the requirements for the [**Getting and Cleaning Data** course](https://class.coursera.org/getdata-030) project offered by Johns Hopkins through [**Coursera**](https://www.coursera.org/) is to produce "_**tidy data**_" (Wickham 2014) \[[1](#id-refs)\] from data collected on human activity recognition, by executing the following steps:

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
<div id='id-simple'/>
### Simple way to run the analysis script
The simplest way to run the analysis is to follow these steps:  

1. Download the **run_analysis.R** script from this project to a directory which you will use as your workspace.
2. Download the **UCI HAR Dataset.zip** file of the raw data set from the url listed below:
  - [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. If the downloaded file is not named **UCI HAR Dataset.zip**, rename it so that it is.
4. Start up R and set your workspace to the directory where you downloaded the **run_analysis.R** script and the **UCI HAR Dataset.zip** data files.
5. Source the **run_analysis.R** script by running <code>source("run_analysis.R")</code>
6. Type <code>run_analysis()</code> (no arguments) at the prompt after R has finished sourcing the script file and hit <code>Enter</code>.

The script will explode the zip file, read in the raw data files described in the [**Raw Data**](#id-raw) section and generates the files described in the [**Processed Data**](#id-processed) section which includes the tidy summarized output data set.  

<div id='id-other'/>
### Other ways to run the analysis script
The script has 4 parameters which can be set to run the script in different modes.  For those who wish a deeper understanding of how the script works and/or wish to explore utilizing the different execution modes, the comments for the **run\_analysis()** function are provided below along with the signature of the function.

<pre>
## This function takes four parameters:
##
## options - This tells the function how to obtain the data for the analysis.
##           The three allowed values are: "fromLocalZip", "fromScratch" or
##           "fromDeparsed".  These options can be described as follows:
##
##           "fromLocalZip" (default) - This directs the function to look for a
##                                      zip data file specified by the zipFile
##                                      parameter in the same directory from  
##                                      which this script is being run.
##           "fromDeparsed" - This directs the function to look for two deparsed
##                            dataframe object files that were constructed from
##                            the x_test.txt and x_train.txt files.  To run this
##                            option successfully, the function must be run
##                            using either the "fromLocalZip" or "fromScratch"
##                            options at least once before in order for the
##                            deparsed object files to be built.
##            "fromScratch" - This directs the function to download the zip
##                            file from the internet before proceeding with the
##                            analysis.  This option took just under 9 minutes
##                            on my i7 laptop with 16Gb of RAM, but should be
##                            used if the two other options fail to work.
##  zipFile - This is the name of the zip file of the dataset used for the 
##            analysis. Default value: "UCI HAR Dataset.zip"
##  zipDir - This is the directory which the script expects the raw data from
##           the exploded zip to reside. Default value is 'UCI HAR Dataset'
##  zipUrl - This is the url used to download the zip file for the dataset when
##           options = "fromScratch".  The default value is:
##  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## Here is a description of the exection steps taken by the function:
##
## 1) If option = "fromScratch", the HAR zip file is downloaded using the
##    default value for zipUrl as described above.
##    If options = "fromLocalZip" (default) or "fromDeparsed", skip to step 2)
## 2) If options = "fromLocalZip" (default), the file specified by zipFile is
##    read from the directory which this script is being run from, and the zip
##    file is exploded into a directory names "UCI HAR Dataset". An error will
##    result if the zip file could not be found or if the zip file explosion
##    creates a directory named something other than "UCI HAR Dataset".
## 3) The test and train feature data is then read into 2 data frames (dfs).
## 4) The test and train dfs are deparsed and written to the files:
##    UCI HAR Dataset/outputs/xtestdf.R and UCI HAR Dataset/outputs/xtraindf.R
##    respectively.  NOTE: This was done so that successive runs using:
##    options = "fromDeparsed" could bypass steps 1) through 3) to speed
##    successive executions.
## 5) The deparsed dfs created in step 3) are read into two dfs in memory:
## 6) The xtestdata and xtraindata dfs are combined into a single dataframe
##    called xdata.  This completed step 1. of the analysis as described in the
##    README.md file.
## 7) The feature.txt file is read and the feature names were set as the
##    column names for xdata.
## 8) The xdata df was subsetted to include only features that had "mean()" or
##    "std()" in their column names.  This completed step 2. of the analysis as
##    described in the README.md file.
## 9) The activities files (y_test.txt and y_train.txt) were read, a vector was
##    was built with the values from these files, the values in the vector were
##    replaced by the names of the activities defines in the
##    activities_labels.txt file, and then the updated vector was column bound
##    to the xdata df.  This completed step 3. of the analysis as described in
##    the README.md file.
##10) The column names of the features were revised to be more readable and
##    descriptive.  This completed step 4. of the analysis as described in the
##    README.md file.
##11) The xdata resulting from 10) was grouped by activity and subject and
##    summarized by applying the mean to each group of variable.
##12) The summarize table from 11) was then written a file called:
##    HARByActivityAndSubject.txt  using the command:
##
##    write.table(summarizedByActivityAndSubject,
##                file = "./output/HARByActivityAndSubject.txt"),
##                row.names = FALSE)
##
## If options is set to "fromDeparsed", this function needs to have been
## executed at least one time prior using options = "fromScratch" in order to
## build the deparsed xtestdf.R and xtraindf.R object files which the function
## reads in as described in step 4)
## 
run_analysis <- function(options = "fromLocalZip",
                         zipFile = "UCI HAR Dataset.zip",
                         zipDir = "UCI HAR Dataset",
                         zipUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") {
</pre>

<div id='id-perf'/>
### Performance
Running **run\_analysis()** using all the default settings for the parameters used to take about 9 minutes.  Data for several runs were collected and stored in the [**performance.txt**](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/performance.txt) file located in the root directory of this project.  These runs were done on my i7 laptop with 16 Gb of RAM running 64 bit Window 7 Pro.  This was greatly enhanced with some help from the **LaF** and **ffbase** libraries as explained below.

The fastest mode of operation however, is to run the script using the _fromDeparsed_ option **if the script as been run as least one time before and has generated the deparsed training and testing objects**.  If the <code>./UCI HAR Dataset/output/xtestdf.R</code> and <code>./UCI HAR Dataset/output/xtraindf.R</code> files have been built, then one could run:  

<code>run_analysis(options = "fromDeparsed")</code>  

to generate the output **which took less than 1 minute to run on my system.**.

#### Improving performance
In keeping with the spirit of avoiding the trap of "premature optimization is the root of all evil" (Knuth 1974) \[[3](#id-refs)\], work to improve the performance wasn't attempted until late in the project.  With only a couple hours before the deadline, I did find something that would dramatically improve performance of reading the large txt files into a dataframe (jwijffels 2013) \[[5](#id-refs)\].  Instead of reading in dataframes like this:

<pre>
library(dplyr)
library(downloader)

## ... other code from run_analysis.R ...

## Reads the data from a raw HAR data file and returns a dataframe.
## testData - TRUE if file to be read is the X_test.txt file
##            FALSE if the file to be read is the X_train.txt file
readXFromRawData <- function(testData) {
    rawDataFilePath <- NULL
    if(testData) {
        rawDataFilePath <- paste0(testDir, "/X_test.txt")
    }
    else {
        rawDataFilePath <- paste0(trainDir, "/X_train.txt")
    }
    # X_train.txt and X_test.txt files are both fixed width and have
    # 561 factors (variables). Each value is 15 characters seperated by
    # a space.
    xdata <- read.fwf(file = rawDataFilePath, rep(c(-1, 15), 561))
    
    return(xdata)
}
</pre>

They are now read in like this:

<pre>
library(dplyr)
library(downloader)
library(LaF)
library(ffbase)

## ... other code from run_analysis.R ...

## Reads the data from a raw HAR data file and returns a dataframe.
## testData - TRUE if file to be read is the X_test.txt file
##            FALSE if the file to be read is the X_train.txt file
readXFromRawData <- function(testData) {
    rawDataFilePath <- NULL
    rowCount <- NULL
    if(testData) {
        rawDataFilePath <- paste0(testDir, "/X_test.txt")
        rowCount <- 2947
    }
    else {
        rawDataFilePath <- paste0(trainDir, "/X_train.txt")
        rowCount <- 7352
    }
    # X_train.txt and X_test.txt files are both fixed width and have
    # 561 factors (variables). Each value is 15 characters seperated by
    # a space.
    #xdata <- read.fwf(file = rawDataFilePath, rep(c(-1, 15), 561)) # slow way
    
    colWidths <- rep(c(1, 15), 561)
    colTypes <- rep(c('character', 'numeric'), 561)
    keepCols <- seq(2, 1122, 2)
    xdata <- fastFwfRead(rawDataFilePath, colWidths, colTypes,
                         keepCols, rowCount)
    
    return(xdata)
}

## ... other code from run_analysis.R ...

## High performance FWF reads of X_test.txt and X_train.txt based on:
## http://stackoverflow.com/questions/18720036/reading-big-data-with-fixed-width
fastFwfRead <- function(rawDataFilePath, colWidths, colTypes,
                        keepCols, rowCount) {
    data.laf <- laf_open_fwf(rawDataFilePath, column_widths=colWidths,
                             column_types=colTypes)
    data.ffdf <- laf_to_ffdf(data.laf, nrows=rowCount)
    data.df <- as.data.frame(data.ffdf)
    
    data.df <- data.df[, keepCols]
    
    return(data.df)
}
</pre>

The implementation of **fastFwfRead** reduced running the analysis from about 9 minutes down to about 1.5 minutes!

#### Update 8/3/2015
Turns out that the data did not need to be read in as _fixed width format_ and a call to the R utils function **read.table()** was all that was needed and in fact was a little faster (the benefit of peer reviews!...).  The default analysis still took a little over a minute to run, but this was because it rebuilds the deparsed data files each time.  The latest version of the function that reads the data file looks like this:

<pre>
## Reads the data from a raw HAR data file and returns a dataframe.
## testData - TRUE if file to be read is the X_test.txt file
##            FALSE if the file to be read is the X_train.txt file
readXFromRawData <- function(testData) {
    rawDataFilePath <- NULL
    rowCount <- NULL
    if(testData) {
        rawDataFilePath <- paste0(testDir, "/X_test.txt")
        rowCount <- 2947
    }
    else {
        rawDataFilePath <- paste0(trainDir, "/X_train.txt")
        rowCount <- 7352
    }
    # X_train.txt and X_test.txt files are both fixed width and have
    # 561 factors (variables). Each value is 15 characters seperated by
    # a space.
    #xdata <- read.fwf(file = rawDataFilePath, rep(c(-1, 15), 561)) # slow way
    
#     colWidths <- rep(c(1, 15), 561)
#     colTypes <- rep(c('character', 'numeric'), 561)
#     keepCols <- seq(2, 1122, 2)
#     xdata <- fastFwfRead(rawDataFilePath, colWidths, colTypes,
#                          keepCols, rowCount)
    # thought I needed to read a fw, but a straight read.table works fine and 
    # is faster...
    xdata <- read.table(rawDataFilePath, colClasses = 'numeric')
    
    return(xdata)
}
</pre>

<div id='id-codebook'/>
## Code Book
The code book for this project is provided in the [**CodeBook.md** file](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/CodeBook.md) and describes the following:

1. Description of the Variables and how they were Renamed
2. Units and Ranges of the Variables
3. Variable Listing

<div id='id-data'/>
## Raw and Processed Data
<div id='id-raw'/>
### Raw Data
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
  - [y_train](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/train/y_train.txt)
    - list of activities performed corresponding to the training data set subjects
    - 7352 records, single field
    - ~15 kb
  - [subject\_test.txt](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/test/subject_test.txt)
    - list of subjects corresponding to the testing data set activities
    - 2947 records, single field
    - ~8 Kb
  - [y_test](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/test/y_test.txt)
    - list of activities performed corresponding to the testing data set subjects
    - 2947 records, single field
    - ~8 kb

<div id='id-processed'/>
### Processed Data
The processed data for this project is the data outputted by the **run_analysis()** function and resides in  
<code>./UCI HAR Dataset/output</code>  
relative to the current working directory.  The **output** directory contains 7 files:  

  - [HARByActivityAndSubject](https://github.com/MichaelSzczepaniak/HumanActivityRecognition/blob/master/UCI%20HAR%20Dataset/output/HARByActivityAndSubject.txt)
    - output from the completion of step 5. processing as described in the [**Description**](#id-description) section
    - This is the final output of the tidy dataset which was the objective of this project.
  - step1.txt
    - output from the completion of step 1. processing as described in the [**Description**](#id-description) section
  - step2.txt
    - output from the completion of step 2. processing as described in the [**Description**](#id-description) section
  - step3.txt
    - output from the completion of step 3. processing as described in the [**Description**](#id-description) section
  - step4.txt
    - output from the completion of step 4. processing as described in the [**Description**](#id-description) section
  - xtestdf.R
    - deparsed dataframe resulting from reading in the **X\_test.txt** file.
    - This enables the options = "fromDeparsed" mode along with **xtraindf.R** for running the **run\_analysis()** script in its fastest mode of operation.
  - xtraindf.R
    - deparsed dataframe resulting from reading in the **X\_train.txt** file.
    - This enables the options = "fromDeparsed" mode along with **xtestdf.R** for running the **run\_analysis()** script in its fastest mode of operation.

<div id='id-tidy'/>
## The Tidy Data Set
According to (Wickham 2014) \[[2](#id-refs)\], data is considered **tidy** when they possess three characteristics:

1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

This definition leaves room for what might be called a _wide form_ and a _narrow form_.  The narrow form collapses or _melts_ \[[4](#id-refs)\] columns with common value types into a single column such as shown in Table 5. of the Wickham paper:

![Molten table example](https://dl.dropboxusercontent.com/s/6t04fxyozi3enp6/wickham_table5.jpg)

When columns headers are themselves values and not variable names, the data is not considered tidy \[[4](#id-refs)\].  In such a case, melting is performed as a part of making the data tidy.  However, if column headers are truly variable names, then melting is optional because it is not required to make the data tidy.  When a tidy dataset is put into a molten form, that dataset is considered to be in the _narrow form_.  If the same tidy data set is not melted, it is considered to be in the _wide form_.

The wide form of the tidy data set was selected as the output form of the table resulting from step 5. processing.  This was done for the following reasons:

1. It is more space efficient.  The wide form dimensions of the step 5. output is 68 rows by 180 columns or 12,240 cells.  The narrow form would collapse (melt) 66 of the 68 wide form columns into one single column and add an additional column for the values.  The number of narrow form rows would be = (68 - 2) x (180) = 11,880.  Therefore, the narrow form dimensions would be 4 x 11,880 or 47,520 cells.
2. The form tidy data takes is primarily driven by the type of downstream analysis which needs to be performed.  Since the type of downstream analysis was not specified, the form that is most space efficient, computationally cheapest (converting to the narrow form would have required additional processing) and easiest to provide (more work/code to reshape the data would have been needed) was selected.

<div id='id-refs'/>
## References

[1] Wickham H (2014). "_Tidy Data_ ". "_Journal of Statistical Software_" **59**(10), page 1.  URL [http://www.jstatsoft.org/v59/i10/paper](http://www.jstatsoft.org/v59/i10/paper)  
[2] Wickham H (2014). "_Tidy Data_ ". "_Journal of Statistical Software_" **59**(10), page 4.  URL [http://www.jstatsoft.org/v59/i10/paper](http://www.jstatsoft.org/v59/i10/paper)  
[3] Knuth D E (1974). "_Computer Programming as an art_". "_Communcations of the ACM_" **17**(12), 671.  URL [http://delivery.acm.org/10.1145/370000/361612/a1974-knuth.pdf](http://delivery.acm.org/10.1145/370000/361612/a1974-knuth.pdf)  
[4] Wickham H (2014). "_Tidy Data_ ". "_Journal of Statistical Software_" **59**(10), pages 5-6.  URL [http://www.jstatsoft.org/v59/i10/paper](http://www.jstatsoft.org/v59/i10/paper)  
[5] Post by jwijffels at [http://stackoverflow.com/questions/18720036/reading-big-data-with-fixed-width](http://stackoverflow.com/questions/18720036/reading-big-data-with-fixed-width)  
[6] Leek, J (2015). "Getting and Cleaning Data" course project at [https://class.coursera.org/getdata-030](https://class.coursera.org/getdata-030)
